on makeList(theText, theDelimiter) --�e�L�X�g���w����ŋ�؂�z��Ɋi�[����
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theList to every text item of theText
	set AppleScript's text item delimiters to tmp
	return theList
end makeList