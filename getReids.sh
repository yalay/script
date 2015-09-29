#! /usr/bin/env sh

# 比较主备cookie mapping redis
masterRedis="10.10.77.136 10.10.77.138 10.10.77.139 10.10.77.130 10.10.77.131
        10.10.77.132 10.10.85.98 10.10.85.99 10.10.85.100 10.10.85.101
        10.10.85.102 10.10.85.103 10.10.85.104 10.10.85.105"
redisPort=6380
declare -a keyList
declare -a masterValue
declare -a slaveValue
keyIndex=0
for host in $masterRedis;do
    randomKey=`redis-cli -h $host -p $redisPort RANDOMKEY`
    keyList[keyIndex]=$randomKey

    value=`redis-cli -h $host -p $redisPort GET $randomKey`
    masterValue[keyIndex]=$value
    keyIndex=$keyIndex+1
done

slaveRedis="10.21.70.200 10.21.70.202 10.21.70.204 10.21.70.205 10.21.70.212
            10.21.70.213 10.21.70.214 10.21.70.215 10.21.70.216 10.21.70.217
            10.21.70.218 10.21.70.219 10.21.70.220 10.21.70.221"
redisPort=6380
keyIndex=0
for host in $slaveRedis;do
    value=`redis-cli -h $host -p $redisPort GET ${keyList[keyIndex]}`
    slaveValue[keyIndex]=$value
    echo `redis-cli -h $host -p $redisPort GET ${keyList[keyIndex]}`
    keyIndex=$keyIndex+1
done




