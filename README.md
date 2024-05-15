# TwitchVod2Text

```conda create -n whisper```

## ffmpeg
### Install
```conda install ffmpeg```

### Extract wav from mp4 
```ffmpeg -i {INPUT}.mp4 -vn -ar 16000 -ac 1 -f wav {OUTPUT}.wav```

### Split file into multi part
```ffmpeg -i {INPUT} -f segment -segment_time {SECOND} -c copy {OUTPUT}-%03d```

## whisper
### Install
```pip install -U openai-whisper```

### 辨識
#### 中文
##### 基本
```whisper --language Chinese --model large {INPUT} --initial_prompt "以下是普通話的句子。"```

#### 指定輸出
```whisper --language Chinese --model large {INPUT} --initial_prompt "以下是普通話的句子。" --output_dir {OUTPUT} --output_format srt```

##### 範例
```whisper --language Chinese --model large data\input.mp4 --initial_prompt "以下是普通話的句子。" --output_dir data\output --output_format srt```

#### 英文
##### 基本
```whisper --model large {INPUT}```

#### 指定輸出
```whisper --model large {INPUT} --output_dir {OUTPUT} --output_format txt```

##### 範例
```whisper --model large data\input.wav --output_dir data\output --output_format txt```
