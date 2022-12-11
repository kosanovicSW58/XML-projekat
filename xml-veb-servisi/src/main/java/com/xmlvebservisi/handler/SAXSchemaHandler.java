package com.xmlvebservisi.handler;

import java.io.File;

import javax.xml.XMLConstants;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

/**

 * Primer demonstrira upotrebu SAX API-ja za potrebe
 * parsiranje/čitanja XML fajla.
 *
 * Validacija XML fajla u odnosu na njegovu XML šemu.
 * Testirati dodavanjem npr. test="abc" atributa u otvarajući
 * tag korenskog elementa.
 *
 * @author Igor Cverdelj-Fogaraši
 *
 */
public class SAXSchemaHandler extends DefaultHandler {

    private static SAXParserFactory parserFactory;

    private static SchemaFactory schemaFactory;

    /*
     * Factory initialization static-block
     */
    static {
        parserFactory = SAXParserFactory.newInstance();
        parserFactory.setNamespaceAware(true);

        // Omogućuje validaciju u odnosu na XML šemu
        schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
    }

    public boolean validateSchemaWithParsedDocument(String filePath, String schemaPath) {

        try {
            // Validacija u odnosu na XML šemu
            Schema schema = schemaFactory.newSchema(new File(schemaPath));
            parserFactory.setSchema(schema);

            SAXParser saxParser = parserFactory.newSAXParser();
            saxParser.parse(new File(filePath), this);

        } catch (SAXParseException e) {

            System.out.println("[ERROR] Parsing error, line: " + e.getLineNumber() + ", uri: " + e.getSystemId());
            System.out.println("[ERROR] " + e.getMessage() );
            System.out.print("[ERROR] Embedded exception: ");

            Exception embeddedException = e;
            if (e.getException() != null)
                embeddedException = e.getException();

            // Print stack trace...
            embeddedException.printStackTrace();
            return false;

        } catch (SAXException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private String getLocalName(String unqualifiedName, String qualifiedName) {
        return "".equals(unqualifiedName) ? qualifiedName : unqualifiedName;
    }

    @Override
    public void startDocument() throws SAXException {

        System.out.println("START_DOCUMENT");
    }

    @Override
    public void endDocument() throws SAXException {

        System.out.println("END_DOCUMENT");
    }

    @Override
    public void startElement(String uri, String uName, String qName, Attributes attributes) throws SAXException {

        System.out.print("START_ELEMENT: " + getLocalName(uName, qName));

        if (attributes.getLength() > 0) {

            System.out.print(", ATTRIBUTES: ");

            for (int i = 0; i < attributes.getLength(); i++) {
                System.out.print(getLocalName(attributes.getLocalName(i), attributes.getQName(i)) + "=" + attributes.getValue(i));
                if (i < attributes.getLength()-1)
                    System.out.print(", ");
            }
        }

        System.out.println();
    }

    @Override
    public void endElement(String uri, String uName, String qName) throws SAXException {

        System.out.println("END_ELEMENT: " + getLocalName(uName, qName));
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {

        String characters = new String(ch, start, length).trim();

        if (characters.length() > 0)
            System.out.println("CHARACTERS: " + new String(ch, start, length));
    }

    /*
     * Exception handling
     */

    @Override
    public void error(SAXParseException err) throws SAXParseException {

        // Propagate the exception
        throw err;
    }

    @Override
    public void warning(SAXParseException err) throws SAXParseException {

        System.out.println("[WARN] Warning, line: " + err.getLineNumber() + ", uri: " + err.getSystemId());
        System.out.println("[WARN] " + err.getMessage());
    }

}

