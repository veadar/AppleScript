(*
�����p��tempoary folder��tmporary items foder�iuser domain)�ɍ쐬����alias��Ԃ�
���łɑ��݂���ꍇ�ɂ͍쐬�����Atemporary folder��alias��Ԃ�

�ꎞ�I�Ƀt�@�C����ۑ����Ă����������Ȃǂɂ��̂������֗��B

�l�^�� http://piyocast.com/as/archives/102
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