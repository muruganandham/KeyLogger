# KeyLogger
Capture your key events anywhere in macOSX. This project is availble to use educational and trainging purposes.


<img src="KeyLogger/script.png?raw=true" alt="" title="script" align="center" />

### Apple script to enable the GUI Scripting

```Obj-C

enable_GUI_scripting()
on enable_GUI_scripting()
tell application "System Events" to if not UI elements enabled then
tell me
activate
display dialog "This script requires the built-in Graphic User Interface Scripting architecture of Mac OS X, which is currently disabled." & return & return & "Enable GUI Scripting now? (You may be asked to enter your password.)" buttons {"Cancel", "Enable"} default button 2 with icon 2
end tell
set UI elements enabled to true
if not UI elements enabled then error number -128
end if
return "yes"
end enable_GUI_scripting
```
To Manually enable the settings: Go to settings-> Accessibility-> enable Xcode

<img src="KeyLogger/settings.png?raw=true" alt="" title="settings" align="center" />
