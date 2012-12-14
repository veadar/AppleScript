set theText to "�����X�͌��{�����B�K���A���̎גq�\�s�̉��������Ȃ���΂Ȃ�ʂƌ��ӂ����B�����X�ɂ͐������킩��ʁB�����X�́A���̖q�l�ł���B�J�𐁂��A�r�ƗV��ŕ邵�ė����B����ǂ��׈��ɑ΂��ẮA�l��{�ɕq���ł������B"

splitWord(theText, 20)

-- result {"�����X�͌��{�����B�K���A���̎גq�\�s�̉�", "�������Ȃ���΂Ȃ�ʂƌ��ӂ����B�����X��", "�͐������킩��ʁB�����X�́A���̖q�l�ł�", "��B�J�𐁂��A�r�ƗV��ŕ邵�ė����B����", "�ǂ��׈��ɑ΂��ẮA�l��{�ɕq���ł�����"}

on splitWord(theText, theNumber)
	set totalNumber to number of theText
	
	set splitNumber to theNumber
	
	set repeatNumber to totalNumber div splitNumber
	
	set wordList to {}
	
	set startNumber to 1
	
	repeat repeatNumber times
		set end of wordList to characters startNumber thru {(startNumber + splitNumber) - 1} of theText as text
		set startNumber to startNumber + splitNumber
	end repeat
	
	return wordList
end splitWord