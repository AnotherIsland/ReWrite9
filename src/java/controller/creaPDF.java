/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

/**
 *
 * @author ACIE-PC
 */
public class creaPDF {
    
    private PDDocument doc = null;
    private PDPage page = null;
    private float fontSize = 12;
    private PDFont pdfFontT = PDType1Font.TIMES_BOLD;
    private PDFont pdfFont = PDType1Font.TIMES_ROMAN;
    private float leading = 1.5f * fontSize;
    private float fontSizeT = 14;
    
    public PDDocument creaPDF(String path) throws IOException {
        doc = new PDDocument();
        PDPage blankPage = new PDPage();
        doc.addPage(blankPage);
        doc.save(path);
        System.out.println("PDF creado en: " + path);
        doc.close();
        return doc;
    }
    
    public ByteArrayOutputStream resumenPDFDown(String titulo, String contenido, String referencias, String path) throws IOException{
        creaPDF(path);
        String text = contenido;
        
        InputStream inputFront;
        InputStream inputBack;
        ByteArrayOutputStream output = new ByteArrayOutputStream(); 
        
        try {
            doc = new PDDocument();
            page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);

            
            PDRectangle mediabox = page.getMediaBox();
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;

            List<String> lines = new ArrayList<String>();
            int lastSpace = -1;
            while (text.length() > 0) {
                int spaceIndex = text.indexOf(' ', lastSpace + 1);
                if (spaceIndex < 0) {
                    spaceIndex = text.length();
                }
                String subString = text.substring(0, spaceIndex);
                float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
                System.out.printf("'%s' - %f of %f\n", subString, size, width);
                if (size > width) {
                    if (lastSpace < 0) {
                        lastSpace = spaceIndex;
                    }
                    subString = text.substring(0, lastSpace);
                    lines.add(subString);
                    text = text.substring(lastSpace).trim();
                    System.out.printf("'%s' is line\n", subString);
                    lastSpace = -1;
                } else if (spaceIndex == text.length()) {
                    lines.add(text);
                    System.out.printf("'%s' is line\n", text);
                    text = "";
                } else {
                    lastSpace = spaceIndex;
                }
            }

            contentStream.beginText();
            //Agrega Título
            contentStream.setFont(pdfFont, fontSizeT);
            contentStream.newLineAtOffset(startX, startY);
            contentStream.showText(titulo);
            contentStream.newLineAtOffset(0, -leading);
            contentStream.endText();
            contentStream.beginText();
            //Agrega contenido            
            contentStream.setFont(pdfFont, fontSize);
            contentStream.newLineAtOffset((startX), (startY-30));
            float currentY = startY;
            for (String line : lines) {
                currentY -= leading;

                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                float charSpacing = 0;
                if (line.length() > 1) {
                    float size = fontSize * pdfFont.getStringWidth(line) / 1000;
                    float free = width - size;
                    if (free > 0) {
                        charSpacing = free / (line.length() - 1);
                    }
                }
                contentStream.setCharacterSpacing(charSpacing);
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            contentStream.close();

            doc.save(output);
        } finally {
            if (doc != null) {
                doc.close();
            }
        }
        
        return output;
    }

