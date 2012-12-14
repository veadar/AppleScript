set theText to "メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。"

splitWord(theText, 20)

-- result {"メロスは激怒した。必ず、かの邪智暴虐の王", "を除かなければならぬと決意した。メロスに", "は政治がわからぬ。メロスは、村の牧人であ", "る。笛を吹き、羊と遊んで暮して来た。けれ", "ども邪悪に対しては、人一倍に敏感であった"}

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