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
    IniWrite(@ScriptDir &"\"&@ScriptName&".ini", "General", "Title", "AutoIt")

    ; Read the INI file for the value of 'Title' in the section labelled 'General'.
    Local $sRead = IniRead(@ScriptDir &"\"&@ScriptName&".ini", "General", "Title", "Default Value"&@CRLF&@ScriptDir)

    ; Display the value returned by IniRead.
    MsgBox(4096, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the key labelled 'Title'.
    IniDelete(@ScriptDir &"\"&@ScriptName&".ini", "General", "Title")

    ; Read the INI file for the value of 'Title' in the section labelled 'General'.
    $sRead = IniRead(@ScriptDir &"\"&@ScriptName&".ini", "General", "Title", "Default Value"&@CRLF&@ScriptDir)

    ; Display the value returned by IniRead. Since there is no key stored the value will be the 'Default Value' passed to IniRead.
    MsgBox(4096, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the INI file.
    FileDelete(@ScriptDir &"\"&@ScriptName&".ini")
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
#include <Array.au3>
Local $str=""
;~ Local $str="沈雁英"
;~ Local $str="沈雁英●汤永隆●陆一帆●"
Local $arr=StringSplit($str, "●")
_ArrayDisplay($arr)


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


