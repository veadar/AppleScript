(*
変数をテキストファイルに書き出します。

なければ新規にファイルを作り、ファイルがあれば追記

文字コードは英語だけならUTF-8 日本語ならばShift-JISになります

元ネタ http://bowz.info/?p=1239
*)

tell application "Finder"
	set aText to ("日本語のサンプル文字列" & return)
	set aTextFile to open for access ((desktop as text) & "test.txt") with write permission
	set aEOF to get eof of aTextFile
	try
		write aText starting at (aEOF + 1) to aTextFile
	on error aErrorText
		display dialog aErrorText
	end try
	close access aTextFile
end tell