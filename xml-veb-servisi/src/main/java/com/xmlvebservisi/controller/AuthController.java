package com.xmlvebservisi.controller;

import com.xmlvebservisi.dto.user.CreateUserDto;
import com.xmlvebservisi.dto.user.LoginUserDto;
import com.xmlvebservisi.service.AuthService;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;

    @PostMapping(path = "/register", consumes = APPLICATION_JSON_VALUE, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<?> register(@Valid @RequestBody CreateUserDto createUserDto) throws Exception {
        return authService.registerUser(createUserDto);
    }

    @PostMapping(path = "/login", consumes = APPLICATION_JSON_VALUE, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<?> login(@RequestBody LoginUserDto loginUserDto) {
        return authService.login(loginUserDto);
    }
}
