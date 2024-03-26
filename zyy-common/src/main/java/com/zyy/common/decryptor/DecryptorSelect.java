package com.zyy.common.decryptor;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.LOCAL_VARIABLE, ElementType.METHOD, ElementType.FIELD})
public @interface DecryptorSelect {
    int value() default -1;
}
