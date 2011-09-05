on notification(ntext, gn)
	
	if GrowlRunning() then
		tell application "GrowlHelperApp"
			notify with name ��
				gn title ��
				"fc2 upload image" description ��
				ntext application name ��
				"fc2 upload image"
		end tell
	else
		display dialog ntext giving up after 2 buttons {"OK"} default button 1
	end if
end notification

on GrowlRunning() --Growl���N�����Ă����true��Ԃ�
	tell application "System Events"
		set isRunning to ��
			(count of (every process whose name is "GrowlHelperApp")) > 0
		return isRunning
	end tell
end GrowlRunning