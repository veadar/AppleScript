--Start setup should change

property growlAppName : "hoge" --Application Name
property allNotification : {"�ʒm", "����", "�G���["} --Growl Notifecation Name
property defaultNotification : {"�ʒm", "����"} ---Growl Notifecation Name Contain allNotification
property growlIcon : "Finder" --Growl Icon
property growlTitle : "�^�C�g��" --Growl Title

--End setup

notification("�{��", "�ʒm") --use example

on notification(ntext, selectNotification) --ntext=display text selectNotification=notification name
	
	if GrowlRunning() then
		
		tell application "Growl"
			register as application ��
				growlAppName all notifications allNotification ��
				default notifications defaultNotification ��
				icon of application growlIcon
		end tell
		
		tell application "Growl"
			notify with name ��
				selectNotification title ��
				growlTitle description ��
				ntext application name ��
				growlAppName
		end tell
	else
		display dialog ntext giving up after 2 buttons {"OK"} default button 1
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