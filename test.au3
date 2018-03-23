#include <Misc.au3>

#cs
;;测试tooltip
; This will create a tooltip in the upper left of the screen
Local $startTime = TimerInit()
;ToolTip("请在 “文章内容”编辑框中 点一下……", Default, Default, "准备开始")
While (Not _IsPressed("01") And TimerDiff($startTime) < 3000)
	ToolTip("请在 “文章内容”编辑框中 点一下……", Default, Default, "准备开始")
	Sleep(128)
	;ToolTip("")
WEnd
ToolTip("")
;Sleep(2000) ; Sleep to give tooltip time to display
#ce

;;测试图片查找
#include <MsgBoxConstants.au3>
#include <GDIPlus.au3>
#include <af_search_pic.au3>;包含阿福源代码文件到脚本中

#cs
#Region 
#AutoIt3Wrapper_Res_File_Add="d:\Docs\htMode.png"
#EndRegion
Local $iconPath=@TempDir&"\htMode.png"
FileInstall("d:\Docs\htMode.png",$iconPath,1)

Sleep(3000)
;~ Local $hndImage = _GDIPlus_BitmapCreateFromFile($iconPath)
;~ $err = @extended
;~ Local $hImage= _GDIPlus_ImageGetHeight($hndImage)
;~ Local $wImage= _GDIPlus_ImageGetWidth($hndImage)
;_GDIPlus_BitmapDispose($hndImage)
$t=TimerInit()
search_pic (0,0, @DesktopWidth, @DesktopHeight,$iconPath) ;search_pic($x1,$y1,$x2,$y2,$pic)"当前屏幕找图",说明：$x1:屏幕上的左上角X坐标,$y1:屏幕上的左上角Y坐标,$x2:屏幕上的右下角X坐标,$y2:屏幕上的右下角Y坐标,$pic:要找图的路径及名称,$aPosMsg:返回坐标值(X坐标,Y坐标,长,高)
If $aPosMsg<>"" Then
$array=StringSplit ($aPosMsg,",",2)
ConsoleWrite(TimerDiff($t)&@CRLF)
;ConsoleWrite(TimerDiff($t)&@CRLF&"wImage = "&$wImage&@CRLF)
;~ MsgBox(0,"","["&$aPosMsg&"]")
;~ MouseClick("", $array[0]+$array[2]/2, $array[1]+$array[3]/2)
MouseMove($array[0]+$array[2]/2, $array[1]+$array[3]/2) 
EndIf
#ce

#cs
Example()

