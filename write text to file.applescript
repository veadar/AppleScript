(*
�ϐ����e�L�X�g�t�@�C���ɏ����o���܂��B

�Ȃ���ΐV�K�Ƀt�@�C�������A�t�@�C��������ΒǋL

�����R�[�h�͉p�ꂾ���Ȃ�UTF-8 ���{��Ȃ��Shift-JIS�ɂȂ�܂�

���l�^ http://bowz.info/?p=1239
*)

tell application "Finder"
	set aText to ("���{��̃T���v��������" & return)
	set aTextFile to open for access ((desktop as text) & "test.txt") with write permission
	set aEOF to get eof of aTextFile
	try
		write aText starting at (aEOF + 1) to aTextFile
	on error aErrorText
		display dialog aErrorText
	end try
	close access aTextFile
end tell