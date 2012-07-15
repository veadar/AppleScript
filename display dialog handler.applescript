property msg1 : "display dialog return to answer"
property defaultAnswer1 : "default answer"

property msg2 : "display dialog return to button"
property buttonList : {"button1", "button2", "button3"}

dda(msg1, defaultAnswer1)

ddb(msg2, buttonList)

on dda(msg, defaultAnswer)
	display dialog msg default answer defaultAnswer buttons {"OK"} default button 1
	return text returned of result
end dda

on ddb(msg, buttonList)
	display dialog msg as text buttons buttonList default button length of buttonList
	return button returned of result
end ddb