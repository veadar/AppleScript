set hoge to {}

set hoge to unshiftList(hoge, 1, 5)
--result {1}
set hoge to unshiftList(hoge, 2, 5)
--result {2,1}
set hoge to unshiftList(hoge, 3, 5)
--result {3,2,1}
set hoge to unshiftList(hoge, 4, 5)
--result {4,3,2,1}
set hoge to unshiftList(hoge, 5, 5)
--result {5,4,3,2,1}
set hoge to unshiftList(hoge, 6, 5)
--result {6,5,4,3,2}

on unshiftList(theList, theText, maxSize)
	
	set theList to (theText as list) & theList
	
	if length of theList > maxSize then
		
		set i to 1
		set tempList to {}
		repeat maxSize times
			set end of tempList to item i of theList
			set i to i + 1
		end repeat
		
		set theList to tempList
		
	end if
	
	return theList
end unshiftList