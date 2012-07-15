(*
delimiters�𗘗p���ăe�L�X�g����&�u��
http://www.tonbi.jp/AppleScript/tips/String/FindReplace.html
*)

set sampleText to "���������������������Ǝv�������A���C�o���̒j���o���̉Ԃ��P�O�{��������A�N�͂P�T�{���邩���H�H"

replaceText(sampleText, "����������", "�e�B���E�N�b�N")

-- result -> "�e�B���E�N�b�N�����������Ǝv�������A���C�o���̒j���o���̉Ԃ��P�O�{��������A�N�͂P�T�{���邩���H�H"

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