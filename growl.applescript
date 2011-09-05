on notification(ntext, gn)
	
	if GrowlRunning() then
		tell application "GrowlHelperApp"
			notify with name Ê
				gn title Ê
				"fc2 upload image" description Ê
				ntext application name Ê
				"fc2 upload image"
		end tell
	else
		display dialog ntext giving up after 2 buttons {"OK"} default button 1
	end if
end notification

on GrowlRunning() --Growl‚ª‹N“®‚µ‚Ä‚¢‚ê‚Îtrue‚ð•Ô‚·
	tell application "System Events"
		set isRunning to Ê
			(count of (every process whose name is "GrowlHelperApp")) > 0
		return isRunning
	end tell
end GrowlRunning