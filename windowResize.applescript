set window1Size to {500, 500}
set window1Position to {100, 0}

set appName to "Sublime Text"

windowResize(appName, window1Size, window1Position)

getWindowBounds(appName) -- menubar height is 22 pixels

getDockWidth()

on windowResize(appName, window1Size, window1Position)
	--tell application appName to activate
	
	if runningProcess(appName) then
		try
			
			tell application "System Events" to tell application process appName
				
				tell item 1 of (every window whose subrole is "AXStandardWindow")
					
					set {size, position} to {window1Size, window1Position}
					
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

on getWindowBounds(appName)
	if runningProcess(appName) then
		try
			
			tell application "System Events" to tell application process appName
				
				tell item 1 of (every window whose subrole is "AXStandardWindow")
					
					set window1Bounds to {size, position}
					
				end tell
			end tell
			
			return window1Bounds
			
		on error
			return false
		end try
	else
		return false
	end if
end getWindowBounds

on getDockWidth()
	try
		tell application "System Events" to tell process "Dock"
			set dock_dimensions to size in list 1
			set dock_width to item 1 of dock_dimensions
			return dock_width as number
		end tell
	on error
		return 38
	end try
end getDockWidth

on dockHideCheck()
	tell application "System Events"
		tell dock preferences
			autohide
		end tell
	end tell
end dockHideCheck

on dockPosition()
	tell application "System Events"
		tell dock preferences
			screen edge
			return result as text
		end tell
	end tell
end dockPosition

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