#!/bin/bash

# 出力から温度を抽出する方法に依存することになりますが、例としてgrepとawkを使用します
output=$(python DHT11_Python/checkTemp.py) 
echo $output

# 温度を抽出する（この例ではawkを使用）
temperature=$(echo "$output" | grep -oP 'Temperature: \K[0-9.]+' | awk '{print $1}')
echo $temperature 

# 温度が18度を超えている場合に処理を行う
if (( $(echo "$temperature > 18" | bc -l) )); then
    echo "Temperature is greater than 27 C. Executing next program..."
    python3 lineNotify.py $temperature
    python3 ~/irrp.py -p -g17 -f codes airconditioner:on  
fi
