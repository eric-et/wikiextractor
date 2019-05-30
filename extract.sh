#!/bin/bash
#
# NOTES
#
# - Must expand templates to avoid a large loss of content.
# - Text will not (redundantly) contain the title string.
# - Keep sections. Section title will be marked by "Section::::".
# - Keep lists. List bullets will be marked by "BULLET::::".
# - Keep tables. They're mostly garbage but can be removed later (remove "^!*").
# - Remove disambiguation pages. Right now there is no use for them.

INPUT="/root/wikidata/zhwiki-latest-pages-articles.xml.bz2"
PROCESSES=4
TEMPLATES="TEMPLATES"
OUTPUT="/root/wikidata/zhwiki.json"

python WikiExtractor.py $INPUT \
       --json \
       --processes $PROCESSES \
       --templates $TEMPLATES \
       --output $OUTPUT \
       --bytes 10M \
       --lists \
#       --links \
#       --sections \
#       --keep-tables \
#       --compress \
       --min_text_length 0 \
       --filter_disambig_pages
