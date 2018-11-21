package com.github.kwang2003.hrm.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.google.common.base.Strings;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class VerificationCodeFilter extends AbstractAuthenticationProcessingFilter{
    private String defaultFilterProcessesUrl;
    private boolean checkValidateCode = true;
    private String validateCodeParameter = "verifyCode";
    private String validateCodeSessionName = "verifyCode";

    public VerificationCodeFilter(String defaultFilterProcessesUrl) {
        super(defaultFilterProcessesUrl);
        this.defaultFilterProcessesUrl = defaultFilterProcessesUrl;
        setAuthenticationFailureHandler(new SimpleUrlAuthenticationFailureHandler("/loginPage"));
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        if ("POST".equalsIgnoreCase(request.getMethod()) && defaultFilterProcessesUrl.equals(request.getServletPath())) {
            log.info("开始验证码校验");
            if(checkValidateCode){
                checkValidateCode(request,response);
            }
        }
        chain.doFilter(req, res);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws AuthenticationException, IOException, ServletException {
        return null;
    }

    /**
     * 匹配验证码规则
     * @param request
     */
    protected void checkValidateCode(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        String sessionValidateCode = obtainSessionValidateCode(request);
        String validateCodeParameter = obtainValidateCodeParameter(request);
        // 验证码输入不能为空，不区分大小写
        if (Strings.isNullOrEmpty(validateCodeParameter) || !sessionValidateCode.equalsIgnoreCase(validateCodeParameter)) {
            unsuccessfulAuthentication(request,response,new InsufficientAuthenticationException("验证码不正确"));
        }
    }
        private String obtainValidateCodeParameter(HttpServletRequest request) {
            return request.getParameter(validateCodeParameter);
        }

        protected String obtainSessionValidateCode(HttpServletRequest request) {
            Object sessionCode = request.getSession().getAttribute(validateCodeSessionName);
            return null == sessionCode ? "" : sessionCode.toString();
}
}
