# fix-bug

## 原因
動画 / データを圧縮するために使用するコーデックが H.264「H.264/MPEG-4 AVC」 と H.265「H.265/MPEG-H HEVC」で異なっていた。

### 詳しく
H.265コーデックは、H.264より、エンコード効率とビデオ品質が高いため、
全ての主流のデバイスにサポートするわけではない。
chromeなど、交換性のないブラウザでHEVC / H 265ビデオを再生する場合は、プロのh265プレーヤーが必要となるから。

**コーデックは、エンコード と デコードを双方向にすることができる機器・ソフトウェア**
一般的なエンコード =「符号化」「暗号化」「記号化」
デコードはその逆

**動画コーデックと音声コーデックに分けられる**

→ 今回のケースで言えば、音は表示されるが、動画が表示されないということは、動画に対するコーデックが上手くいかない。

動画の場合 = 「圧縮」「変換」

2017 ~ 
HEVC コーデック 参考資料
> https://ogawadan.com/hevc-codec-iphone-mac-gopro/ 

![timeline](https://user-images.githubusercontent.com/56709557/100423123-d7644100-30ce-11eb-95bd-6cebb5cd0fa0.png)

参考サイト
> https://kakonacl.xsrv.jp/h265_vp9/h264_mediacoder_html5.html

### 動画や音声を加工するのに強力で万能な簡単ツールFFmpeg
>https://qiita.com/cha84rakanal/items/e84fe4eb6fbe2ae13fd8

1) install
```
brew install ffmpeg
```

2) imageが格納されているpathまで移動

3) ffmpeg -i [変換したい動画ファイル] [変換したファイル]



# Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Run your unit tests
```
npm run test:unit
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
