package com.xmlvebservisi.service;

import com.xmlvebservisi.handler.SAXSchemaHandler;
import com.xmlvebservisi.util.ParserUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import static com.xmlvebservisi.util.ParserUtils.writeXml;

@Service
@RequiredArgsConstructor
public class ParserService {

    private static final String XML_PATH = "src/main/resources/data/xml/";
    private static final String XSD_PATH = "src/main/resources/data/xsd/";

    public ResponseEntity<String> readDocument(String documentName) throws Exception {
        if(!validateDocumentName(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }
        ParserUtils.printNode(parseDocument(documentName));
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<String> writeDocument(String documentName) throws Exception {
        if(!validateDocumentName(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }
        writeParsedDocument(documentName);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<String> validateDocument(String documentName){
        if(!validateDocumentName(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }

        String schemaDocumentPath = String.format("%s%s.xsd",XSD_PATH,documentName);
        String xmlDocumentPath = String.format("%s%s.xml",XML_PATH,documentName);

        SAXSchemaHandler saxSchemaHandler = new SAXSchemaHandler();
        if(saxSchemaHandler.validateSchemaWithParsedDocument(xmlDocumentPath,schemaDocumentPath)){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>("An Error occurred.\nCheck printStackTrace().",HttpStatus.INTERNAL_SERVER_ERROR);
    }

    Document parseDocument(String documentName) throws IOException, SAXException, ParserConfigurationException {
        File file = new File(String.format("%s%s.xml",XML_PATH,documentName));

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        return builder.parse(file);
    }

    void writeParsedDocument(String documentName) throws IOException, ParserConfigurationException, SAXException {
        Document document = parseDocument(documentName);

        String filepath=String.format("%s%s.xml",XML_PATH,documentName);
        try (FileOutputStream output = new FileOutputStream(filepath)) {
            writeXml(document, output);
        } catch (IOException | TransformerException e) {
            e.printStackTrace();
        }
    }

    boolean validateDocumentName(String documentName){
        return StringUtils.equals(documentName, "z1") || StringUtils.equals(documentName, "a1") || StringUtils.equals(documentName, "p1");
    }
}
