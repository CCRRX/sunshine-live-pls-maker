#!/bin/bash
#last time this shit was working -> 31.03.2020 :P

wget -q http://stream.sunshine-live.de/

n=1

cat index.html | grep 'mp3-192/stream.sunshine-live.de/"' | cut -c 59- | rev | cut -c40- | rev | cut -f1 -d'"' > ssl-streams
l=$(wc -l < ssl-streams)

echo "[playlist]"
echo "NumberOfEntries=$l"
echo ""

while read p; do
  var=${p::-33}
  var2=${var:31}
  echo "File$n=$p"
  echo "Title$n=$var2"
  echo "Length1=-1"
  echo ""
  n=$((n + 1))
done < ssl-streams

rm ssl-streams
rm index.html
