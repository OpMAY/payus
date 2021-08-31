# springboot
## Project Info
Project SDK Java 1.8 (java version 1.8.0_201)
Project Language Level 8 (Lambdas, type annotations etc.)
Project Compile Output "C:\...path\[project_root(project_name)]\out"
Project Source Root
  ```
  Source Folders : src\main\java
  Test Source Folders : src\test\java
  Resource Folders : src\main\resources
  Excluded Folders : target
  ```
## 배포시 유의사항
아래의 해당 사항을 모두 생성해주셔야 합니다.
위치는 "src/main/resources/" 입니다.
### application.properties
```
spring.datasource.hikari.jdbc-url=jdbc:mysql://127.0.0.1:3306/flowtest?serverTimezone=UTC&allowMultiQueries=true
spring.datasource.hikari.username=root
spring.datasource.hikari.password=root
spring.datasource.hikari.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.hikari.pool-name=bootpool
spring.datasource.hikari.max-lifetime=30000
spring.datasource.hikari.connection-timeout=30000
spring.datasource.hikari.validation-timeout=5000
spring.datasource.hikari.transaction-isolation=TRANSACTION_READ_UNCOMMITTED

api.access_key=ZAgQxJXfLPyM8tRV1TGfk3OiP94NqoWD

server.servlet.encoding.charset=utf-8
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
server.port=8080
```
### aws.properties
```
aws.accessKey=testproperties
aws.secretKey=testproperties
aws.bucketName=testproperties
```
### path.properties
```
path.upload_path=C:/Users/zlzld/OneDrive/Desktop/projects/springboot1/demo/target/demo-0.0.1-SNAPSHOT/WEB-INF/files/
```

## Maven
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.5.4</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.boot</groupId>
	<artifactId>demo</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>demo</name>
	<packaging>war</packaging>
	<description>Demo project for Spring Boot</description>
	<properties>
		<org.slf4j-version>1.6.6</org.slf4j-version>
		<log4j-version>1.2.17</log4j-version> <!--Logger Version-->
		<java.version>1.8</java.version>
		<aws-sdk-version>1.11.327</aws-sdk-version> <!--AWS Version-->
	</properties>
	<dependencies>
		<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger2</artifactId>
			<version>2.9.2</version>
		</dependency>
		<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger-ui</artifactId>
			<version>2.9.2</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
			<exclusions>
				<exclusion>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-starter-logging</artifactId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-tomcat</artifactId>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web-services</artifactId>
		</dependency>
		<dependency>
			<groupId>org.mybatis.spring.boot</groupId>
			<artifactId>mybatis-spring-boot-starter</artifactId>
			<version>2.2.0</version>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-configuration-processor</artifactId>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
		</dependency>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.9</version>
			<scope>test</scope>
		</dependency>
		<!--로그 설정-->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${org.slf4j-version}</version>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>jcl-over-slf4j</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>${log4j-version}</version>
			<exclusions>
				<exclusion>
					<groupId>javax.mail</groupId>
					<artifactId>mail</artifactId>
				</exclusion>
				<exclusion>
					<groupId>javax.jms</groupId>
					<artifactId>jms</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jdmk</groupId>
					<artifactId>jmxtools</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jmx</groupId>
					<artifactId>jmxri</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<!--Amazon CDN-->
		<dependency>
			<groupId>com.amazonaws</groupId>
			<artifactId>aws-java-sdk-s3</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-aws</artifactId>
			<version>2.2.1.RELEASE</version>
			<type>pom</type>
		</dependency>
		<dependency>
			<groupId>commons-io</groupId>
			<artifactId>commons-io</artifactId>
			<version>2.6</version>
		</dependency>
		<!--File Download-->
		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
			<version>1.3.2</version>
		</dependency>
		<!-- 파일업로드 관련 : 이미지 썸네일 생성 라이브러리-->
		<dependency>
			<groupId>org.imgscalr</groupId>
			<artifactId>imgscalr-lib</artifactId>
			<version>4.2</version>
		</dependency>
	</dependencies>
	<!--Amazon CDN Maven-->
	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>com.amazonaws</groupId>
				<artifactId>aws-java-sdk-bom</artifactId>
				<version>${aws-sdk-version}</version>
				<type>pom</type>
				<scope>import</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<configuration>
					<excludes>
						<exclude>
							<groupId>org.projectlombok</groupId>
							<artifactId>lombok</artifactId>
						</exclude>
					</excludes>
				</configuration>
			</plugin>
		</plugins>
	</build>

</project>
```