    public ByteArrayOutputStream resumenPDF(String titulo, String contenido, String referencias, String path) throws IOException{
        creaPDF(path);
        String text1 = contenido;
        int cuentaP = 0;//Cuenta el número de lineas por párrafo
        ArrayList<String> numLP = new ArrayList();//Guarda el numero de lineas por parrafo
        text1 = text1.replace("\n", "&").replace("\r", "&");
        
        InputStream inputFront;
        InputStream inputBack;
        ByteArrayOutputStream output = new ByteArrayOutputStream(); 
        
        try {
            doc = new PDDocument();
            page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);

            PDRectangle mediabox = page.getMediaBox();
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;

            List<String> lines = new ArrayList<String>();
            for (String text : text1.split("&")){
                int lastSpace = -1;
                
                while (text.length() > 0) {
                    int spaceIndex = text.indexOf(' ', lastSpace + 1);
                    if (spaceIndex < 0) {
                        spaceIndex = text.length();
                    }
                    String subString = text.substring(0, spaceIndex);
                    float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
                    System.out.printf("'%s' - %f of %f\n", subString, size, width);
                    if (size > width) {
                        if (lastSpace < 0) {
                            lastSpace = spaceIndex;
                        }
                        subString = text.substring(0, lastSpace);
                        lines.add(subString);
                        cuentaP++;
                        text = text.substring(lastSpace).trim();
                        System.out.printf("'%s' is line\n", subString);
                        lastSpace = -1;
                    } else if (spaceIndex == text.length()) {
                        lines.add(text);
                        cuentaP++;
                        System.out.printf("'%s' is line\n", text);
                        text = "";
                    } else {
                        lastSpace = spaceIndex;
                    }
                }
                System.out.println("Parrafo termina en linea numero:"+cuentaP);
                numLP.add(Integer.toString(cuentaP));
                //cuentaP = 0;
            }
            
            
            //Agrega Título
            contentStream.beginText();
            contentStream.setFont(pdfFontT, fontSizeT);
            contentStream.newLineAtOffset(startX, startY);
            contentStream.showText(titulo);
            contentStream.newLineAtOffset(0, -leading);
            contentStream.endText();
            //Agrega contenido 
            contentStream.beginText();
                       
            contentStream.setFont(pdfFont, fontSize);
            contentStream.newLineAtOffset((startX), (startY-30));
            float currentY = startY;
            int cuenta = 0;
            for (String line: lines) {
                currentY -= leading;
                cuenta++;

                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                float charSpacing = 0;
                if (line.length() > 1) {
                    float size = fontSize * pdfFont.getStringWidth(line) / 1000;
                    float free = width - size;
                    if (free > 0) {
                        charSpacing = free / (line.length() - 1);
                    }
                }
                
                for(int k = 0; k < numLP.size();k++){
                    if(cuenta==Integer.parseInt(numLP.get(k))){
                        contentStream.setCharacterSpacing(0);
                        System.out.println("Se cambia espaciado: "+line);
                        break;
                    }else {
                        contentStream.setCharacterSpacing(charSpacing);
                    }
                }
                
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            
            //Agrega referencias
            if(!referencias.equals("")){
                startY = currentY - 50;
                contentStream.beginText();
                contentStream.setFont(pdfFont, fontSize);
                contentStream.newLineAtOffset((startX), (startY));

            for (String line: referencias.split("&")) {
                currentY -= leading;
                cuenta++;
                line = line.replace("<i>", "").replace("</i>", "");
                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                contentStream.setCharacterSpacing(0);
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            }
            
            contentStream.close();

            doc.save(output);
        } finally {
            if (doc != null) {
                doc.close();
            }
        }
        return output;
    }

    public ByteArrayOutputStream ensayoPDF(String titulo, String intro,String desa,String conclu,
            String referencias, String path) throws IOException{
        creaPDF(path);
        String text = intro + desa + conclu + referencias;
        
        InputStream inputFront;
        InputStream inputBack;
        ByteArrayOutputStream output = new ByteArrayOutputStream(); 
        
        try {
            doc = new PDDocument();
            page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);


            PDRectangle mediabox = page.getMediaBox();
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;

            List<String> lines = new ArrayList<String>();
            int lastSpace = -1;
            while (text.length() > 0) {
                int spaceIndex = text.indexOf(' ', lastSpace + 1);
                if (spaceIndex < 0) {
                    spaceIndex = text.length();
                }
                String subString = text.substring(0, spaceIndex);
                float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
                System.out.printf("'%s' - %f of %f\n", subString, size, width);
                if (size > width) {
                    if (lastSpace < 0) {
                        lastSpace = spaceIndex;
                    }
                    subString = text.substring(0, lastSpace);
                    lines.add(subString);
                    text = text.substring(lastSpace).trim();
                    System.out.printf("'%s' is line\n", subString);
                    lastSpace = -1;
                } else if (spaceIndex == text.length()) {
                    lines.add(text);
                    System.out.printf("'%s' is line\n", text);
                    text = "";
                } else {
                    lastSpace = spaceIndex;
                }
            }

            contentStream.beginText();
            //Agrega Título
            contentStream.setFont(pdfFont, fontSizeT);
            contentStream.newLineAtOffset(startX, startY);
            contentStream.showText(titulo);
            contentStream.newLineAtOffset(0, -leading);
            contentStream.endText();
            contentStream.beginText();
            //Agrega contenido            
            contentStream.setFont(pdfFont, fontSize);
            contentStream.newLineAtOffset((startX), (startY-30));
            float currentY = startY;
            for (String line : lines) {
                currentY -= leading;

                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                float charSpacing = 0;
                if (line.length() > 1) {
                    float size = fontSize * pdfFont.getStringWidth(line) / 1000;
                    float free = width - size;
                    if (free > 0) {
                        charSpacing = free / (line.length() - 1);
                    }
                }
                contentStream.setCharacterSpacing(charSpacing);
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            contentStream.close();

            doc.save(new File(path));
        } finally {
            if (doc != null) {
                doc.close();
            }
        }
        return output;
    }
    
    public  ByteArrayOutputStream resumenPDFJustificado(String titulo, String contenido, String referencias, String path) throws IOException{
        creaPDF(path);
        String text = contenido;
        
        InputStream inputFront;
        InputStream inputBack;
        ByteArrayOutputStream output = new ByteArrayOutputStream(); 
        
        try {
            doc = new PDDocument();
            page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);


            PDRectangle mediabox = page.getMediaBox();
            
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;
            
            //Agrega Título
            contentStream.beginText();
            contentStream.setFont(pdfFont, fontSizeT);
            contentStream.newLineAtOffset(startX, startY);
            contentStream.showText(titulo);
            contentStream.newLineAtOffset(0, -leading);
            contentStream.endText();
            
            //Agrega contenido  
            contentStream.beginText();
            addParagraph(contentStream, width, startX, startY, text, true);
            //addParagraph(contentStream, width, 0, -fontSize, text);
            //addParagraph(contentStream, width, 0, -fontSize, text, false);
            contentStream.endText();

            contentStream.close();

            doc.save(output);
        } finally {
            if (doc != null) {
                doc.close();
            }
        }
        return output;
    }
    
