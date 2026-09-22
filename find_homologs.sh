#!/usr/bin/env bash
#Shebang intialization

#Match Protein to nucleotides with a database search
tblastn -query $1 -subject $2 -out $3 -outfmt '6' -qcov_hsp_perc 90 
#filters the output for match length >90%

#filters the only include match identifiers >30%
cp $3 preface.txt
awk '$3 > 30' preface.txt > $3



#Shows how many matches were found after the filters 
wc -l $3
