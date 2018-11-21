package com.github.kwang2003.hrm.config;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.google.common.collect.Lists;

import freemarker.ext.jsp.TaglibFactory;

@Configuration
public class FreemarkerConfig {
	@Autowired
	FreeMarkerConfigurer freeMarkerConfigurer;

	@PostConstruct
	public void setSharedVariable(){
		TaglibFactory taglibFactory = freeMarkerConfigurer.getTaglibFactory();
		List<String> classpathTlds = Lists.newArrayList();
		classpathTlds.add("/META-INF/security.tld");
		taglibFactory.setClasspathTlds(classpathTlds);
	}
}