    public  ByteArrayOutputStream liricoPDF(String titulo, String contenido, String path) throws IOException{
        creaPDF(path);
        String text1 = contenido;
        int cuentaP = 0;//Cuenta el número de lineas por párrafo
        ArrayList<String> numLP = new ArrayList();//Guarda el numero de lineas por parrafo
        text1 = text1.replace("\n", "&").replace("\r", "&");
        
        InputStream inputFront;
        InputStream inputBack;
        ByteArrayOutputStream output = new ByteArrayOutputStream(); 
        
        try {
            doc = new PDDocument();
            page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);

            PDRectangle mediabox = page.getMediaBox();
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;

            List<String> lines = new ArrayList<String>();
            for (String text : text1.split("&")){
                int lastSpace = -1;
                
                while (text.length() > 0) {
                    int spaceIndex = text.indexOf(' ', lastSpace + 1);
                    if (spaceIndex < 0) {
                        spaceIndex = text.length();
                    }
                    String subString = text.substring(0, spaceIndex);
                    float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
                    System.out.printf("'%s' - %f of %f\n", subString, size, width);
                    if (size > width) {
                        if (lastSpace < 0) {
                            lastSpace = spaceIndex;
                        }
                        subString = text.substring(0, lastSpace);
                        lines.add(subString);
                        cuentaP++;
                        text = text.substring(lastSpace).trim();
                        System.out.printf("'%s' is line\n", subString);
                        lastSpace = -1;
                    } else if (spaceIndex == text.length()) {
                        lines.add(text);
                        cuentaP++;
                        System.out.printf("'%s' is line\n", text);
                        text = "";
                    } else {
                        lastSpace = spaceIndex;
                    }
                }
                System.out.println("Parrafo termina en linea numero:"+cuentaP);
                numLP.add(Integer.toString(cuentaP));
                //cuentaP = 0;
            }
            
            contentStream.beginText();
            //Agrega Título
            contentStream.setFont(pdfFontT, fontSizeT);
            contentStream.newLineAtOffset(startX, startY);
            contentStream.showText(titulo);
            contentStream.newLineAtOffset(0, -leading);
            contentStream.endText();
            //Agrega contenido 
            contentStream.beginText();
                       
            contentStream.setFont(pdfFont, fontSize);
            contentStream.newLineAtOffset((startX), (startY-30));
            float currentY = startY;
            int cuenta = 0;
            for (String line: lines) {
                currentY -= leading;
                cuenta++;

                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                contentStream.setCharacterSpacing(0);
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            contentStream.close();

            doc.save(output);
        } finally {
            if (doc != null) {
                doc.close();
            }
        }
        return output;
    }

    public void addParagraph(PDPageContentStream contentStream, float width, float sx,
                                      float sy, String text) throws IOException {
        addParagraph(contentStream, width, sx, sy, text, false);
    }

    public void addParagraph(PDPageContentStream contentStream, float width, float sx,
                                      float sy, String text, boolean justify) throws IOException {
        List<String> lines = parseLines(text, width);
        contentStream.setFont(pdfFont, fontSize);
        contentStream.newLineAtOffset(sx, sy);
        for (String line: lines) {
            float charSpacing = 0;
            if (justify){
                if (line.length() > 1) {
                    float size = fontSize * pdfFont.getStringWidth(line) / 1000;
                    float free = width - size;
                    if (free > 0 && !lines.get(lines.size() - 1).equals(line)) {
                        charSpacing = free / (line.length() - 1);
                    }
                }
            }
            contentStream.setCharacterSpacing(charSpacing);
            contentStream.showText(line);
            contentStream.newLineAtOffset(0, leading);
        }
    }
    
