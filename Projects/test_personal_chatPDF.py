#!/usr/bin/env python
# coding: utf-8

import os
import pandas as pd
import matplotlib.pyplot as plt
from transformers import GPT2TokenizerFast
from langchain.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import FAISS
from langchain.chains.question_answering import load_qa_chain
from langchain.llms import OpenAI
from langchain.chains import ConversationalRetrievalChain


# In[32]:


import openai
import PyPDF2

os.environ["OPENAI_API_KEY"] = "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"

input_file = "C:/Users/Daniel Lee/Documents/MS Office/Data/data_textbook_2.pdf"
output_file = "C:/Users/Daniel Lee/Documents/MS Office/Data/data_textbook_2.txt"

with open(input_file, "rb") as file:
    # Initialize the PDF reader
    pdf_reader = PyPDF2.PdfReader(file)

    # Determine the number of pages in the PDF
    num_pages = len(pdf_reader.pages)

    # Initialize an empty text string
    text = ""

    # Iterate through all the pages in the PDF file
    for page_num in range(num_pages):
        page = pdf_reader.pages[page_num]
        text += page.extract_text()

# Save the extracted text to a new text file
with open(output_file, "w", encoding="utf-8") as f:
    f.write(text)
    
with open(output_file, 'r', encoding="utf-8") as f:
    text = f.read()


tokenizer = GPT2TokenizerFast.from_pretrained("gpt2")

def count_tokens(text: str) -> int:
    return len(tokenizer.encode(text))

# Step 4: Split text into chunks
text_splitter = RecursiveCharacterTextSplitter(
    # Set a really small chunk size, just to show.
    chunk_size = 512,
    chunk_overlap  = 24,
    length_function = count_tokens,
)

chunks = text_splitter.create_documents([text])


# Get embedding model
embeddings = OpenAIEmbeddings()

# Create vector database
db = FAISS.from_documents(chunks, embeddings)


# Check similarity search is working
query = "%s"
docs = db.similarity_search(query)
docs[0]

