package com.xmlvebservisi.util;

import java.io.OutputStream;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.apache.commons.lang3.StringUtils;
import org.w3c.dom.Attr;
import org.w3c.dom.CDATASection;
import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Entity;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.ProcessingInstruction;
import org.w3c.dom.Text;

public final class ParserUtils {

    public static boolean validateDocumentName(String documentName){
        return !StringUtils.equals(documentName, "z1") && !StringUtils.equals(documentName, "a1") && !StringUtils.equals(documentName, "p1");
    }

    public static void printNode(Node node) {

        if (node == null)
            return;

        if (node instanceof Document) {

            System.out.println("START_DOCUMENT");

            Document doc = (Document) node;
            printNode(doc.getDocumentElement());
        } else if (node instanceof Element) {

            Element element = (Element) node;

            System.out.print("START_ELEMENT: " + element.getTagName());

            NamedNodeMap attributes = element.getAttributes();

            if (attributes.getLength() > 0) {

                System.out.print(", ATTRIBUTES: ");

                for (int i = 0; i < attributes.getLength(); i++) {
                    Node attribute = attributes.item(i);
                    printNode(attribute);
                    if (i < attributes.getLength()-1)
                        System.out.print(", ");
                }
            }

            System.out.println();

            NodeList children = element.getChildNodes();

            if (children != null) {
                for (int i = 0; i < children.getLength(); i++) {
                    Node aChild = children.item(i);
                    printNode(aChild);
                }
            }
        }
        else if (node instanceof Attr) {

            Attr attr = (Attr) node;
            System.out.print(attr.getName() + "=" + attr.getValue());

        }
        else if (node instanceof Text) {
            Text text = (Text) node;

            if (text.getTextContent().trim().length() > 0)
                System.out.println("CHARACTERS: " + text.getTextContent().trim());
        }
        else if (node instanceof CDATASection) {
            System.out.println("CDATA: " + node.getNodeValue());
        }
        else if (node instanceof Comment) {
            System.out.println("COMMENT: " + node.getNodeValue());
        }
        else if (node instanceof ProcessingInstruction) {
            System.out.print("PROCESSING INSTRUCTION: ");

            ProcessingInstruction instruction = (ProcessingInstruction) node;
            System.out.print("data: " + instruction.getData());
            System.out.println(", target: " + instruction.getTarget());
        }
        else if (node instanceof Entity) {
            Entity entity = (Entity) node;
            System.out.println("ENTITY: " + entity.getNotationName());
        }
    }

    public static void writeXml(Document doc, OutputStream output) throws TransformerException {
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();

        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(output);

        transformer.transform(source, result);
    }

    private ParserUtils(){super();}
}
