---
name: java-spring-initializr
description: Spring Boot 项目初始化。当用户提到 "Spring Boot", "Spring 项目", "新建 Spring", "初始化项目" 时自动触发。
allowed-tools: Write, Bash, Read, WebFetch
model: opus
---

# Spring Boot 项目初始化

快速创建 Spring Boot 项目骨架。

## 使用方式

提供以下信息即可生成完整项目：
- **项目名称**: 如 `user-service`
- **Java 版本**: 17 / 21（推荐 21）
- **Spring Boot 版本**: 3.3.x（最新稳定版）
- **依赖**: Web, JPA, MySQL, Security, Lombok, Validation, Actuator, Test

## 项目结构

```
{project-name}/
├── pom.xml
├── src/
│   ├── main/java/com/example/{project}/
│   │   ├── {Project}Application.java
│   │   ├── controller/
│   │   ├── service/
│   │   │   └── impl/
│   │   ├── repository/
│   │   ├── model/
│   │   │   ├── entity/
│   │   │   └── dto/
│   │   ├── config/
│   │   ├── exception/
│   │   └── util/
│   └── main/resources/
│       ├── application.yml
│       └── application-dev.yml
```

## 生成 pom.xml 模板

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.3.5</version>
    </parent>
    <groupId>com.example</groupId>
    <artifactId>{project-name}</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>{project-name}</name>
    
    <properties>
        <java.version>21</java.version>
    </properties>
    
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
    </dependencies>
</project>
```

## application.yml 模板

```yaml
server:
  port: 8080

spring:
  application:
    name: {project-name}
  profiles:
    active: dev

logging:
  level:
    com.example: DEBUG
```

## 生成主类

```java
package com.example.{project};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class {Project}Application {
    public static void main(String[] args) {
        SpringApplication.run({Project}Application.class, args);
    }
}
```
