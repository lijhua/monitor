package junit.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lanyuan.entity.UserFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public class ResourcesServiceImplTest {

	private ApplicationContext ctx;

	@Before
	public void init() throws Exception {
		ctx = new ClassPathXmlApplicationContext("classpath:spring-*.xml");
	}

	@Test
	public void TestUser() {

		UserFormMap userFormMap = new UserFormMap();
		userFormMap.getRepository( (BaseMapper)ctx.getBean("baseMapper"));
		System.out.println(userFormMap.findByAll());
	}

}