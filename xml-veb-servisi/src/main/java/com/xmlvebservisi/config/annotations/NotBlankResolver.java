package com.xmlvebservisi.config.annotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Component;

@Component
public class NotBlankResolver implements ConstraintValidator<NotBlank, String> {

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        System.out.println("####");
        return s != null && !s.isEmpty();
    }
}
