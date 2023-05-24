package com.xmlvebservisi.dto.user;

import com.xmlvebservisi.config.annotations.NotBlank;
import com.xmlvebservisi.config.annotations.PositiveInteger;
import com.xmlvebservisi.model.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateUserDto {

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @NotBlank
    private String password;

    @NotBlank
    private String email;

    @NotBlank
    private String phoneNumber;

    @NotBlank
    private String faxNumber;

    @NotBlank
    private String address;

    @PositiveInteger
    private Integer addressNumber;

    @NotBlank
    private String city;

    @PositiveInteger
    private Integer postalCode;

    @NotBlank
    private String country;

    private Role role;
}
