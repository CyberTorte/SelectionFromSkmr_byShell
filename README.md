# SelectionFromSkmr_byShell

SelectionFromSkmrのプロトタイプの位置付けです

## 前提

PowerShellに最初からスクリプトファイルを読み込ませる
<br>
([ホームディレクトリのパス]\Documents\Microsoft.PowerShell_profile.ps1に記述する)
<br>
もしくは使うときにスクリプトファイルを読み込ませる
<br>
のどちらかをしてください。

`git clone`する際は
<br>
とりあえずどこでもいいのですが
<br>
各種.ps1ファイルの`$filePath`に正しいsongList.csvのパスを指定してください
<br>
例：ドキュメントにクローンした場合
<br>
`C:\Users\[ユーザ名]\Documents\SelectionFromSkmr_byShell\songList.csv`
<br>
となります。

## 使用方法

### selectSkmr(選曲プログラム)

PowerShellを立ち上げ

``` PowerShell:WindowsPowerShell
PS C:\Users\[ユーザ名]> selectSkmr [属性名]
```

と入力します。

[属性名]については
<br>
pretty, cool, activeの3つ(大文字小文字区別しません)
<br>
から選んで下さい。
<br>
指定しなければ全ての属性から選ばれます

限定曲に対応しているので
<br>
解放されていない曲は候補にも入らないです

一応日付(イベント等期限付き曲)にも対応しています
<br>
その場合は指定日時以降は候補に入りません

### addSongList(曲の追加)

PowerShellを立ち上げ

``` PowerShell:WindowsPowerShell
PS C:\Users\[ユーザ名]> addSkmr [曲名] [属性名] [限定名]
```

と入力します。

[属性名]は上記と同じ
<br>
pretty, cool, activeに加えall(全属性)
<br>
を登録できます

[限定名]は限定曲の曜日であったり
<br>
イベント曲の利用できる最終日時を登録できます

曜日ですが
<br>
ゲーム内では月、土、日が全曲解放されていますので
<br>
火曜日、水曜日、木曜日、金曜日の英語表記
<br>
もしくは短縮した頭文字3文字で登録できます
<br>
例：火曜日
<br>
`Tue` もしくは `Tuesday`

日付はPowerShellがparse出来る形式に限りますが
<br>
`2018/03/16 11:40:00`
<br>
が簡単な形式かと思います。
<br>
時間は省いても問題ないですが
<br>
多くが18時終了なので
<br>
1日遅らせて登録しないと機能しないと思われます

### updateSongList(曲属性更新)

PowerShellを立ち上げ

``` PowerShell:WindowsPowerShell
PS C:\Users\[ユーザ名]> updateSkmr [曲のID] [変更する項目名] [変更後の値]
```

と入力します。

イベント曲などの日付を
<br>
通常曲や限定曲に変更するための機能です。
<br>
項目名

- 曲識別ID：id
- 曲名：title
- 属性：type
- 限定名：limited

例：キミ、ボク、恋してる！を限定曲に戻す
<br>

``` PowerShell:WindowsPowerShell
PS C:\Users\[ユーザ名]> updateSkmr 32 limited "Fri"
```

### findSongList(曲のIDを取得)

PowerShellを立ち上げ

``` PowerShell:WindowsPowerShell
PS C:\Users\[ユーザ名]> findSongID [曲名]
```

と入力します。

曲名は今のところ完全一致でしか判断できないです
<br>
アルファベットのみ大文字小文字区別しません


