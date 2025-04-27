#!/bin/bash
function_1() {
    time=$(for i in {0..9}; do
            journalctl -b-$i | grep "Startup finished in" | grep -E 'systemd\[1\]'
    done | sed -E -n "s/.*=\ ([0-9]+\.[0-9]+)s\.$/\1/p" | sort -n)
    #最长时间
    echo -e "$time" | tail -n1
    #最短时间
    echo "$time" | head -n1
    #平均数
    echo "$time" | paste -sd+ | bc -l | awk '{print $1/10}'
    # 中位数
    echo "$time" |paste -sd' ' | awk '{print ($5 + $6)/2}'
}
