#!/bin/bash
welcome="WELCOME! Follow the instructions in order to get what you are looking for: 1- Choose the database you want to use 2- Insert the scientific name of the organism/term 3- Save as FASTA"

echo 2<$welcome

echo 2<"$1" 
echo 2<"$2"

key=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi/\?db\=$1\&term\="$2 [organism], cytb[gene]"\&usehistory\=y -O - |grep "<QueryKey>"|cut -d ">" -f 8-|cut -d "<" -f -2 |cut -d ">" -f 2-)  

webenv=$(wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi/\?db\=$1\&term\="$2 [organism], cytb[gene]"\&usehistory\=y -O -|grep "<WebEnv>"|cut -d ">" -f 10-|cut -d "<" -f -2|cut -d ">" -f 2-)
  
wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi/\?db\=$1\&query_key\=$key\&WebEnv\=$webenv\&rettype\=fasta -O -

# Bernardo Augusto 2814
# Marcelo Pereira 2691
# Daniel Marçal 2675
