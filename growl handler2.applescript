--Start setup should change

property growlAppName : "hoge" --Application Name
property allNotification : {"通知", "完了", "エラー"} --Growl Notifecation Name
property defaultNotification : {"通知", "完了"} ---Growl Notifecation Name Contain allNotification
property growlIcon : "Finder" --Growl Icon

--End setup

notification("通知", "Title", "honbun", "ical://") --use example

on notification(selectNotification, growlTitle, notificationText, callbackURL) --notificationText=display text , selectNotification=notification name
	
	if GrowlRunning() then
		
		tell application id "com.Growl.GrowlHelperApp"
			register as application ￢
				growlAppName all notifications allNotification ￢
				default notifications defaultNotification ￢
				icon of application growlIcon
		end tell
		
		tell application id "com.Growl.GrowlHelperApp"
			notify with name ￢
				selectNotification title ￢
				growlTitle description ￢
				notificationText application name ￢
				growlAppName callback URL ￢
				callbackURL
		end tell
	else
		display dialog notificationText giving up after 2 buttons {"OK"} default button 1
	end if
end notification

on GrowlRunning()
	
	if runningProcess("GrowlHelperApp") then
		
		return true
		
	else if runningProcess("Growl") then
		
		return true
		
	else
		
		return false
		
	end if
	
end GrowlRunning

on runningProcess(appName) --return true or false
	
	tell application "System Events"
		
		if application process appName exists then
			return true
		else
			return false
		end if
		
	end tell
	
end runningProcess