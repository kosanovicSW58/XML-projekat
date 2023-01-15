package com.xmlvebservisi.service;

import com.xmlvebservisi.dto.SingleTagDto;
import com.xmlvebservisi.handler.SAXSchemaHandler;
import com.xmlvebservisi.repository.StoreAndRetrieveXML;
import com.xmlvebservisi.util.ParserUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import rs.ftn_intelektualna_svojina.tipovi.Adresa;
import rs.ftn_intelektualna_svojina.tipovi.LicniPodaciOsoba;
import rs.ftn_intelektualna_svojina.zahtevzaunosenjeuevidenciju.ZahtevZaUnosenjeUEvidenciju;

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

    public ResponseEntity<String> writeDocument(String documentName, SingleTagDto singleTagDto) throws Exception {
        if(!validateDocumentName(documentName)){
            return new ResponseEntity<>("Invalid document name",HttpStatus.BAD_REQUEST);
        }

        try {
            File file = new File(String.format("%s%s.xml",XML_PATH,documentName));

            Adresa adresa = new Adresa();
            adresa.setMesto("Novi Sad");
            adresa.setPostanskiBroj(21000);
            adresa.setDrzava("Srbija");
            Adresa.Ulica ulica = new Adresa.Ulica();
            ulica.setBroj(14);
            ulica.setNaziv("Njegoseva");
            adresa.setUlica(ulica);

            ZahtevZaUnosenjeUEvidenciju zahtevZaUnosenjeUEvidenciju = null;
            JAXBContext jaxbContext = JAXBContext.newInstance(ZahtevZaUnosenjeUEvidenciju.class);
            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            zahtevZaUnosenjeUEvidenciju = (ZahtevZaUnosenjeUEvidenciju) jaxbUnmarshaller.unmarshal(file);
            zahtevZaUnosenjeUEvidenciju.getPodaciOPodnosiocu().getPodaciOPodnosiocuOsoba().setAdresa(adresa);

            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            jaxbMarshaller.marshal(zahtevZaUnosenjeUEvidenciju, file);



//            System.out.println(((Adresa) o).getMesto());

//            jaxbMarshaller.marshal(adresa,file);
//            jaxbMarshaller.marshal(adresa, System.out);

        } catch (JAXBException e) {
            e.printStackTrace();
            return new ResponseEntity<>("Check StackTrace.",HttpStatus.BAD_REQUEST);
        }

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
        return new ResponseEntity<>("An Error occurred.\nCheck StackTrace().",HttpStatus.INTERNAL_SERVER_ERROR);
    }

    Document parseDocument(String documentName) throws IOException, SAXException, ParserConfigurationException {
        File file = new File(String.format("%s%s.xml",XML_PATH,documentName));

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        return builder.parse(file);
    }

    void writeParsedDocument(String documentName, SingleTagDto singleTagDto) throws IOException, ParserConfigurationException, SAXException {
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
