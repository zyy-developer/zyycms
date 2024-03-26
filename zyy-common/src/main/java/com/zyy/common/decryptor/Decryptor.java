package com.zyy.common.decryptor;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

@Aspect
@Component
public class Decryptor {

    @Before("@annotation(DecryptorAdd)")
    public void DecryptorAdd(JoinPoint joinPoint) throws Exception {
        Object[] args = joinPoint.getArgs();
        Object target = args[0];
        Field[] fields = target.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(DecryptorAdd.class)) {
                field.setAccessible(true);
                String encryptedValue = (String) field.get(target);
                if (encryptedValue == null){
                    continue;
                }
                String decryptedValue = DecryptorUtil.decryptByPrivateKey(encryptedValue);
                field.set(target, decryptedValue);
            }
        }
    }
    @AfterReturning(pointcut = "@annotation(DecryptorSelect)", returning = "result")
    public void encryptFields(JoinPoint joinPoint, Object result) throws Throwable {
        if (result instanceof Map) {
            Map<Object, Object> result1 = (Map<Object, Object>) result;
            Object data = result1.get("data");// 获取字段的值
            if (data instanceof List){
                List<?> newData = (List<?>) data;
                for (int i = 0; i < newData.size(); i++) {
                    Field[] fields = newData.get(i).getClass().getDeclaredFields();
                    for (Field fieldTwo : fields) {
                        if (fieldTwo.isAnnotationPresent(DecryptorAdd.class)) {
                            fieldTwo.setAccessible(true);
                            Object value = fieldTwo.get(newData.get(i));
                            if (value != null && value instanceof String) {
                                String encryptedValue = DecryptorUtil.encryptByPublicKey((String) value);
                                fieldTwo.set(newData.get(i), encryptedValue);
                            }
                        }
                    }
                }
            }
            Field[] fields = data.getClass().getDeclaredFields();
            for (Field fieldTwo : fields) {
                if (fieldTwo.isAnnotationPresent(DecryptorAdd.class)) {
                    fieldTwo.setAccessible(true);
                    Object value = fieldTwo.get(data);
                    if (value != null && value instanceof String) {
                        String encryptedValue = DecryptorUtil.encryptByPublicKey((String) value);
                        fieldTwo.set(data, encryptedValue);
                    }
                }
            }
        }
        // 使用反射获取对象的字段和属性
        Class<?> resultClass = result.getClass();
        Field[] fields2 = resultClass.getDeclaredFields();
        for (Field field : fields2) {
            field.setAccessible(true); // 设置字段可访问
            try {
                if (field.getName() == "rows") {
                    List fieldValue = (List) field.get(result); // 获取字段的值
                    for (int i = 0; i < fieldValue.size(); i++) {
                        Field[] fields = fieldValue.get(i).getClass().getDeclaredFields();
                        for (Field fieldTwo : fields) {
                            if (fieldTwo.isAnnotationPresent(DecryptorAdd.class)) {
                                fieldTwo.setAccessible(true);
                                Object value = fieldTwo.get(fieldValue.get(i));
                                if (value != null && value instanceof String) {
                                    String encryptedValue = DecryptorUtil.encryptByPublicKey((String) value);
                                    fieldTwo.set(fieldValue.get(i), encryptedValue);
                                }
                            }
                        }
                    }
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }

}


