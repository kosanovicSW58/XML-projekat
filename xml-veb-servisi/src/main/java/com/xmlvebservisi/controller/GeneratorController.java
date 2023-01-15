package com.xmlvebservisi.controller;

import com.xmlvebservisi.service.GeneratorService;
import java.io.IOException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
@RequiredArgsConstructor
@RequestMapping("/generate")
public class GeneratorController {

    private final GeneratorService generatorService;

    @GetMapping(value = "/pdf/{document_name}",produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> generatePdfFromDocument(@PathVariable("document_name") String documentName) throws IOException, SAXException {
        return generatorService.generatePdfFromDocument(documentName);
    }

    @GetMapping(value = "/xhtml/{document_name}",produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> generateXhtmlFromDocument(@PathVariable("document_name") String documentName) {
        return generatorService.generateXhtmlFromDocument(documentName);
    }
}
