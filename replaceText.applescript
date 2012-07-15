(*
delimitersを利用してテキスト検索&置換
http://www.tonbi.jp/AppleScript/tips/String/FindReplace.html
*)

set sampleText to "美しい女性を口説こうと思った時、ライバルの男がバラの花を１０本贈ったら、君は１５本贈るかい？？"

replaceText(sampleText, "美しい女性", "ティム・クック")

-- result -> "ティム・クックを口説こうと思った時、ライバルの男がバラの花を１０本贈ったら、君は１５本贈るかい？？"

on replaceText(theText, serchStr, replaceStr)
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to serchStr
	set theList to every text item of theText
	set AppleScript's text item delimiters to replaceStr
	set theText to theList as string
	set AppleScript's text item delimiters to tmp
	return theText
end replaceText

(*
on replaceText(theText, serchStr, replaceStr)
	do shell script "echo " & quoted form of theText & " |  sed -e  's/" & serchStr & "/" & replaceStr & "/g'"
end replaceText
*)