#! /usr/bin/env sh
# 删除符合规则区间内的文件

ls | awk '$1 < "cost.2015-10-16_07-31-01" || $1 > "cost.2015-10-16_10-01-01"  {print $1}' | xargs rm 

