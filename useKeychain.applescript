property msg1 : "Input Your Account"
property msg2 : "Input Your Password"

property yourAppName : "dummyApp"

makePassword(yourAppName)

pullPassword(yourAppName)

on makePassword(appName)
	set usrAccount to dda(msg1)
	set usrPassword to dda(msg2)
	set shellTxt to "security add-generic-password -s " & appName & " -a " & usrAccount & " -p " & usrPassword
	do shell script shellTxt
end makePassword

on pullPassword(appName)
	set shellTxt to "security 2>&1 >/dev/null find-generic-password -gs " & appName & " | ruby -e 'print $1 if STDIN.gets =~ /^password: €"(.*)€"$/'"
	do shell script shellTxt
end pullPassword

on pullAccoutName(appName)
	do shell script "security find-generic-password -gs " & appName
	set textList to every paragraph of result
	
	repeat with i from 1 to length of textList
		if item i of textList contains "acct" then
			set resultList to makeList(item i of textList, "€"")
			return item ((length of resultList) - 1) of resultList
		end if
	end repeat
	
end pullAccoutName

on deletePassword(appName)
	set shellTxt to "security delete-generic-password -s " & appName
	do shell script shellTxt
end deletePassword

on lockKeychain()
	set shellTxt to "security lock-keychain"
	do shell script shellTxt
end lockKeychain

on dda(msg)
	display dialog msg default answer "" buttons {"OK"} default button 1
	return text returned of result
end dda

on ddb(msg, buttonList)
	display dialog msg as text buttons buttonList default button length of buttonList
	return button returned of result
end ddb

on makeList(theText, theDelimiter) --ƒeƒLƒXƒg‚ğw’èŒê‹å‚Å‹æØ‚è”z—ñ‚ÉŠi”[‚·‚é
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theList to every text item of theText
	set AppleScript's text item delimiters to tmp
	return theList
end makeList