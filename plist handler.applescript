(*
parseAndRetPlistEntryFromFile
http://piyocast.com/as/archives/957

extractInfoPlistAndFindString
http://piyocast.com/as/archives/3034
*)

set bID to "com.yourcompany.name" --example

(*
set appName to name of me

set bID to id of application appName
*)

plistWrite(bID, "id", "veadar")

plistRead(bID, "id")
-- result -> "veadar"
plistDelete(bID, "id")

plistRead(bID, "id")
-- result -> ""

on plistWrite(bID, theKey, theValue)
	set shellText to "defaults write " & bID & " '" & theKey & "' -string '" & theValue & "'"
	do shell script shellText
end plistWrite

on plistRead(bID, theKey)
	set shellText to "defaults read " & bID & " '" & theKey & "'  | native2ascii -reverse -encoding UTF-8"
	do shell script shellText
end plistRead

on plistDelete(bID, theKey)
	set shellText to "defaults delete " & bID & " " & quoted form of theKey
	do shell script shellText
end plistDelete

on plistAllDelete(bID)
	set shellText to "defaults delete " & bID
	do shell script shellText
end plistAllDelete

--PlistファイルをParseしてレコードにして返す
on parseAndRetPlistEntryFromFile(aFile)
	set f to POSIX path of aFile
	set res to {}
	try
		tell application "System Events"
			set plif to property list file f
			set pitm to every property list item of plif
			repeat with p in pitm
				set end of res to {name, value} of p
			end repeat
		end tell
	on error
		return {}
	end try
	return res
end parseAndRetPlistEntryFromFile

--指定のInfoPlist（たぶん）をextractして指定文字列を含んでいるかチェック
on extractInfoPlistAndFindString(aFile, findStr)
	
	set aPosix to quoted form of POSIX path of aFile
	set a to (do shell script "/usr/bin/plutil -p " & aPosix)
	
	set b to (a contains findStr)
	return b
	
end extractInfoPlistAndFindString