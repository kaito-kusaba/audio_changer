## READ ME
毎回Windowsの再生デバイスからスピーカーとイヤホンを切り替えるのが面倒だったので「ダブルクリックで切り替えられたらいいな」と。

### できること
ダブルクリックすると設定したオーディオ再生デバイスを切り替えられます。

### 使い方
powershellを管理者権限で実行します。

AudioDeviceCmdlets モジュールがインストールされていない場合、PowerShellで次のコマンドを実行してインストールしてください。
```
$ Install-Module -Name AudioDeviceCmdlets -Force
```

オーディオデバイスの一覧を実行します。
```
$ Get-AudioDevice -list
```

いくつか一覧で出てくると思いますが、切り替えて使いたい再生デバイスのIDの部分をコピー
```
Index                : 1
Default              : False
DefaultCommunication : False
Type                 : Playback
Name                 : xxxxx (Sound Blaster Audigy 5/Rx)
ID                   : {0.0.0.00000000}.{0b7754a7-6f6e-4b0a-9ca7-818ff2ac8709}
Device               : CoreAudioApi.MMDevice

Index                : 2
Default              : False
DefaultCommunication : False
Type                 : Playback
Name                 : 3 - xxxxxx (AMD High Definition Audio Device)
ID                   : {0.0.0.00000000}.{2997c29c-ff78-41ea-93f6-1304cdc7b0c3}
Device               : CoreAudioApi.MMDevice
```

コピーしたIDをaudio.ps1の`$audioDevice1ID`と`$audioDevice2ID`の変数に置き換えてください。

エクスプローラを右クリック＞新規作成＞ショートカットから以下ように作成します。
```
powershell -ExecutionPolicy Bypass -File "audio.ps1までの絶対パス(例えば、D:\dev\audio.ps1)" 
```

これでダブルクリック実行で再生デバイスが切り替わります。


### トラブルシューティング
実行ポリシーがWindowsデフォルトではRestrictedか何かになっているはずなので、ローカルスクリプトを実行できるように権限を変更する必要があります。

次のコマンドを実行して現在のポリシーを確認
```
Get-ExecutionPolicy
```

ポリシー緩和のために以下のコマンドを実行
```
Set-ExecutionPolicy RemoteSigned
```

これで同様にショートカットから実行すればうまくいくかも