Func Example()
    ; Write the value of 'AutoIt' to the key 'Title' and in the section labelled 'General'.
	Local $iniPath=@ScriptDir &"\"&@ScriptName&".ini"
	FileOpen($iniPath, 512)
    IniWrite($iniPath, "General", "Title", "AutoIt中文测试一")

    ; Read the INI file for the value of 'Title' in the section labelled 'General'.
    Local $sRead = IniRead($iniPath, "General", "Title", "Default Value"&@CRLF&@ScriptDir)

    ; Display the value returned by IniRead.
    MsgBox(4096, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the key labelled 'Title'.
;~     IniDelete($iniPath, "General", "Title")

    ; Read the INI file for the value of 'Title' in the section labelled 'General'.
;~     $sRead = IniRead($iniPath, "General", "Title", "Default Value")
;~     $sRead = IniRead($iniPath, "General", "Title", "Default Value"&@CRLF&@ScriptDir)

    ; Display the value returned by IniRead. Since there is no key stored the value will be the 'Default Value' passed to IniRead.
;~     MsgBox(4096, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the INI file.
;~     FileDelete($iniPath)
EndFunc   ;==>Example
#ce

#cs
#include <Date.au3>
#include <MsgBoxConstants.au3>

; Add 5 days to today
Local $sNewDate = _DateAdd('d', _DateDaysInMonth(2016,1), "2016/1/29")
;~ Local $sNewDate = _DateAdd('d', 31, "2016/2/21")
;~ Local $sNewDate = _DateAdd('m', 1, "2016/1/31 12:17:26")
;~ Local $sNewDate = _DateAdd('d', 5, _NowCalcDate())
;~ MsgBox($MB_SYSTEMMODAL, "", "Today + 5 days:" & $sNewDate)

; Subtract 2 weeks from today
;~ $sNewDate = _DateAdd('w', -2, _NowCalcDate())
;~ MsgBox($MB_SYSTEMMODAL, "", "Today minus 2 weeks: " & $sNewDate)

; Add 15 minutes to current time
;~ $sNewDate = _DateAdd('n', 15, _NowCalc())
;~ MsgBox($MB_SYSTEMMODAL, "", "Current time +15 minutes: " & $sNewDate)

; Calculated eventlogdate which returns second since 1970/01/01 00:00:00
;~ $sNewDate = _DateAdd('s', 1087497645, "1970-01-01")
$sNewDate = StringReplace($sNewDate,"/","-")
;~ $sNewDate = _DateAdd('s', 1087497645, "1970/01/01 00:00:00")
MsgBox($MB_SYSTEMMODAL, "", "Date: " & $sNewDate)
#ce

#cs
#include <Array.au3>
Local $str=""
;~ Local $str="沈雁英"
;~ Local $str="沈雁英●汤永隆●陆一帆●"
Local $arr=StringSplit($str, "●")
_ArrayDisplay($arr) 
#ce

#cs
#include <Misc.au3>
#include <MsgBoxConstants.au3>

;~ Local $hDLL = DllOpen("user32.dll")

;~ While 1
;~ 	If _IsPressed("10", $hDLL) Then
;~ 		ConsoleWrite("_IsPressed - Shift Key was pressed." & @CRLF)
;~ 		; Wait until key is released.
;~ 		While _IsPressed("10", $hDLL)
;~ 			Sleep(250)
;~ 		WEnd
;~ 		ConsoleWrite("_IsPressed - Shift Key was released." & @CRLF)
;~ 	ElseIf _IsPressed("1B", $hDLL) Then
;~ 		MsgBox($MB_SYSTEMMODAL, "_IsPressed", "The Esc Key was pressed, therefore we will close the application.")
;~ 		ExitLoop
;~ 	Else
;~ 		ToolTip("text",Default,Default)
;~ 	EndIf
;~ 	Sleep(250)
;~ WEnd

;~ DllClose($hDLL)



;~ Local $hDLL = DllOpen("user32.dll")
;~ Local $startTime = TimerInit()
;~ While (TimerDiff($startTime) < 10*1000)
;~ 	If _IsPressed("1", $hDLL) Then
;~ 		ExitLoop
;~ 	; 右键检测不到
;~ 	ElseIf _IsPressed("2", $hDLL) Then
;~ 		ToolTip("Right pressed", Default, Default, "Demo")
;~ 		While _IsPressed("2", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	ElseIf _IsPressed("166", $hDLL) Then
;~ 		ToolTip("Browser Back pressed", Default, Default, "Demo")
;~ 		While _IsPressed("166", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	ElseIf _IsPressed("167", $hDLL) Then
;~ 		ToolTip("Browser Back pressed", Default, Default, "Demo")
;~ 		While _IsPressed("167", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	ElseIf _IsPressed("4", $hDLL) Then
;~ 		ToolTip("Middle pressed", Default, Default, "Demo")
;~ 		While _IsPressed("4", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	ElseIf _IsPressed("10", $hDLL) Then
;~ 		ToolTip("SHIFT pressed", Default, Default, "Demo")
;~ 		While _IsPressed("10", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	ElseIf _IsPressed("11", $hDLL) Then
;~ 		ToolTip("CONTROL pressed", Default, Default, "Demo")
;~ 		While _IsPressed("11", $hDLL)
;~ 			Sleep(128)
;~ 		WEnd
;~ 	Else		
;~ 		ToolTip("waiting……", Default, Default, "Demo")
;~ 	EndIf
;~ 	Sleep(128)
;~ WEnd
;~ ToolTip("")
;~ DllClose($hDLL)

$dll = DllOpen("user32.dll")
 
While 1
    Sleep(250)
    For $iX = 1 To 254
        If _IsPressed(Hex($iX), $dll) Then
            ConsoleWrite("0x" & Hex($iX, 2) & @LF)
        EndIf
    Next
WEnd
DllClose($dll)

#ce



;#cs
; 测试快捷键 嵌套调用 自定义方法
Local Const $INI_PATH = @ScriptDir&"\"&@ScriptName&".ini"
Local Const $INI_SECTION_GENERAL = "General"
Local Const $DFT_HK_Waiting="^1"
Local Const $DFT_HK_Demo="^2"
Local Const $DFT_HK_Quit="{Esc}"

Local $HK_Waiting = IniRead($INI_PATH, $INI_SECTION_GENERAL, "hotkeyWaiting", $DFT_HK_Waiting)
Local $HK_Demo = IniRead($INI_PATH, $INI_SECTION_GENERAL, "hotkeyDemo", $DFT_HK_Demo)
Local $HK_Quit = IniRead($INI_PATH, $INI_SECTION_GENERAL, "hotkeyQuit", $DFT_HK_Quit)

HotKeySet($HK_Waiting, Waiting)
HotKeySet($HK_Demo, Demo)
HotKeySet($HK_Quit, Quit)

Sleep(3000)

Func Waiting()
	ConsoleWrite("Func Waiting()………"&@CR)
	Local $start = TimerInit()
	While TimerDiff($start) < 16*1024
		Sleep(256)
	WEnd
EndFunc

Func Demo()
	ConsoleWrite("Func Demo()… …"&@CR)
	Local $start = TimerInit()
	While TimerDiff($start) < 3*1024
		ToolTip("demo")
	WEnd
	ToolTip("")
EndFunc

Func Quit()	
	ConsoleWrite("Func Quit()…"&@CR)
	Exit
EndFunc
;#ce










; Wait until something changes in the region 0,0 to 50,50
; Get initial checksum
;~ Sleep(4000)
;~ Local $iCheckSum = PixelChecksum(84, 458, 101, 473)
;~ ClipPut($iCheckSum)

;~ Local $iCheckSum = 2984052092
; Wait for the region to change, the region is checked every 100ms to reduce CPU load
;~ While $iCheckSum = PixelChecksum(0, 0, 50, 50)
;~     Sleep(100)
;~ WEnd

;~ MsgBox($MB_SYSTEMMODAL, "", "Something in the region has changed!")



;#cs
;#ce

;#cs
;#ce

;#cs
;#ce
