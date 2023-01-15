package com.xmlvebservisi.service;

import com.xmlvebservisi.handler.SAXSchemaHandler;
import com.xmlvebservisi.repository.StoreAndRetrieveXML;
import com.xmlvebservisi.util.ParserUtils;
import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import static com.xmlvebservisi.util.ParserUtils.documentNameIsNotValid;

@Service
@RequiredArgsConstructor
public class ParserService {

    private static final String XML_PATH = "src/main/resources/data/xml/";
    private static final String XSD_PATH = "src/main/resources/data/xsd/";

    public ResponseEntity<String> readDocument(String documentName) throws Exception {
        if(documentNameIsNotValid(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }
        ParserUtils.printNode(parseDocument(documentName));
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<String> validateDocument(String documentName){
        if(documentNameIsNotValid(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }

        String schemaDocumentPath = String.format("%s%s.xsd",XSD_PATH,documentName);
        String xmlDocumentPath = String.format("%s%s.xml",XML_PATH,documentName);

        SAXSchemaHandler saxSchemaHandler = new SAXSchemaHandler();
        if(saxSchemaHandler.validateSchemaWithParsedDocument(xmlDocumentPath,schemaDocumentPath)){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>("An Error occurred.\nCheck StackTrace().",HttpStatus.INTERNAL_SERVER_ERROR);
    }

    Document parseDocument(String documentName) throws IOException, SAXException, ParserConfigurationException {
        File file = new File(String.format("%s%s.xml",XML_PATH,documentName));

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        return builder.parse(file);
    }

    //Store and Retrieve
    public ResponseEntity<String> storeXML(String documentName) throws Exception {
        String[] args = {"/db/sample/library", documentName + ".xml", "src/main/resources/data/xml/" + documentName + ".xml"};
        StoreAndRetrieveXML.store(args);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<String> retrieveXML(String documentName) throws Exception {
        String[] args = {"/db/sample/library", documentName + ".xml"};
        StoreAndRetrieveXML.retrieve(args);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
