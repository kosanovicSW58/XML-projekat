package com.xmlvebservisi.service;

import com.xmlvebservisi.dto.user.CreateUserDto;
import com.xmlvebservisi.dto.user.LoginUserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import rs.ftn_intelektualna_svojina.tipovi.Adresa;
import rs.ftn_intelektualna_svojina.tipovi.Kontakt;
import rs.ftn_intelektualna_svojina.tipovi.Korisnik;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final PasswordEncoder passwordEncoder;

    public ResponseEntity<?> registerUser(CreateUserDto createUserDto) {
        Korisnik user = new Korisnik();
        Adresa address = new Adresa();

        Kontakt kontakt = new Kontakt();
        kontakt.setEmail(createUserDto.getEmail());
        kontakt.setFaks(createUserDto.getFaxNumber());
        kontakt.setTelefon(createUserDto.getPhoneNumber());

        Adresa.Ulica street = new Adresa.Ulica();
        street.setBroj(createUserDto.getAddressNumber());
        street.setNaziv(createUserDto.getAddress());

        address.setUlica(street);
        address.setMesto(createUserDto.getCity());
        address.setPostanskiBroj(createUserDto.getPostalCode());
        address.setDrzava(createUserDto.getCountry());

        user.setAdresa(address);
        user.setIme(createUserDto.getFirstName());
        user.setPrezime(createUserDto.getLastName());
        user.setKontakt(kontakt);
        user.setTipNaloga(createUserDto.getRole().name());
        user.setLozinka(passwordEncoder.encode(createUserDto.getPassword()));

        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    public ResponseEntity<?> login(LoginUserDto loginUserDto) {
        return null;
    }
}
