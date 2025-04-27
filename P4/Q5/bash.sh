#!/bin/bash
for i in {1..3}; do
    journalctl -b -$i >> time
    cat time | sed -n -E "s/.*xuxubaobao-virtual-machine(.*)/\1/p" | sort | uniq -c | awk '$1!=3  { print }' > different
done