(*
���s���Ƃɕ������z��ɓ����
��s�͍폜
*)

set hoge to "�e�X�g�B

���̋�s���폜����Ĕz��Ɋi�[�����B"

deleteEmptyLine(hoge)

--result -> {"�e�X�g�B", "���̋�s���폜����Ĕz��Ɋi�[�����B"}

on deleteEmptyLine(x) --x������
	
	set y to every paragraph of x
	
	set z to {}
	
	repeat with i from 1 to length of y
		if item i of y is not "" then
			set end of z to item i of y
		end if
	end repeat
	
	return z --as string ������Ε��͂ŕԂ�
end deleteEmptyLine