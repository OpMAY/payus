package com.mvsolutions.payus.util;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.UUID;

@Log4j2
@Service
@PropertySource("classpath:mail.properties")
public class EmailSendService {
    @Autowired
    JavaMailSender emailSender;

    @Value("${admin.mail.id}")
    private String adminEmailID;

    public String sendEmailForValidation(String toMail) {
        //TODO 1. Select Vendor From Email

        //Validation Code
        String validationCode = UUID.randomUUID().toString().substring(0, 8);

        String setFrom = adminEmailID;
        String title = "[PayUs] 비밀번호 찾기 인증 이메일입니다.";
        String content = System.getProperty("line.separator") + "안녕하세요. 공급자님" + System.getProperty("line.separator") + "PayUs 공급자 비밀번호 찾기 인증번호는 " + validationCode + "입니다." + System.getProperty("line.separator") + "인증 화면에서 해당 코드를 입력해주세요." + System.getProperty("line.separator");

        try{
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
            messageHelper.setFrom(setFrom);
            messageHelper.setTo(toMail);
            messageHelper.setSubject(title);
            messageHelper.setText(content);
            emailSender.send(message);
        } catch (MessagingException e) {
            log.error("", e);
        }

        return validationCode;
    }
}
