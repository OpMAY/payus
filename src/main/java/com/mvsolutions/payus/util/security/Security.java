package com.mvsolutions.payus.util.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.AuthorizationTokenException;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Log4j
public class Security {
    private String access_key;

    public Security(String access_key) {
        this.access_key = access_key;
    }

    public String encryptionJWT() {
        Algorithm algorithm = Algorithm.HMAC256("secret");
        return JWT.create()
                .withExpiresAt(Time.LongTimeStamp())
                .withClaim("signature", encryptionSHA256(access_key))
                .withIssuer("auth0")
                .sign(algorithm);
    }

    /**
     * SHA-256으로 해싱하는 메소드
     *
     * @param msg
     * @return bytes
     * @throws NoSuchAlgorithmException
     */
    public String encryptionSHA256(String msg) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(msg.getBytes());
            return bytesToHex(md.digest());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 바이트를 헥스값으로 변환한다.
     *
     * @param bytes
     * @return
     */
    public String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }

    public String createToken() {
        return encryptionJWT();
    }

    public boolean validateToken(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("auth0")
                    .build(); //Reusable verifier instance
            DecodedJWT jwt = verifier.verify(token);
            String signature = jwt.getClaim("signature").asString();

            /** Signature & name Valid Checker*/
            if (!signature.equals(encryptionSHA256(access_key))) {
                return false;
            }

            /** Timer Limit Valid Checker*/
            return jwt.getExpiresAt().getTime() <= Time.LongTimeStamp().getTime();
        } catch (NullPointerException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        } catch (JWTDecodeException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        } catch (JWTVerificationException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        } catch (JWTCreationException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        } catch (Exception e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        }
    }
}
