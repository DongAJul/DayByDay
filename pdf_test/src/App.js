import "./App.css";
import React, { useState, useEffect } from "react";
import { pdfjs } from "react-pdf";
import PDFViewer from "./PDFViewer";
import PDFExtract from "./PDFExtract";
import PDFUpload from "./PDFUpload";

pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.js`;

function App() {
  // const [extractedText, setExtractedText] = useState("");

  // const extractTextFromPDF = async (pdfUrl) => {
  //   const pdf = await pdfjs.getDocument(pdfUrl).promise;
  //   const numPages = pdf.numPages;
  //   let allText = "";

  //   for (let pageNumber = 1; pageNumber <= numPages; pageNumber++) {
  //     const page = await pdf.getPage(pageNumber);
  //     const content = await page.getTextContent();
  //     const strings = content.items.map((item) => item.str);
  //     allText += strings.join(" ");
  //   }

  //   return allText;
  // };

  // useEffect(() => {
  // extractTextFromPDF("./lecture01.pdf").then((text) => {
  //   setExtractedText(text);
  // });
  // }, []);

  return (
    <div>
      {/* <PDFViewer></PDFViewer> */}
      {/* <p>Extracted text:</p>
      <pre>{extractedText}</pre> */}
      <PDFUpload></PDFUpload>
    </div>
  );
}

export default App;