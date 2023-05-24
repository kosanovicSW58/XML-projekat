package com.xmlvebservisi.config.annotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Component;

@Component
public class PositiveIntegerResolver implements ConstraintValidator<PositiveInteger, Integer> {

    @Override
    public boolean isValid(Integer integer, ConstraintValidatorContext constraintValidatorContext) {
        return integer > 0;
    }
}
