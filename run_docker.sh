#!/bin/bash

# 获取当前时间戳
start_time=$(date +%s)

# 计算随机时间的秒数，范围是 5 小时 (18000 秒) 到 5 小时 50 分钟 (21000 秒)
random_duration=$((18000 + RANDOM % (21000 - 18000 + 1)))

# 计算结束时间戳
#end_time=$((start_time + random_duration))
end_time=$((start_time + 10*60))

# 循环检查时间，直到当前时间超过结束时间
while [ $(date +%s) -lt $end_time ]; do
    # 每隔一段时间检查一次，可以调整 sleep 的时间间隔
    sleep 60
done




# 当时间超过 4 小时 55 分钟后，停止 Docker 容器
echo "Stopping containers cf and xui..."
sudo docker stop cf 
sudo docker stop xui 
docker export xui | gzip > xui_img.tar.gz

sudo docker rm cf xui




