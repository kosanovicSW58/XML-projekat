package com.xmlvebservisi.dto.user;

import com.xmlvebservisi.config.annotations.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginUserDto {

    @NotBlank
    private String email;

    @NotBlank
    private String password;
}