    public List<String> parseLines(String text, float width) throws IOException {
        List<String> lines = new ArrayList<String>();
        
        int lastSpace = -1;
        while (text.length() > 0) {
            int spaceIndex = text.indexOf(' ', lastSpace + 1);
            if (spaceIndex < 0)
                spaceIndex = text.length();
            String subString = text.substring(0, spaceIndex);
            float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
            if (size > width) {
                if (lastSpace < 0){
                    lastSpace = spaceIndex;
                }
                subString = text.substring(0, lastSpace);
                lines.add(subString);
                text = text.substring(lastSpace).trim();
                lastSpace = -1;
            } else if (spaceIndex == text.length()) {
                lines.add(text);
                text = "";
            } else {
                lastSpace = spaceIndex;
            }
        }
        return lines;
    }
    public void modificaPDF(String path, String text) throws IOException {
        
        PDDocument doc = null;
        try {
            doc = new PDDocument();
            PDPage page = new PDPage();
            doc.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(doc, page);

            PDFont pdfFont = PDType1Font.TIMES_ROMAN;
            float fontSize = 12;
            float leading = 1.5f * fontSize;

            PDRectangle mediabox = page.getMediaBox();
            float margin = 72;
            float width = mediabox.getWidth() - 2 * margin;
            float startX = mediabox.getLowerLeftX() + margin;
            float startY = mediabox.getUpperRightY() - margin;

            List<String> lines = new ArrayList<String>();
            int lastSpace = -1;
            while (text.length() > 0) {
                int spaceIndex = text.indexOf(' ', lastSpace + 1);
                if (spaceIndex < 0) {
                    spaceIndex = text.length();
                }
                String subString = text.substring(0, spaceIndex);
                float size = fontSize * pdfFont.getStringWidth(subString) / 1000;
                System.out.printf("'%s' - %f of %f\n", subString, size, width);
                if (size > width) {
                    if (lastSpace < 0) {
                        lastSpace = spaceIndex;
                    }
                    subString = text.substring(0, lastSpace);
                    lines.add(subString);
                    text = text.substring(lastSpace).trim();
                    System.out.printf("'%s' is line\n", subString);
                    lastSpace = -1;
                } else if (spaceIndex == text.length()) {
                    lines.add(text);
                    System.out.printf("'%s' is line\n", text);
                    text = "";
                } else {
                    lastSpace = spaceIndex;
                }
            }

            contentStream.beginText();
            contentStream.setFont(pdfFont, fontSize);
            contentStream.newLineAtOffset(startX, startY);
            float currentY = startY;
            for (String line : lines) {
                currentY -= leading;

                if (currentY <= margin) {

                    contentStream.endText();
                    contentStream.close();
                    PDPage new_Page = new PDPage();
                    doc.addPage(new_Page);
                    contentStream = new PDPageContentStream(doc, new_Page);
                    contentStream.beginText();
                    contentStream.setFont(pdfFont, fontSize);
                    contentStream.newLineAtOffset(startX, startY);
                    currentY = startY;
                }
                float charSpacing = 0;
                if (line.length() > 1) {
                    float size = fontSize * pdfFont.getStringWidth(line) / 1000;
                    float free = width - size;
                    if (free > 0) {
                        charSpacing = free / (line.length() - 1);
                    }
                }
                contentStream.setCharacterSpacing(charSpacing);
                contentStream.showText(line);
                contentStream.newLineAtOffset(0, -leading);
            }
            contentStream.endText();
            contentStream.close();

            doc.save(new File(path));
        } finally {
            if (doc != null) {
                doc.close();
            }
        }

    }
    public void modificaPDF1(String path, String text) throws IOException {
        try {
            //Loading an existing document
            File file = new File(path);
            PDDocument document = PDDocument.load(file);

            //Retrieving the pages of the document 
            PDPage page = document.getPage(0);
            PDPageContentStream contentStream = new PDPageContentStream(document, page);

            //Begin the Content stream 
            contentStream.beginText();

            //Setting the font to the Content stream  
            //PDFont pdfFont = PDType1Font.TIMES_ROMAN;
            //float fontSize = 12;
            //float leading = 1.5f * fontSize;
            contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);

            contentStream.setLeading(14.5f);
            String text1 = text;

            //Setting the position for the line 
            contentStream.newLineAtOffset(55, 700);
            //

        //Adding text in the form of string
        String guarda = "";
            for (int i = 0; i < text1.length(); i++) {
                guarda = guarda + text1.charAt(i);

                if (i % 100 == 0 && i != 0) {
                    contentStream.showText(guarda);
                    contentStream.newLine();
                    guarda = "";
                }
            }
            //Ending the content stream
            contentStream.endText();

            System.out.println("Contenido añadido");

            //Closing the content stream
            contentStream.close();

            //Saving the document
            document.save(new File(path));

            //Closing the document
            document.close();        
            
        } catch (Exception e) {
            System.out.println("No hay un documento con ese nombre");

        }
    }
    

    
}


