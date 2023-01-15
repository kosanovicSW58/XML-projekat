package com.xmlvebservisi.service;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import lombok.RequiredArgsConstructor;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.xalan.processor.TransformerFactoryImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import static com.xmlvebservisi.util.ParserUtils.documentNameIsNotValid;

@Service
@RequiredArgsConstructor
public class GeneratorService {

    private static final String RESOURCES_PATH = "src/main/resources/";
    private static final String XSL_FILE_PATH = RESOURCES_PATH + "data/xsl/%s.xsl";
    private static final String XML_FILE_PATH = RESOURCES_PATH + "data/xml/%s.xml";
    private static final String PDF_FILE_PATH = RESOURCES_PATH + "data/pdf/%s.pdf";
    private static final String HTML_FILE_PATH = RESOURCES_PATH + "data/html/%s.html";
    private static final String XHTML_FILE_PATH = RESOURCES_PATH + "data/xhtml/%s.xsl";
    private static final String FOP_CONF_PATH = RESOURCES_PATH + "fop.xconf";

    public ResponseEntity<String> generatePdfFromDocument(String documentName) throws IOException, SAXException {
        if(documentNameIsNotValid(documentName)){
            return new ResponseEntity<>("Invalid document name", HttpStatus.BAD_REQUEST);
        }
        FopFactory fopFactory = FopFactory.newInstance(new File(FOP_CONF_PATH));
        TransformerFactory transformerFactory = new TransformerFactoryImpl();

        String xslFilePath = String.format(XSL_FILE_PATH,documentName);
        String xmlFilePath = String.format(XML_FILE_PATH,documentName);
        String pdfFilePath = String.format(PDF_FILE_PATH,documentName);
        try {
            System.out.println("[INFO] XSLFOTransformer");
            // Point to the XSL-FO file
            File xslFile = new File(xslFilePath);
            // Create transformation source
            StreamSource transformSource = new StreamSource(xslFile);
            // Initialize the transformation subject
            StreamSource source = new StreamSource(new File(xmlFilePath));
            // Initialize user agent needed for the transformation
            FOUserAgent userAgent = fopFactory.newFOUserAgent();
            // Create the output stream to store the results
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            // Initialize the XSL-FO transformer object
            Transformer xslFoTransformer = transformerFactory.newTransformer(transformSource);
            // Construct FOP instance with desired output format
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, userAgent, outStream);
            // Resulting SAX events
            Result res = new SAXResult(fop.getDefaultHandler());
            // Start XSLT transformation and FOP processing
            xslFoTransformer.transform(source, res);
            // Generate PDF file
            File pdfFile = new File(pdfFilePath);
            if (!pdfFile.getParentFile().exists()) {
                System.out.println("[INFO] A new directory is created: " + pdfFile.getParentFile().getAbsolutePath() + ".");
                pdfFile.getParentFile().mkdir();
            }
            OutputStream out = new BufferedOutputStream(new FileOutputStream(pdfFile));
            out.write(outStream.toByteArray());
            System.out.println("[INFO] File \"" + pdfFile.getCanonicalPath() + "\" generated successfully.");
            out.close();
            System.out.println("[INFO] End.");
        } catch (SAXException | IOException | TransformerException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<String> generateHtmlFromDocument(String documentName) {
            if(documentNameIsNotValid(documentName)){
                return new ResponseEntity<>("Invalid document name", HttpStatus.BAD_REQUEST);
            }
            TransformerFactory transformerFactory = TransformerFactory.newInstance();

            String xhtmlFilePath = String.format(XHTML_FILE_PATH,documentName);
            String xmlFilePath = String.format(XML_FILE_PATH,documentName);
            String htmlFilePath = String.format(HTML_FILE_PATH,documentName);

            try {
                StreamSource transformSource = new StreamSource(new File(xhtmlFilePath));
                Transformer transformer = transformerFactory.newTransformer(transformSource);
                transformer.setOutputProperty("{http://xml.apache.org/xalan}indent-amount", "2");
                transformer.setOutputProperty(OutputKeys.INDENT, "yes");

                // Generate XHTML
                transformer.setOutputProperty(OutputKeys.METHOD, "xhtml");

                // Transform DOM to HTML
                DOMSource source = new DOMSource(buildDocument(xmlFilePath));
                StreamResult result = new StreamResult(new FileOutputStream(htmlFilePath));
                transformer.transform(source, result);
            } catch (Exception e) {
                e.printStackTrace();
            }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public Document buildDocument(String filePath) {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        documentBuilderFactory.setNamespaceAware(true);
        documentBuilderFactory.setIgnoringComments(true);
        documentBuilderFactory.setIgnoringElementContentWhitespace(true);

        Document document;
        try {
            DocumentBuilder builder = documentBuilderFactory.newDocumentBuilder();
            document = builder.parse(new File(filePath));
            if (document != null)
                System.out.println("[INFO] File parsed with no errors.");
            else
                System.out.println("[WARN] Document is null.");
        } catch (Exception e) {
            return null;
        }
        return document;
    }
}
