package com.xmlvebservisi.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SingleTagDto {

    @NotBlank
    private String tagName;

    @NotBlank
    private String tagValue;
}
