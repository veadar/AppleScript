--Example

if runningProcess("Finder") then
	beep
end if

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