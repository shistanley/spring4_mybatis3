package com.stanley.support;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.util.JSONPObject;

public class JsonMapper {
	private static Logger logger = LoggerFactory.getLogger(JsonMapper.class);
	private static JsonMapper defaultMapper = buildNonNullMapper();
	private ObjectMapper mapper;

	public JsonMapper(Include inclusion) {
		this.mapper = new ObjectMapper();

		this.mapper.setSerializationInclusion(inclusion);

		// 反序列化时,遇到未知属性时是否引起结果失败
		this.mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		// 反序列化整数值校验枚举值
		this.mapper.configure(DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS, true);
	}

	public static JsonMapper getDefault() {
		return defaultMapper;
	}

	public static JsonMapper buildNormalMapper() {
		return new JsonMapper(Include.ALWAYS);
	}

	public static JsonMapper buildNonNullMapper() {
		return new JsonMapper(Include.NON_NULL);
	}

	public static JsonMapper buildNonDefaultMapper() {
		return new JsonMapper(Include.NON_DEFAULT);
	}

	public static JsonMapper buildNonEmptyMapper() {
		return new JsonMapper(Include.NON_EMPTY);
	}

	public void configure(MapperFeature feature, boolean state) {
		this.mapper.configure(feature, state);
	}

	public void configure(JsonParser.Feature feature, boolean state) {
		this.mapper.configure(feature, state);
	}

	public void configure(JsonGenerator.Feature feature, boolean state) {
		this.mapper.configure(feature, state);
	}

	public String toJson(Object object) {
		try {
			return this.mapper.writeValueAsString(object);
		} catch (IOException e) {
			logger.error("convert to json has error .", e);
		}
		return null;
	}

	public <T> T fromJson(String jsonString, Class<T> clazz) throws IOException {
		return this.mapper.readValue(jsonString, clazz);
	}

	public <T> T fromJsonIgnoreError(String jsonString, Class<T> clazz) {
		if (StringUtils.isBlank(jsonString)) {
			return null;
		}
		try {
			return this.mapper.readValue(jsonString, clazz);
		} catch (Exception e) {
			logger.error("解析JSON发生异常", e);
		}
		return null;
	}

	public <T> T fromJsonIgnoreError(String jsonString, JavaType javaType) {
		if (StringUtils.isBlank(jsonString)) {
			return null;
		}
		try {
			return this.mapper.readValue(jsonString, javaType);
		} catch (Exception e) {
			logger.error("解析JSON发生异常", e);
		}
		return null;
	}

	public <T> T fromJson(String jsonString, JavaType javaType) throws IOException {
		return this.mapper.readValue(jsonString, javaType);
	}

	public <T> T fromJson(InputStream is, Class<T> clazz) throws IOException {
		return this.mapper.readValue(is, clazz);
	}

	public <T> T fromJson(InputStream is, JavaType javaType) throws IOException {
		return this.mapper.readValue(is, javaType);
	}

	public JavaType constructParametricType(Class<?> parametrized, Class<?>... parameterClasses) {
		return this.mapper.getTypeFactory().constructParametricType(parametrized, parameterClasses);
	}

	public JavaType constructParametricType(Class<?> parametrized, JavaType javaType) {
		return this.mapper.getTypeFactory().constructParametricType(parametrized, new JavaType[] { javaType });
	}

	public JavaType constructParametricType(Class<?> parametrized, JavaType[] javaTypes) {
		return this.mapper.getTypeFactory().constructParametricType(parametrized, javaTypes);
	}

	public <T> T update(T object, String jsonString) throws IOException {
		return this.mapper.readerForUpdating(object).readValue(jsonString);
	}

	public String toJsonP(String functionName, Object object) {
		return toJson(new JSONPObject(functionName, object));
	}

	public void setEnumUseToString(boolean value) {
		this.mapper.configure(SerializationFeature.WRITE_ENUMS_USING_TO_STRING, value);
		this.mapper.configure(DeserializationFeature.READ_ENUMS_USING_TO_STRING, value);
	}

	public ObjectMapper getMapper() {
		return this.mapper;
	}

	public static String toJsonString(Map<String, String[]> parameterMap) {
		// TODO Auto-generated method stub
		return null;
	}
}
