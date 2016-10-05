set window1Bounds to {100, 0, 1000, 1000}
set appName to "Sublime Text"

windowResize(appName, window1Bounds)

on windowResize(appName, window1Bounds)
	
	try
		tell application appName
			tell window 1
				
				set bounds to window1Bounds
			end tell
		end tell
		
		return true
	on error
		
		try
			delay 0.5
			tell application "System Events" to tell application process appName
				--tell application appName to activate
				tell first window
					set theList to {{(item 3 of window1Bounds) - (item 1 of window1Bounds), (item 4 of window1Bounds) - (item 2 of window1Bounds)}, {item 1 of window1Bounds, item 2 of window1Bounds}}
					set {size, position} to theList
					
				end tell
			end tell
			
			return true
			
		on error
			return false
		end try
		
	end try
	
	
end windowResize