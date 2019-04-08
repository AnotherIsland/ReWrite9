/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

/**
 *
 * @author ACIE-PC
 */
public class AdministrarPDF {
    public PDDocument creaPDF(String path) throws IOException{
         PDDocument doc = new PDDocument();
         PDPage blankPage = new PDPage();
         doc.addPage(blankPage);
         doc.save(path);
         System.out.println("PDF creado en: "+ path);
         doc.close();
         return doc;
     }
     public void modificaPDF(String path, String text) throws IOException{
         try{
            //Loading an existing document
            File file = new File(path);
            PDDocument document = PDDocument.load(file); 

            //Retrieving the pages of the document 
            PDPage page = document.getPage(0);
            PDPageContentStream contentStream = new PDPageContentStream(document, page);

            //Begin the Content stream 
            contentStream.beginText(); 

            //Setting the font to the Content stream  
            contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);

            contentStream.setLeading(14.5f);

            String text1 = text;

            //Setting the position for the line 
            contentStream.newLineAtOffset(55, 700);

            //Adding text in the form of string
            String guarda = "";
            for(int i = 0; i < text1.length(); i++){
                guarda = guarda + text1.charAt(i);

                if(i%100 == 0  && i!= 0){
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
            }catch(Exception e){
              System.out.println("No hay un documento con ese nombre");

            }
     }
     
     
     String path = "D:/Adriana/5° semestre/Seguridad y Distribuidos/ReWrite8.2/ReWrite8/build/web/2.pdf";
        String text = "Integer cursus mi sed felis lobortis suscipit. Donec imperdiet vestibulum bibendum. "
                + "Cras et mollis ex, sed posuere ligula. Ut porta, ligula vel viverra eleifend, mi ligula ultrices odio, "
                + "quis finibus metus risus vel nibh. "
                + "Vestibulum eget enim quam. Orci varius natoque penatibus et magnis dis parturient montes, "
                + "nascetur ridiculus mus. Donec egestas, est nec laoreet condimentum, diam massa molestie arcu, "
                + "non sodales mi sapien nec sapien. Pellentesque ornare odio vitae lorem tincidunt, vel egestas "
                + "sapien feugiat. Quisque ullamcorper pulvinar mollis. Curabitur quis mauris leo. Interdum et "
                + "malesuada fames ac ante ipsum primis in faucibus. Nulla hendrerit quam nec augue molestie, at "
                + "aliquet lectus pellentesque. Praesent blandit, arcu eget tempor pharetra, justo ipsum tempor "
                + "erat, blandit tempus neque enim sit amet tellus. Nullam ut pharetra dui. Maecenas quis ultricies orci, ut tempor dui. "
                + "Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.";
        
       // creaPDF(path);
        //modificaPDF(path, text);
}
