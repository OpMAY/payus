package com.mvsolutions.payus.advice;

import com.mvsolutions.payus.exception.rest.AuthorizationTokenException;
import com.mvsolutions.payus.exception.rest.GrantAccessDeniedException;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.StatusCode;
import lombok.extern.log4j.Log4j2;
import org.json.JSONException;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.io.FileNotFoundException;

/**
 * 모든 Http Status Code
 * CONTINUE(100, HttpStatus.Series.INFORMATIONAL, "Continue"),
 * SWITCHING_PROTOCOLS(101, HttpStatus.Series.INFORMATIONAL, "Switching Protocols"),
 * PROCESSING(102, HttpStatus.Series.INFORMATIONAL, "Processing"),
 * CHECKPOINT(103, HttpStatus.Series.INFORMATIONAL, "Checkpoint"),
 * OK(200, HttpStatus.Series.SUCCESSFUL, "OK"),
 * CREATED(201, HttpStatus.Series.SUCCESSFUL, "Created"),
 * ACCEPTED(202, HttpStatus.Series.SUCCESSFUL, "Accepted"),
 * NON_AUTHORITATIVE_INFORMATION(203, HttpStatus.Series.SUCCESSFUL, "Non-Authoritative Information"),
 * NO_CONTENT(204, HttpStatus.Series.SUCCESSFUL, "No Content"),
 * RESET_CONTENT(205, HttpStatus.Series.SUCCESSFUL, "Reset Content"),
 * PARTIAL_CONTENT(206, HttpStatus.Series.SUCCESSFUL, "Partial Content"),
 * MULTI_STATUS(207, HttpStatus.Series.SUCCESSFUL, "Multi-Status"),
 * ALREADY_REPORTED(208, HttpStatus.Series.SUCCESSFUL, "Already Reported"),
 * IM_USED(226, HttpStatus.Series.SUCCESSFUL, "IM Used"),
 * MULTIPLE_CHOICES(300, HttpStatus.Series.REDIRECTION, "Multiple Choices"),
 * MOVED_PERMANENTLY(301, HttpStatus.Series.REDIRECTION, "Moved Permanently"),
 * FOUND(302, HttpStatus.Series.REDIRECTION, "Found"),
 * MOVED_TEMPORARILY(302, HttpStatus.Series.REDIRECTION, "Moved Temporarily"),
 * SEE_OTHER(303, HttpStatus.Series.REDIRECTION, "See Other"),
 * NOT_MODIFIED(304, HttpStatus.Series.REDIRECTION, "Not Modified"),
 * USE_PROXY(305, HttpStatus.Series.REDIRECTION, "Use Proxy"),
 * TEMPORARY_REDIRECT(307, HttpStatus.Series.REDIRECTION, "Temporary Redirect"),
 * PERMANENT_REDIRECT(308, HttpStatus.Series.REDIRECTION, "Permanent Redirect"),
 * BAD_REQUEST(400, HttpStatus.Series.CLIENT_ERROR, "Bad Request"),
 * UNAUTHORIZED(401, HttpStatus.Series.CLIENT_ERROR, "Unauthorized"),
 * PAYMENT_REQUIRED(402, HttpStatus.Series.CLIENT_ERROR, "Payment Required"),
 * FORBIDDEN(403, HttpStatus.Series.CLIENT_ERROR, "Forbidden"),
 * NOT_FOUND(404, HttpStatus.Series.CLIENT_ERROR, "Not Found"),
 * METHOD_NOT_ALLOWED(405, HttpStatus.Series.CLIENT_ERROR, "Method Not Allowed"),
 * NOT_ACCEPTABLE(406, HttpStatus.Series.CLIENT_ERROR, "Not Acceptable"),
 * PROXY_AUTHENTICATION_REQUIRED(407, HttpStatus.Series.CLIENT_ERROR, "Proxy Authentication Required"),
 * REQUEST_TIMEOUT(408, HttpStatus.Series.CLIENT_ERROR, "Request Timeout"),
 * CONFLICT(409, HttpStatus.Series.CLIENT_ERROR, "Conflict"),
 * GONE(410, HttpStatus.Series.CLIENT_ERROR, "Gone"),
 * LENGTH_REQUIRED(411, HttpStatus.Series.CLIENT_ERROR, "Length Required"),
 * PRECONDITION_FAILED(412, HttpStatus.Series.CLIENT_ERROR, "Precondition Failed"),
 * PAYLOAD_TOO_LARGE(413, HttpStatus.Series.CLIENT_ERROR, "Payload Too Large"),
 * REQUEST_ENTITY_TOO_LARGE(413, HttpStatus.Series.CLIENT_ERROR, "Request Entity Too Large"),
 * URI_TOO_LONG(414, HttpStatus.Series.CLIENT_ERROR, "URI Too Long"),
 * REQUEST_URI_TOO_LONG(414, HttpStatus.Series.CLIENT_ERROR, "Request-URI Too Long"),
 * UNSUPPORTED_MEDIA_TYPE(415, HttpStatus.Series.CLIENT_ERROR, "Unsupported Media Type"),
 * REQUESTED_RANGE_NOT_SATISFIABLE(416, HttpStatus.Series.CLIENT_ERROR, "Requested range not satisfiable"),
 * EXPECTATION_FAILED(417, HttpStatus.Series.CLIENT_ERROR, "Expectation Failed"),
 * I_AM_A_TEAPOT(418, HttpStatus.Series.CLIENT_ERROR, "I'm a teapot"),
 * INSUFFICIENT_SPACE_ON_RESOURCE(419, HttpStatus.Series.CLIENT_ERROR, "Insufficient Space On Resource"),
 * METHOD_FAILURE(420, HttpStatus.Series.CLIENT_ERROR, "Method Failure"),
 * DESTINATION_LOCKED(421, HttpStatus.Series.CLIENT_ERROR, "Destination Locked"),
 * UNPROCESSABLE_ENTITY(422, HttpStatus.Series.CLIENT_ERROR, "Unprocessable Entity"),
 * LOCKED(423, HttpStatus.Series.CLIENT_ERROR, "Locked"),
 * FAILED_DEPENDENCY(424, HttpStatus.Series.CLIENT_ERROR, "Failed Dependency"),
 * TOO_EARLY(425, HttpStatus.Series.CLIENT_ERROR, "Too Early"),
 * UPGRADE_REQUIRED(426, HttpStatus.Series.CLIENT_ERROR, "Upgrade Required"),
 * PRECONDITION_REQUIRED(428, HttpStatus.Series.CLIENT_ERROR, "Precondition Required"),
 * TOO_MANY_REQUESTS(429, HttpStatus.Series.CLIENT_ERROR, "Too Many Requests"),
 * REQUEST_HEADER_FIELDS_TOO_LARGE(431, HttpStatus.Series.CLIENT_ERROR, "Request Header Fields Too Large"),
 * UNAVAILABLE_FOR_LEGAL_REASONS(451, HttpStatus.Series.CLIENT_ERROR, "Unavailable For Legal Reasons"),
 * INTERNAL_SERVER_ERROR(500, HttpStatus.Series.SERVER_ERROR, "Internal Server Error"),
 * NOT_IMPLEMENTED(501, HttpStatus.Series.SERVER_ERROR, "Not Implemented"),
 * BAD_GATEWAY(502, HttpStatus.Series.SERVER_ERROR, "Bad Gateway"),
 * SERVICE_UNAVAILABLE(503, HttpStatus.Series.SERVER_ERROR, "Service Unavailable"),
 * GATEWAY_TIMEOUT(504, HttpStatus.Series.SERVER_ERROR, "Gateway Timeout"),
 * HTTP_VERSION_NOT_SUPPORTED(505, HttpStatus.Series.SERVER_ERROR, "HTTP Version not supported"),
 * VARIANT_ALSO_NEGOTIATES(506, HttpStatus.Series.SERVER_ERROR, "Variant Also Negotiates"),
 * INSUFFICIENT_STORAGE(507, HttpStatus.Series.SERVER_ERROR, "Insufficient Storage"),
 * LOOP_DETECTED(508, HttpStatus.Series.SERVER_ERROR, "Loop Detected"),
 * BANDWIDTH_LIMIT_EXCEEDED(509, HttpStatus.Series.SERVER_ERROR, "Bandwidth Limit Exceeded"),
 * NOT_EXTENDED(510, HttpStatus.Series.SERVER_ERROR, "Not Extended"),
 * NETWORK_AUTHENTICATION_REQUIRED(511, HttpStatus.Series.SERVER_ERROR, "Network Authentication Required");
 */

