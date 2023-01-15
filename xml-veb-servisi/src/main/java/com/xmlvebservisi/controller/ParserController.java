package com.xmlvebservisi.controller;

import com.xmlvebservisi.service.ParserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.http.MediaType.*;

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

    @PostMapping(value = "/store/{document_name}", produces = APPLICATION_XML_VALUE)
    public ResponseEntity<String> storeDocument(@PathVariable("document_name") String documentName) throws Exception {
        return parserService.storeXML(documentName);
    }

    @GetMapping(value = "/retrieve/{document_name}", produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> retrieveDocument(@PathVariable("document_name") String documentName) throws Exception {
        return parserService.retrieveXML(documentName);
    }
}
