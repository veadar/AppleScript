OSVersionCheck(8)

on OSVersionCheck(os_number)
	
	system attribute "sys2"
	
	if result > os_number - 1 then
		
		true
		
	else
		
		false
		
	end if
	
end OSVersionCheck