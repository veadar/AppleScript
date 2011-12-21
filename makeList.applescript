on makeList(theText, theDelimiter) --テキストを指定語句で区切り配列に格納する
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theList to every text item of theText
	set AppleScript's text item delimiters to tmp
	return theList
end makeList