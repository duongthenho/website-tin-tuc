package com.devpro.conf;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Cấu hình View.
 * @author admin
 *
 */
@Configuration // <-> Bean
@ControllerAdvice
@EnableWebMvc
@ComponentScan(basePackages = { "com.devpro" }) // <-> root package
public class MVCConf implements WebMvcConfigurer {
	
	private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(MVCConf.class);
	/**
	 * Chỉ cho Controller biết nơi chứa các trang HTML.
	 * @return
	 */
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	/**
	 * Mapping JS và CSS.
	 * Notes:
	 * 1. classpath <-> src/main/resources
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/web/css/**").addResourceLocations("classpath:/META-INF/web/css/");
		registry.addResourceHandler("/web/js/**").addResourceLocations("classpath:/META-INF/web/js/");
		registry.addResourceHandler("/web/img/**").addResourceLocations("classpath:/META-INF/web/img/");

		
		registry.addResourceHandler("/admin/css/**").addResourceLocations("classpath:/META-INF/admin/css/");
		registry.addResourceHandler("/admin/js/**").addResourceLocations("classpath:/META-INF/admin/js/");
		registry.addResourceHandler("/admin/img/**").addResourceLocations("classpath:/META-INF/admin/img/");
		
		
		registry.addResourceHandler("/vendor/**").addResourceLocations("classpath:/META-INF/vendor/");		
		registry.addResourceHandler("/summernote/**").addResourceLocations("classpath:/META-INF/summernote/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/META-INF/images/");
		
	}
	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		
		if(e instanceof org.springframework.web.servlet.NoHandlerFoundException) { // 404
			// Otherwise setup and send the user to a default error-view.
			ModelAndView mav = new ModelAndView();
			mav.addObject("exception", e);
			mav.addObject("url", req.getRequestURL());
			mav.setViewName("errors/404");
			return mav;
		} else {
			// Otherwise setup and send the user to a default error-view.
			ModelAndView mav = new ModelAndView();
			mav.addObject("exception", e);
			mav.addObject("url", req.getRequestURL());
			mav.setViewName("errors/common");
			return mav;
		}
	}
}
