package com.xmlvebservisi.config.annotations;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Component;

@Component
public class NotBlankResolver implements ConstraintValidator<NotBlank, String> {

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if (s != null) {
            return s.trim().length() != 0;
        }
        return false;
    }
}
