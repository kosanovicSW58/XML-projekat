package com.xmlvebservisi.config.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = {PositiveIntegerResolver.class})
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface PositiveInteger {
    String message() default "must be a positive whole number bigger than 0.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
