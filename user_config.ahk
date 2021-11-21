
CapsLock & 1::switchDesktopByNumber(1)
CapsLock & 2::switchDesktopByNumber(2)
CapsLock & 3::switchDesktopByNumber(3)
CapsLock & 4::switchDesktopByNumber(4)
CapsLock & 5::switchDesktopByNumber(5)
CapsLock & 6::switchDesktopByNumber(6)
CapsLock & 7::switchDesktopByNumber(7)
CapsLock & 8::switchDesktopByNumber(8)
CapsLock & 9::switchDesktopByNumber(9)

CapsLock & Numpad1::switchDesktopByNumber(1)
CapsLock & Numpad2::switchDesktopByNumber(2)
CapsLock & Numpad3::switchDesktopByNumber(3)
CapsLock & Numpad4::switchDesktopByNumber(4)
CapsLock & Numpad5::switchDesktopByNumber(5)
CapsLock & Numpad6::switchDesktopByNumber(6)
CapsLock & Numpad7::switchDesktopByNumber(7)
CapsLock & Numpad8::switchDesktopByNumber(8)
CapsLock & Numpad9::switchDesktopByNumber(9)

CapsLock & n::switchDesktopToRight()
CapsLock & p::switchDesktopToLeft()
CapsLock & s::switchDesktopToRight()
CapsLock & a::switchDesktopToLeft()
CapsLock & tab::switchDesktopToLastOpened()

CapsLock & c::createVirtualDesktop()
CapsLock & d::deleteVirtualDesktop()

CapsLock & q::MoveCurrentWindowToDesktop(1)
CapsLock & w::MoveCurrentWindowToDesktop(2)
CapsLock & e::MoveCurrentWindowToDesktop(3)
CapsLock & r::MoveCurrentWindowToDesktop(4)
CapsLock & t::MoveCurrentWindowToDesktop(5)
CapsLock & y::MoveCurrentWindowToDesktop(6)
CapsLock & u::MoveCurrentWindowToDesktop(7)
CapsLock & i::MoveCurrentWindowToDesktop(8)
CapsLock & o::MoveCurrentWindowToDesktop(9)

CapsLock & Right::MoveCurrentWindowToRightDesktop()
CapsLock & Left::MoveCurrentWindowToLeftDesktop()


ExtractAppTitle(FullTitle)
{	
	AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
	Return AppTitle
}


; Alt + ` -  Activate NEXT Window of same type (title checking) of the current APP
!`::
WinGet, ActiveProcess, ProcessName, A
WinGet, OpenWindowsAmount, Count, ahk_exe %ActiveProcess%

If OpenWindowsAmount = 1  ; If only one Window exist, do nothing
    Return
	
Else
	{
		WinGetTitle, FullTitle, A
		AppTitle := ExtractAppTitle(FullTitle)

		SetTitleMatchMode, 2		
		WinGet, WindowsWithSameTitleList, List, %AppTitle%
		If WindowsWithSameTitleList > 1 ; If several Window of same type (title checking) exist
		{	
			WinGet, pname, ProcessName, % "ahk_id" WindowsWithSameTitleList%WindowsWithSameTitleList%
			idx := WindowsWithSameTitleList
			while pname != ActiveProcess
			{
				idx := idx - 1
				; MsgBox, idx is "%idx%"
				WinGet, pname, ProcessName, % "ahk_id" WindowsWithSameTitleList%idx%
			}
			WinActivateBottom, % "ahk_id " WindowsWithSameTitleList%idx%
		}
	}
Return


!a::
DetectHiddenWindows, On
WinGet, ActiveProcess, ProcessName, A
WinGetClass, class, A
WinGet, ahk_id, ID, A
WinGetTitle, FullTitle, A
AppTitle := ExtractAppTitle(FullTitle)
SetTitleMatchMode, 2		
WinGet, WindowsWithSameTitleList, List, %AppTitle%
MsgBox, The active window's class is "%class%".  FullTitle is "%FullTitle%".   ActiveProcess is "%ActiveProcess%".   AppTitle is "%AppTitle%". ahk_id is "%ahk_id%"  WindowsWithSameTitleList is "%WindowsWithSameTitleList%" "%WindowsWithSameTitleList1%" "%WindowsWithSameTitleList2%"  "%WindowsWithSameTitleList3%"  "%WindowsWithSameTitleList4%"  "%WindowsWithSameTitleList5%"   

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


!d::
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winId, ID, Administrator ahk_exe datagrip64.exe ahk_class SunAwtFrame
If not WinExist("ahk_id " winId)
{
	Run, C:\Program Files\JetBrains\DataGrip 2021.2.2\bin\datagrip64.exe
}
else
{
	IfWinNotActive ahk_id %winId%
	{
		WinActivate ahk_id %winId%
	}
	Else
	{
		WinMinimize ahk_id %winId%
	}
}
Return


!i::
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winId, ID, Administrator ahk_exe idea64.exe ahk_class SunAwtFrame
If not WinExist("ahk_id " winId)
{
	Run, C:\Program Files\JetBrains\IntelliJ IDEA 2019.3.3\bin\idea64.exe
}
else
{
	IfWinNotActive ahk_id %winId%
	{
		WinActivate ahk_id %winId%
	}
	Else
	{
		WinMinimize ahk_id %winId%
	}
}
Return


!n::
DetectHiddenWindows, On
IfWinNotExist OneNote
{
	Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote 2016.lnk
}
Else
{
	IfWinNotActive OneNote
	{
		WinActivate OneNote
	}
	Else
	{
		WinMinimize OneNote
	}
}
Return



!p::
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winId, ID, Administrator ahk_exe pycharm64.exe ahk_class SunAwtFrame
If not WinExist("ahk_id " winId)
{
	Run, C:\Program Files\JetBrains\PyCharm 2020.1\bin\pycharm64.exe
}
else
{
	IfWinNotActive ahk_id %winId%
	{
		WinActivate ahk_id %winId%
	}
	Else
	{
		WinMinimize ahk_id %winId%
	}
}
Return



!s::
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winId, ID, Administrator ahk_exe studio64.exe ahk_class SunAwtFrame
If not WinExist("ahk_id " winId)
{
	Run, C:\Program Files\Android\Android Studio\bin\studio64.exe
}
else
{
	IfWinNotActive ahk_id %winId%
	{
		WinActivate ahk_id %winId%
	}
	Else
	{
		WinMinimize ahk_id %winId%
	}
}
Return

!t::
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winId, ID, ahk_exe WindowsTerminal.exe ahk_class CASCADIA_HOSTING_WINDOW_CLASS
; MsgBox, winId is "%winId%"
If not WinExist("ahk_id " winId)
{
	Run, "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.11.2921.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
}
else
{
	IfWinNotActive ahk_id %winId%
	{
		WinActivate ahk_id %winId%
	}
	Else
	{
		WinMinimize ahk_id %winId%
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


!y::
DetectHiddenWindows, On
IfWinNotExist, ahk_class OrpheusBrowserHost
{
	Run, C:\Users\fgdfr\Software\CloudMusic\cloudmusic.exe
}
Else
{
	IfWinNotActive, ahk_class OrpheusBrowserHost
	{
		WinActivate, ahk_class OrpheusBrowserHost
	}
	Else
	{
		WinMinimize, ahk_class OrpheusBrowserHost
	}
}
Return