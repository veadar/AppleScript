--Example

if runningProcess("Finder") then
	beep
end if


on runningProcess(appName) --return true or false
	
	tell application "System Events"
		set appList to name of (application processes)
	end tell
	
	if appList contains appName then
		return true
	else
		return false
	end if
	
end runningProcess