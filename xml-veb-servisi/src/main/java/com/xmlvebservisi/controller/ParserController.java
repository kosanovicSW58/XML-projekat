package com.xmlvebservisi.controller;

import com.xmlvebservisi.service.ParserService;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
@RequiredArgsConstructor
@RequestMapping("/parser")
public class ParserController {

    private final ParserService parserService;

    @GetMapping(value = "/{document_name}",produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> parseDocument(@PathVariable("document_name") String documentName) throws Exception {
        return parserService.readDocument(documentName);
    }

    @GetMapping(value = "/validate/{document_name}",produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> validateDocument(@PathVariable("document_name") String documentName) {
        return parserService.validateDocument(documentName);
    }

    @PostMapping(value = "/document_name",consumes = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> writeDocument(@PathVariable("document_name") String documentName) throws Exception {
        return parserService.writeDocument(documentName);
    }
}
