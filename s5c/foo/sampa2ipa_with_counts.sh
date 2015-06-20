#!/bin/bash

paste <(cat conf/sampa2ipa_sorted.txt| sed '/^;/d'|awk '{print $1}' |\
perl binarize_common_phones.pl - full_lexicon/phones_cantonese.txt full_lexicon/phones_assamese.txt\
								 full_lexicon/phones_bengali.txt full_lexicon/phones_pashto.txt\
								 full_lexicon/phones_turkish.txt full_lexicon/phones_tagalog.txt\
								 full_lexicon/phones_vietnamese.txt full_lexicon/phones_haitian.txt\
								 full_lexicon/phones_lao.txt full_lexicon/phones_tamil.txt\
								 full_lexicon/phones_zulu.txt|awk '{print $1}'|\
join -a1 -1 1 -2 1 - <(cat conf/sampa2ipa_sorted.txt|sort -k1,1)|awk '{print $1, "\t\t", $2}')\
<(cat conf/sampa2ipa_sorted.txt| sed '/^;/d'|awk '{print $1}' |\
perl binarize_common_phones.pl - full_lexicon/phones_cantonese.txt full_lexicon/phones_assamese.txt\
								 full_lexicon/phones_bengali.txt full_lexicon/phones_pashto.txt\
								 full_lexicon/phones_turkish.txt full_lexicon/phones_tagalog.txt\
								 full_lexicon/phones_vietnamese.txt full_lexicon/phones_haitian.txt\
								 full_lexicon/phones_lao.txt full_lexicon/phones_tamil.txt\
								 full_lexicon/phones_zulu.txt|cut  -f2- -) > conf/sampa2ipa_with_counts.txt