@Log4j2
@RestControllerAdvice(basePackages = "com.mvsolutions.payus.restcontroller")
public class RESTExceptionAdvice {

    /**
     * Security Auth 인증 관련 에러
     */
    @ExceptionHandler(AuthorizationTokenException.class)
    public ResponseEntity handleAuthorizationTokenException(AuthorizationTokenException e) {
        log.error("", e);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.UNAUTHORIZED);
    }


    /**
     * JSON 파싱, 역파싱 관련 Exception 발생시
     */
    @ExceptionHandler(JSONException.class)
    protected ResponseEntity handleJSONException(JSONException e) {
        log.error("", e);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * Schedule Exception 발생시
     */
    @ExceptionHandler(InterruptedException.class)
    protected void handleInterruptedException(InterruptedException e) {
        log.error("", e);
    }

    /**
     * 잘못된 Handler URI를 사용 했을때 NoHandlerFoundException 발생
     */
    @ExceptionHandler(NoHandlerFoundException.class)
    protected ResponseEntity handleNoHandlerFoundException(NoHandlerFoundException e) {
        log.error("", e);
        log.info("handleNoHandlerFoundException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.NOT_FOUND);
    }

    /**
     * 권한이 부족 및 없을 때 GrantAccessDeniedException 발생
     */
    @ExceptionHandler(GrantAccessDeniedException.class)
    protected ResponseEntity handleGrantAccessDeniedException(GrantAccessDeniedException e) {
        log.error("", e);
        log.info("handleGrantAccessDeniedException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.FORBIDDEN);
    }

    /**
     * javax.validation.Valid or @Validated 으로 binding error 발생시 발생한다.
     * HttpMessageConverter 에서 등록한 HttpMessageConverter binding 못할경우 발생
     * 주로 @RequestBody, @RequestPart 어노테이션에서 발생
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    protected ResponseEntity handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        log.error("", e);
        log.info("handleMethodArgumentNotValidException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.BAD_REQUEST);
    }

    /**
     * @ModelAttribut 으로 binding error 발생시 BindException 발생한다.
     * ref https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html#mvc-ann-modelattrib-method-args
     */
    @ExceptionHandler(BindException.class)
    protected ResponseEntity handleBindException(BindException e) {
        log.error("", e);
        log.info("handleBindException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.BAD_REQUEST);
    }

    /**
     * enum type 일치하지 않아 binding 못할 경우 발생
     * 주로 @RequestParam enum으로 binding 못했을 경우 발생
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    protected ResponseEntity handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e) {
        log.error("", e);
        log.info("handleMethodArgumentTypeMismatchException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.BAD_REQUEST);
    }

    /**
     * 지원하지 않은 HTTP method 호출 할 경우 발생
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    protected ResponseEntity handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        log.error("", e);
        log.info("handleHttpRequestMethodNotSupportedException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NullPointerException.class)
    protected ResponseEntity handleNullPointerException(Exception e) {
        log.error("", e);
        log.info("NullPointerException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(Exception.class)
    protected ResponseEntity handleException(Exception e) {
        log.error("", e);
        log.info("Global General Exception");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(FileNotFoundException.class)
    protected ResponseEntity handleFileNotFoundException(FileNotFoundException e) {
        log.error("", e);
        log.info("handleFileNotFoundException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.NO_CONTENT);
    }

    @ExceptionHandler(MyBatisSystemException.class)
    protected ResponseEntity myBatisSystemException(MyBatisSystemException e) {
        log.error("", e);
        log.info("myBatisSystemException");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
