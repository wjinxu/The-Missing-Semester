#!/bin/bash
curl 'https://codeforces.com/api/contest.list?gym=false%22' > problem
#找到最快开始的比赛
jq -r '.result[] | select(.relativeTimeSeconds < 0)| "名称: \(.name) | 开始时间: \(.startTimeSeconds)"' problem | sed -E -n "s/.*开始时间:\ (.*)/\1/p" | tail -n1