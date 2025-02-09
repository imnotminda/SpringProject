package spring.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:spring/db.properties")
@MapperScan("user.dao")
public class SpringConfiguration {
	
	private @Value("${jdbc.driver}")String driver;
	private @Value("${jdbc.url}")String url;
	private @Value("${jdbc.username}")String username;
	private @Value("${jdbc.password}")String password;
	
	@Autowired
	private ApplicationContext context;
	
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(driver);
		basicDataSource.setUrl(url);
		basicDataSource.setUsername(username);
		basicDataSource.setPassword(password);
		
		return basicDataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource()); //dataSource 값이 필요함 -> 위에서 가져옴
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
		
		//1개인 경우
		//sqlSessionFactoryBean.setMapperLocations(new ClassPathResource("mapper/userMapper.xml"));
		
		//mapper.xml이 여러개인 경우
		/*
		sqlSessionFactoryBean.setMapperLocations(
				new ClassPathResource("mapper/userMapper.xml"),
				new ClassPathResource("mapper/userUploadMapper.xml"));
		*/
		
		sqlSessionFactoryBean.setMapperLocations(context.getResources("classpath:mapper/*Mapper.xml"));
		
		//sqlSessionFactoryBean.setTypeAliasesPackage("user.bean"); //굳이 mybatis-config.xml 써서 alias 설정할 필요없음
		sqlSessionFactoryBean.setTypeAliasesPackage("*.bean"); //*로 잡아주면 모든 bean 다 가능 (복수가능)
		
		return sqlSessionFactoryBean.getObject(); //SqlSessionFactory 변환
	}
	
	@Bean
	public SqlSession sqlSession() throws Exception {
		SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
		return sqlSessionTemplate;
	}
	
	@Bean
	public TransactionManager transactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager(dataSource());
		return dataSourceTransactionManager;	
	}
	
}
