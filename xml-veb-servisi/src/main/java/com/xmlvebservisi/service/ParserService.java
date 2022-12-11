package com.xmlvebservisi.service;

import com.xmlvebservisi.util.ParserUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import org.apache.commons.lang3.StringUtils;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import static com.xmlvebservisi.util.ParserUtils.writeXml;

public class ParserService {

    public void writeDocument(String documentName) throws ParserConfigurationException, IOException, SAXException{
        if(!validateDocumentName(documentName)){
            return;
        }
        writeParsedDocument(documentName);
    }

    public void readDocument(String documentName) throws ParserConfigurationException, IOException, SAXException {
        if(!validateDocumentName(documentName)){
            return;
        }
        ParserUtils.printNode(parseDocument(documentName));
    }

    Document parseDocument(String documentName) throws IOException, SAXException, ParserConfigurationException {
        File file = new File("..\\%s.xml",documentName);

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        return builder.parse(file);
    }

    void writeParsedDocument(String documentName) throws IOException, ParserConfigurationException, SAXException {
        Document document = parseDocument(documentName);

        String filepath=String.format("..\\%s_written.xml",documentName);
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
