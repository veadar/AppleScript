(*
自分用のtempoary folderをtmporary items foder（user domain)に作成してaliasを返す
すでに存在する場合には作成せず、temporary folderのaliasを返す

一時的にファイルを保存しておきたい時などにものすごい便利。

ネタ元 http://piyocast.com/as/archives/102
*)

set folRes to getMyTempItemFolder("hiyoko") of me

on getMyTempItemFolder(appID)
	set tmpFol to path to temporary items from user domain
	tell application "Finder"
		if not (exists folder appID of folder tmpFol) then
			set aFol to make new folder at folder tmpFol with properties {name:appID}
		else
			set aFol to folder appID of tmpFol
		end if
	end tell
	return aFol as alias
end getMyTempItemFolder