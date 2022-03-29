package yunseunghwan.used.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppConfig implements WebMvcConfigurer {
	@Value("${attachPath}") private String attachPath;
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/used").setViewName("main");
		registry.addViewController("/admin").setViewName("admin/main");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("res/**").addResourceLocations("/res/");
		registry.addResourceHandler("attach/**").addResourceLocations("file:///" + attachPath + "/");
	}
	
}
