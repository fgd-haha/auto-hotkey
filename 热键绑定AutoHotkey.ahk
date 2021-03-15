^Up::
WinGetClass, class, A
WinGetTitle, Title, A
MsgBox, class "%class%" title "%Title%" 
return

!w::
DetectHiddenWindows, On
IfWinNotExist, ahk_class WeChatMainWndForPC
{
	Run, C:\Users\fgdfr\Software\WeChat\WeChat.exe
}
Else
{
	IfWinNotActive, ahk_class WeChatMainWndForPC
	{
		WinActivate, ahk_class WeChatMainWndForPC
	}
	Else
	{
		WinMinimize, ahk_class WeChatMainWndForPC
	}
}
Return

!d::
DetectHiddenWindows, On
IfWinNotExist 滴答清单
{
	Run, C:\Program Files (x86)\滴答清单\TickTick.exe
}
Else
{
	IfWinNotActive 滴答清单
	{
		WinActivate 滴答清单
	}
	Else
	{
		WinMinimize 滴答清单
	}
}
Return


!c::
DetectHiddenWindows, On
SetTitleMatchMode RegEx
IfWinNotExist .*Chrome
{
	Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
}
Else
{
	IfWinNotActive .*Chrome
	{
		WinActivate .*Chrome
	}
	Else
	{
		WinMinimize .*Chrome
	}
}
Return


!p::
DetectHiddenWindows, On
IfWinNotExist ahk_class SunAwtFrame
{
	Run, C:\Program Files\JetBrains\PyCharm 2020.1\bin\pycharm64.exe
}
Else
{
	IfWinNotActive ahk_class SunAwtFrame
	{
		WinActivate ahk_class SunAwtFrame
	}
	Else
	{
		WinMinimize ahk_class SunAwtFrame
	}
}
Return


!v::
DetectHiddenWindows, On
SetTitleMatchMode RegEx
IfWinNotExist .*Visual Studio Code
{
	Run, C:\Users\fgdfr\AppData\Local\Programs\Microsoft VS Code\Code.exe
}
Else
{
	IfWinNotActive .*Visual Studio Code
	{
		WinActivate .*Visual Studio Code
	}
	Else
	{
		WinMinimize .*Visual Studio Code
	}
}
Return