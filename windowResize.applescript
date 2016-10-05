set window1Bounds to {100, 0, 1000, 1000} -- {top left x,top left y,bottom right x,bottom right y}
set appName to "MacDown"

windowResize(appName, window1Bounds)

on windowResize(appName, window1Bounds)
	--tell application appName to activate
	
	if runningProcess(appName) then
		try
			
			tell application "System Events" to tell application process appName
				
				tell item 1 of (every window whose subrole is "AXStandardWindow")
					set theList to {{(item 3 of window1Bounds) - (item 1 of window1Bounds), (item 4 of window1Bounds) - (item 2 of window1Bounds)}, {item 1 of window1Bounds, item 2 of window1Bounds}}
					set {size, position} to theList
					
				end tell
			end tell
			
			return true
			
		on error
			return false
		end try
	else
		return false
	end if
	
	
end windowResize

on runningProcess(appName) --return true or false
	try
		application appName is running
	on error -- for can not use "is running"
		tell application "System Events"
			
			if application process appName exists then
				return true
			else
				return false
			end if
			
		end tell
	end try
end runningProcess