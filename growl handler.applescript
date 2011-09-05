--Start setup should change

property growlAppName : "hoge" --Application Name
property allNotification : {"通知", "完了", "エラー"} --Growl Notifecation Name
property defaultNotification : {"通知", "完了"} ---Growl Notifecation Name Contain allNotification
property growlIcon : "Finder" --Growl Icon
property growlTitle : "タイトル" --Growl Title

--End setup

notification("本文", "通知") --use example

on notification(ntext, selectNotification) --ntext=display text selectNotification=notification name
	
	if GrowlRunning() then
		
		tell application "GrowlHelperApp"
			register as application ￢
				growlAppName all notifications allNotification ￢
				default notifications defaultNotification ￢
				icon of application growlIcon
		end tell
		
		tell application "GrowlHelperApp"
			notify with name ￢
				selectNotification title ￢
				growlTitle description ￢
				ntext application name ￢
				growlAppName
		end tell
	else
		display dialog ntext giving up after 2 buttons {"OK"} default button 1
	end if
end notification

on GrowlRunning() --if growl activate return true
	tell application "System Events"
		set isRunning to ￢
			(count of (every process whose name is "GrowlHelperApp")) > 0
		return isRunning
	end tell
end GrowlRunning