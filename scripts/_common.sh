#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# get corpus from wiki
generate_corpus(){
    for i in `seq 1 1 50`; do
	w3m -t 1 -s https://simple.wikipedia.org/wiki/Special:Random | grep -vP '^ |^\[|●|•' > corpus.txt;
	s=$(grep -n "From Simple English Wikipedia, the free encyclopedia" corpus.txt|cut -f1 -d:);
	e=$(grep -n 'Retrieved from "https://simple.wikipedia.org/w/index.php' corpus.txt|cut -f1 -d:);
	head -n $(expr $e - 5) corpus.txt|tail +$(expr $s + 2) >> $install_dir/mishmash.txt;
    done
    # store new hash
    sha256sum $install_dir/mishmash.txt | awk '{print toupper($1)}' > $install_dir/seed.txt
}
