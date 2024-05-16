#!/bin/bash

if [ "$#" -ne 2 ]
then
	echo "# Auto downlaod Twitch vod and generate subtitles"
	echo "$0 Save_Folder Stream_URL"
else
	while true
	do
		nowDate=$(date '+%Y-%m-%d_%H-%M-%S')
		vodFileTs="$1/$(basename $2)_$nowDate.ts"
		vodFileMp4="$1/$(basename $2)_$nowDate.mp4"

		echo "##### Check Time : $nowDate"

		streamlink --twitch-disable-ads --output "$vodFileTs" "$2" best

		if [ -f $vodFileTs ]
		then
			nohup ffmpeg -i "$vodFileTs" -c:v copy -c:a copy -bsf:a aac_adtstoasc -y "$vodFileMp4" ; whisper --language Chinese --model large "$vodFileMp4" --initial_prompt "以下是普通話的句子。" --output_dir $1 --output_format srt > /dev/null 2>&1 &
		fi
		sleep 2
	done
fi

