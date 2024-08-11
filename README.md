# TwitchVod2Text
### A script package that can transform Twitch VODs to substitles

## Build environment

### Create conda environment (env)
```conda create -n whisper python=3.9 -y```


### Open conda env
```conda activate whisper```


### Download ffmpeg
```conda install ffmpeg -y```


### Download streamlink
```pip install streamlink```


### Download whisper
```pip install -U openai-whisper```



## How to use whisper
### 中文
#### Basic usage
```whisper --language Chinese --model large {INPUT} --initial_prompt "以下是普通話的句子。"```

#### Output to srt
```whisper --language Chinese --model large {INPUT} --initial_prompt "以下是普通話的句子。" --output_dir {OUTPUT} --output_format srt```

#### Example
```whisper --language Chinese --model large data\input.mp4 --initial_prompt "以下是普通話的句子。" --output_dir data\output --output_format srt```


### English
#### Basic usage
```whisper --model large {INPUT}```

#### Output to txt
```whisper --model large {INPUT} --output_dir {OUTPUT} --output_format txt```

#### Example
```whisper --model large data\input.wav --output_dir data\output --output_format txt```



## How to use ffmpeg
### Extract wav from mp4 
```ffmpeg -i {INPUT}.mp4 -vn -ar 16000 -ac 1 -f wav {OUTPUT}.wav```


### Split file into multi part
```ffmpeg -i {INPUT} -f segment -segment_time {SECOND} -c copy {OUTPUT}-%03d```


