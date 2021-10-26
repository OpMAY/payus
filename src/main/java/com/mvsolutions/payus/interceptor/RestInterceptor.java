package com.mvsolutions.payus.interceptor;

import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.AuthorizationTokenException;
import com.mvsolutions.payus.util.security.Security;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@Log4j
public class RestInterceptor implements HandlerInterceptor {
    @Value("${api.access_key}")
    private String access_key;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            String token = request.getHeader(HttpHeaders.AUTHORIZATION)
                    .substring(request.getHeader(HttpHeaders.AUTHORIZATION)
                            .lastIndexOf("bearer ") + 7);
            log.info("security access_key : " + access_key);
            if (new Security(access_key).validateToken(token)) {
                return true;
            } else {
                throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
            }
        } catch (NullPointerException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        } catch (Exception e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
