current date -->"2012”N1ŒŽ18“ú…—j“ú 16:00:00"

test

convertDate(result) -->"2012/1/18"

on convertDate(myDate)
	return year of myDate & "/" & convertMonth(month of myDate) & "/" & day of myDate as text
end convertDate

on convertMonth(myMonth)
	set monthList to {January, February, March, April, May, June, July, August, September, October, November, December}
	
	
	repeat with i from 1 to (length of monthList)
		if myMonth = item i of monthList then
			return i
		end if
	end repeat
	
end convertMonth