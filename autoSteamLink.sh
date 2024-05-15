#!/bin/bash

if [ "$#" -ne 2 ]
then
        echo '##### Usage :'
        echo './THIS_PRG WORK_DIR STREAM_URL'
else
        while true
        do
                nowDate=$(date '+%Y-%m-%d_%H-%M-%S')
                echo "##### Check Time : $nowDate"
                streamlink --twitch-disable-ads --output "$1/$nowDate.ts" "$2" best
                if [ -f $1/$nowDate.ts ]
                then
                        echo "### Convert $1/$nowDate.ts to $1/$nowDate.mp4"
                        nohup ffmpeg -i "$1/$nowDate.ts" -c:v copy -c:a copy -bsf:a aac_adtstoasc -y "$1/$nowDate.mp4" > /dev/null 2>&1 &
                fi
                sleep 2
        done
fi

