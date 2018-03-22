#Region converted Directives from D:\downloads\kits\articleSet.au3.ini
#EndRegion converted Directives from D:\downloads\kits\articleSet.au3.ini
;
#include <Date.au3>
#include <Misc.au3>
#include <Array.au3>
#include <GDIPlus.au3>
#include <AutoItConstants.au3>
#include <af_search_pic.au3>;包含阿福源代码文件到脚本中

#Region 
#AutoIt3Wrapper_Res_File_Add="d:\downloads\kits\articleSet.au3.ini"
#AutoIt3Wrapper_Res_File_Add="d:\Docs\type.png"
#AutoIt3Wrapper_Res_File_Add="d:\Docs\htMode.png"
#AutoIt3Wrapper_Res_File_Add="d:\Docs\html.png"
#AutoIt3Wrapper_Res_File_Add="d:\Docs\clear.png"
#EndRegion
;;--------------------------------------
;;声明全局变量。
;;--------------------------------------
Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(?|([ |　]*<br\b[^>]*/>)*|([ |　]*&nbsp;)*|[ |　]+\R|)*\s*?(</span>)?\s*?</p>\R?|<section\b[^>]*>\s*?(?|([ |　]*<br\b[^>]*/>)*|([ |　]*&nbsp;)*|[ |　]+\R|)*\s*</section>\R?|<h\d?\b[^>]*>\s*?(?|([ |　]*<br\b[^>]*/>)*|([ |　]*&nbsp;)*|[ |　]+\R|)*\s*</h\d?>\R?|^(\s+|)\R|^\s*\Z"
;Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(?|<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*?(</span>)?\s*?</p>\R?|<section\b[^>]*>\s*?(?|<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*</section>\R?|<h\d?\b[^>]*>\s*?(?|<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*</h\d?>\R?|^(\s+|)\R|^\s*\Z"
;Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(?|<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*?(</span>)?\s*?</p>\R?|<section\b[^>]*>\s*?(?|<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*</section>\R?|^(\s+|)\R|^\s*\Z"
;Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;|[　]+\R|)\s*?(</span>)?\s*?</p>\R?|(<section\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*(</section>)?\R?|^(\s+|)\R|^\s*\Z"
;Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;|[　]+\n)\s*?(</span>)?\s*?</p>\R?|(<section\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*(</section>)?\R?|^(\s+|)\R"
;Global Const $REGEX_BLANK="(?m)<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;|[　]+\n)\s*?(</span>)?\s*?</p>|(<section\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*(</section>)?|^(\s+|)\R"
;Global Const $REGEX_BLANK="<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;|[　]+\n)\s*?(</span>)?\s*?</p>|(<section\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*(</section>)?"
;Global Const $REGEX_BLANK="<p\b[^>]*>\s*?(<span\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*?(</span>)?\s*?</p>|(<section\b[^>]*>)?\s*?(<br\b[^>]*/>|&nbsp;)\s*(</section>)?"
Global Const $REGEX_BLANK_MULTY="(?|[ |　]*<br\b[^>]*/>|[ |　]*&nbsp;|[ |　]+\R){2,}"
;Global Const $REGEX_BLANK_MULTY="(<br\b[^>]*/>|(&nbsp;)|[　]+\R){2,}"
Global Const $REGEX_BLANK_HEADER="(?m)(<p\b[^>]*>\s*)(?|[ |　]*<br\b[^>]*/>|([ ]*&nbsp;)|[ |　]+\R)+"
;Global Const $REGEX_BLANK_HEADER="(?m)(<p\b[^>]*>\s*)<br\b[^>]*>"
Global Const $REGEX_BLANK_TAILER="(?m)(?|[ |　]*<br\b[^>]*/>|([ |　]*&nbsp;)|[ |　]+\R|)+(\s*</p>)"
;Global Const $REGEX_BLANK_TAILER="(?m)(?|([ |　]*<br\b[^>]*/>)*|([ |　]*&nbsp;)*|[ |　]+\R|)*(\s*</p>)"
;Global Const $REGEX_BLANK_TAILER="(?m)<br\b[^>]*>(\s*</p>)"
Global Const $replaceMult = "<br\>"
Global Const $SHOW_TIME_S=1
Global Const $WAIT_TIME_S=3
Global Const $WAIT_TIME_MS=$WAIT_TIME_S*1000
Global Const $TIME_UI_RESPONSE_MS=64
Global Const $TIME_CAPTURE_S=32
Global Const $TIME_CAPTURE_MS=$TIME_CAPTURE_S*1000
Global Const $INI_PATH=@ScriptDir&"\"&@ScriptName&".ini"
Global Const $ICON_TYPE_PICKER_PATH=@TempDir&"\type.png"
Global Const $ICON_HTML_MODE_PATH=@TempDir&"\htMode.png"
Global Const $ICON_HTML_PATH=@TempDir&"\html.png"
Global Const $ICON_CLEAR_PATH=@TempDir&"\clear.png"
Global Const $MSG_ICON_HTML="“HTML”模式图标 未找到"
Global Const $MSG_ICON_HTML_MODE="“HTML”选中模式图标 未找到"
Global Const $MSG_ICON_HTML_CLEAR="“清除”图标 未找到"
Global Const $MSG_ICON_TYPE="“文章分类”下拉箭头 未找到"
Global Const $TAG_ICON_HTML=0
Global Const $TAG_ICON_HTML_MODE=1
Global Const $TAG_ICON_HTML_CLEAR=2
Global Const $TAG_ICON_TYPE=3

Global Const $INI_SECTION_NAME="General"

;;--------------------------------------
;;自定义函数。
;;--------------------------------------
Func ShowTip($vTitle, $vText, $vTimeoutms)
	Local $startTime = TimerInit()
	While (Not _IsPressed("01") And TimerDiff($startTime) < $vTimeoutms)
		ToolTip($vText, Default, Default, $vTitle)
		Sleep(128)
	WEnd
	ToolTip("")
EndFunc

Func IconNotFound($vTag, $vMsg)
	Local $hint = $vMsg&@CRLF&"是否现在截取并保存图标？"
	Local $sel = MsgBox(1+32, "图标未找到", $hint)
	Sleep(256)
	If $sel = 1 Then
		IconCapture($vTag)
	EndIf
	Exit
EndFunc

;; 保存图标
Func IconCapture($vTag)
	Local $procWechat="WeChat.exe"
	If ProcessExists($procWechat)=0 Then
		Send("{LWIN}")
		Sleep(768)
;~ 		MsgBox(0,"","hehe",$SHOW_TIME_S)
;~ 		Exit
		Send("微信")
		Send("{Enter}")
	EndIf

	Local $startTime = TimerInit()
	If ProcessWait($procWechat, $WAIT_TIME_S)=0 Then
		MsgBox(16, "错误", "请先启动“微信”", $WAIT_TIME_S)
		Exit
	EndIf
	
	Send("!a")
	$startTime = TimerInit()
	If WinWait("另存为", "PNG (*.png)", $TIME_CAPTURE_S)=0 Then		
		MsgBox(16, "错误", "保存图标失败", $WAIT_TIME_S)
		Exit
	EndIf
	
	WinActivate("另存为", "PNG (*.png)")
	Switch $vTag
		Case $TAG_ICON_HTML
			ControlSetText("另存为", "PNG (*.png)", "Edit1", $ICON_HTML_PATH, 1)
		Case $TAG_ICON_HTML_MODE
			ControlSetText("另存为", "PNG (*.png)", "Edit1", $ICON_HTML_MODE_PATH, 1)
		Case $TAG_ICON_HTML_CLEAR
			ControlSetText("另存为", "PNG (*.png)", "Edit1", $ICON_CLEAR_PATH, 1)
		Case $TAG_ICON_TYPE
			ControlSetText("另存为", "PNG (*.png)", "Edit1", $ICON_TYPE_PICKER_PATH, 1)
	EndSwitch
;~ 	Send("{Enter}")
	Send("!s")
	Send("!y")
	
	MsgBox(0,"","图标保存成功！",$SHOW_TIME_S)
EndFunc

; 通过剪贴板设置文本
Func SetText($vTxt)		
	ClipPut($vTxt)
	Sleep(64)
	Send("^a")
	Send("{DEL}")
	Sleep(64)
	Send("^v")
	Sleep(16)
	ClipPut("")
EndFunc

; 设置文章属性
Func ArticleSet()
	Local Const $regex_long="(\d*)([dDwWmM])"
	Local Const $dftShift=1
	Local Const $dftStartTime="1:00"
	Local Const $dftEndTime="23:59"
	Local Const $dftLong="1m"
	Local Const $dftHits="20000~200000"
	
	Local $dayShift=IniRead($INI_PATH, $INI_SECTION_NAME, "dayShift", $dftShift)
	Local $startTime=IniRead($INI_PATH, $INI_SECTION_NAME, "startTime", $dftStartTime)
	Local $endTime=IniRead($INI_PATH, $INI_SECTION_NAME, "endTime", $dftEndTime)
	Local $howLong=IniRead($INI_PATH, $INI_SECTION_NAME, "howLong", $dftLong)
	Local $arrLong=StringRegExp($howLong, $regex_long, 1)
	Local $longNum=$arrLong[0]
	Local $longUnit=$arrLong[1]
	
	Local $startDay = _DateAdd('d', $dayShift, _NowCalcDate())
	Local $endDay = _DateAdd($longUnit, $longNum, $startDay)
;~ 	Local $endDay = _DateAdd('m', 1, $startDay)
	Local $dftDuration=StringReplace($startDay,"/","-")&" "&$startTime&" - " _
			&StringReplace($endDay,"/","-")&" "&$endTime
	
	Local $artType=IniRead($INI_PATH, $INI_SECTION_NAME, "type", 4)
	Local $duration=IniRead($INI_PATH, $INI_SECTION_NAME, "duration", $dftDuration)
	Local $gold=IniRead($INI_PATH, $INI_SECTION_NAME, "gold", 70)
	Local $isHot=IniRead($INI_PATH, $INI_SECTION_NAME, "isHot", 0)
	Local $isVisiable=IniRead($INI_PATH, $INI_SECTION_NAME, "isVisiable", 0)
	Local $isAdv=IniRead($INI_PATH, $INI_SECTION_NAME, "isAdv", 0)
	Local $iniHits=IniRead($INI_PATH, $INI_SECTION_NAME, "hits", $dftHits)
	Local $aHit=IniRead($INI_PATH, $INI_SECTION_NAME, "aHit", 1)
	Local $link=IniRead($INI_PATH, $INI_SECTION_NAME, "link", "")
	Local $summary=IniRead($INI_PATH, $INI_SECTION_NAME, "summary", "")
	Local $tags=IniRead($INI_PATH, $INI_SECTION_NAME, "tags", "")
	
	If StringLen($duration)=0 Then
		$duration = $dftDuration
	EndIf
	If StringLen($iniHits)=0 Then
		$iniHits = $dftHits
	EndIf
	Local $hitsBound = StringSplit($iniHits, "~")
	Local $hits = Random($hitsBound[1], $hitsBound[2], 1)
	
	; 读取配置完
;~ 	MsgBox(0, "Ini","type = "&$artType&@CRLF&"dayShift = "&$dayShift&@CRLF&"startTime = "&$startTime&@CRLF&"endTime = "&$endTime&@CRLF _
;~ 			&"howLong = "&$howLong&@CRLF&"duration = "&$duration&@CRLF&"gold = "&$gold&@CRLF&"isHot = "&$isHot&@CRLF _
;~ 			&"isVis = "&$isVisiable&@CRLF&"isAdv = "&$isAdv&@CRLF&"iniHits = "&$iniHits&":"&$hits&@CRLF _
;~ 			&"aHit = "&$aHit&@CRLF&"link = "&$link&@CRLF&"summary = "&$summary&@CRLF&"tags = "&StringLen($tags)&":"&$tags)

	Sleep(768)
	; 设置文章类型
	search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_TYPE_PICKER_PATH) 
	If $aPosMsg <>"" Then
		Local $array=StringSplit($aPosMsg,",",2)
		MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]/2, $array[1]+$array[3]/2)
		Send("{Home}")
		If $artType > 1 Then
			Send("{Down "& ($artType-1) &"}")
		EndIf
		Send("{Enter}")
	Else
		IconNotFound($TAG_ICON_TYPE, $MSG_ICON_TYPE)		
	EndIf
	
	; 设置有效期
;~ 	Sleep($TIME_UI_RESPONSE_MS)
	Send("{Tab}")
;~ 	Sleep($TIME_UI_RESPONSE_MS)
	SetText($duration)
	
	Sleep($TIME_UI_RESPONSE_MS)
	; 设置金币
	Send("{Tab 2}")
	SetText($gold)
	
	; 是否热文
	Send("{Tab}")
	If $isHot=1 Then
		Send("{Right}")
	EndIf
	
	; 是否显示
	Send("{Tab}")
	If $isVisiable=1 Then
		Send("{Space}")
	EndIf
	
	; 是否广告
	Send("{Tab}")
	If $isAdv=1 Then
		Send("{Space}")
	EndIf
	
	; 点击量
	Send("{Tab}")
	SetText($hits)
	
	; 点击增长率
	Send("{Tab}")
	SetText($aHit)
	
	; 原文链接
	Send("{Tab}")
	If StringLen($link)>0 Then
		SetText($link)
	EndIf
	
	; 摘要
	Send("{Tab}")
	If StringLen($summary)>0 Then
		SetText($summary)
	EndIf
	
	; tags
	Send("{Tab}")
	If StringLen($tags)>0 Then
		SetText($tags)
	EndIf	
	
	Sleep($TIME_UI_RESPONSE_MS)
;~ 	Local $sel =  MsgBox(32+1+256, "设置完毕", "文章属性设置完毕，是否继续？", $WAIT_TIME_S)
;~ 	If $sel = 2 Then
;~ 		Exit
;~ 	EndIf
EndFunc

If _Singleton(@ScriptName,1) = 0 Then
;~ 	MsgBox(0, "已运行", "正在运行……", $SHOW_TIME_S)
	Exit
EndIf

FileInstall("d:\downloads\kits\articleSet.au3.ini", $INI_PATH,0)
FileInstall("d:\Docs\type.png", $ICON_TYPE_PICKER_PATH)
FileInstall("d:\Docs\htMode.png",$ICON_HTML_MODE_PATH,0)
FileInstall("d:\Docs\html.png",$ICON_HTML_PATH,0)
FileInstall("d:\Docs\clear.png",$ICON_CLEAR_PATH,0)
;MsgBox(0, "准备开始", "请在 “文章内容”编辑框中 点一下……", $WAIT_TIME_S)
ShowTip("准备开始","请在 “文章”窗口中 点一下……",$WAIT_TIME_MS)
Sleep(256)

ArticleSet()

;#cs
;; 0.0 清除格式
;search_pic($x1,$y1,$x2,$y2,$pic)"当前屏幕找图",说明：$x1:屏幕上的左上角X坐标,$y1:屏幕上的左上角Y坐标,$x2:屏幕上的右下角X坐标,$y2:屏幕上的右下角Y坐标,$pic:要找图的路径及名称,$aPosMsg:返回坐标值(X坐标,Y坐标,长,高)
search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_HTML_MODE_PATH) 
If $aPosMsg <>"" Then
	Local $array=StringSplit($aPosMsg,",",2)
	MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]/2, $array[1]+$array[3]/2)
	Sleep(128)
	MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]*5, $array[1]+$array[3]*5)
EndIf

search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_HTML_PATH)
If $aPosMsg <>"" Then
	Local $array=StringSplit($aPosMsg,",",2)
	MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]*5, $array[1]+$array[3]*5)
	Send("^a")
	Sleep(128)
	search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_CLEAR_PATH)
	If $aPosMsg <>"" Then
		Local $array=StringSplit($aPosMsg,",",2)
		MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]/2, $array[1]+$array[3]/2)
;~ 		MsgBox(0,"","["&$aPosMsg&"]")
;~ 		Exit
		Sleep(128)
	Else
		IconNotFound($TAG_ICON_HTML_CLEAR, $MSG_ICON_HTML_CLEAR)
	EndIf
EndIf

;; 0.1检查是否为HTML模式
search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_HTML_MODE_PATH) 
If $aPosMsg="" Then	
	search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_HTML_PATH)
;~ 	MsgBox(0,"","["&$aPosMsg&"]")
	If $aPosMsg <>"" Then
		Local $array=StringSplit($aPosMsg,",",2)
		MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]/2, $array[1]+$array[3]/2)
		Sleep(128)
		MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]*5, $array[1]+$array[3]*5)
	Else
		IconNotFound($TAG_ICON_HTML, $MSG_ICON_HTML)
	EndIf
;~    MsgBox(0, "错误", "切换到HTML模式", $SHOW_TIME_S)
;~    Exit
EndIf

;; 1.复制并读取剪贴板
Send("^a")
Send("^c")
Sleep(768)
Dim $clpCnt = ClipGet()
If(StringLen($clpCnt)=0) Then
   MsgBox(0, "错误", "剪贴板内容为空", $SHOW_TIME_S)
   Exit
EndIf
ClipPut("")

;; 2.处理空行
Global $noBlank = $clpCnt
Global $totalTimes = 0

Func procBlank($vContext,$vRegex)
	Local $txt=$vContext
	While StringRegExp($txt, $vRegex) == 1
		$txt = StringRegExpReplace($txt, $vRegex, "")
		If @error==0 Then
		   Local $mTimes = @extended
		   If $mTimes == 0 Then ExitLoop
		   $totalTimes += $mTimes
		Else
		   ExitLoop
		EndIf
	WEnd
	Return $txt
EndFunc

; 删除常见空行
Func procBlankCommon()
	Return procBlank($noBlank, $REGEX_BLANK)
EndFunc

; 删除文中多个空行
Func procBlankMulty()
	Return procBlank($noBlank, $REGEX_BLANK_MULTY)
EndFunc

; 删除标签头部换行
Func procBlankTagHeader()
	$noBlank = StringRegExpReplace($noBlank, $REGEX_BLANK_HEADER, "$1")
	If @error==0 Then
	   Local $mTimes = @extended
	   $totalTimes += $mTimes
	EndIf
EndFunc

;删除标签尾部换行
Func procBlankTagTailer()
	$noBlank = StringRegExpReplace($noBlank, $REGEX_BLANK_TAILER, "$2")
	If @error==0 Then
	   Local $mTimes = @extended
	   $totalTimes += $mTimes
	EndIf
EndFunc

; 替换用户定义的字符串
Func procCustomStr()
	Local $txt = $noBlank
	Local $findStr = IniRead($INI_PATH, $INI_SECTION_NAME, "findStr", "")
	Local $replaceStr = IniRead($INI_PATH, $INI_SECTION_NAME, "replaceStr", "")
	
	If StringLen($findStr) > 0 Then
		Local $arrFind = StringSplit($findStr, "●")
		Local $arrReplace = StringSplit($replaceStr, "●")
		
		For $i = 1 To $arrFind[0]
			Local $itemFind=$arrFind[$i]
			Local $itemReplace=$arrReplace[UBound($arrReplace)-1]
			If $i < UBound($arrReplace) Then
				$itemReplace=$arrReplace[$i]
			EndIf
			
			$txt = StringReplace($txt, $itemFind, $itemReplace)
			If @error=0 Then
				$totalTimes += @extended
			EndIf
		Next
	EndIf
	
	Return $txt	
EndFunc

; 替换用户定义的正则
Func procCustomRegex()
	Local $txt = $noBlank
	Local $findStrReg = IniRead($INI_PATH, $INI_SECTION_NAME, "findStrReg", "")
	Local $replaceStrReg = IniRead($INI_PATH, $INI_SECTION_NAME, "replaceStrReg", "")
	
	If StringLen($findStrReg) > 0 Then
		Local $arrFind = StringSplit($findStrReg, "●")
		Local $arrReplace = StringSplit($replaceStrReg, "●")
		
		For $i = 1 To $arrFind[0]
			Local $itemFind=$arrFind[$i]
			Local $itemReplace=$arrReplace[UBound($arrReplace)-1]
			If $i < UBound($arrReplace) Then
				$itemReplace=$arrReplace[$i]
			EndIf
			
			$txt = StringRegExpReplace($txt, $itemFind, $itemReplace)
			If @error=0 Then
				$totalTimes += @extended
			EndIf
		Next
	EndIf
	
	Return $txt
EndFunc

; 自定义字符替换
$noBlank = procCustomStr()
$noBlank = procCustomRegex()

;常见空行
;~ $noBlank = procBlankCommon()

; 删除文中多个空行
$noBlank = procBlankMulty()

;删除标签头部换行
procBlankTagHeader()

;删除标签尾部换行
procBlankTagTailer()

;常见空行
$noBlank = procBlankCommon()

If($totalTimes == 0) Then
	;MsgBox(0, "无匹配", $noBlank, 15)
	MsgBox(0, "无匹配", "没有找到空格", $SHOW_TIME_S)
	Exit
EndIf
;MsgBox(0, "内容", $clpCnt)

;; 3.显示处理结果
ClipPut($noBlank)
Sleep(128)
;MsgBox(0, "提示", "② 准备清空内容……", $WAIT_TIME_S)
Send("^a")
Send("{DEL}")
Sleep(128)
;MsgBox(0, "提示", "③ 准备开始粘贴……", $WAIT_TIME_S)
Send("^v")
Sleep(512)
ClipPut("")

;; 4.处理完毕返回正常模式
search_pic(0,0, @DesktopWidth, @DesktopHeight,$ICON_HTML_MODE_PATH)
;~ MsgBox(0,"","["&$aPosMsg&"]")
If $aPosMsg <>"" Then
	Local $array=StringSplit($aPosMsg,",",2)
	MouseClick($MOUSE_CLICK_PRIMARY, $array[0]+$array[2]/2, $array[1]+$array[3]/2)
	Sleep(128)
	Send("^{HOME}")
	Send("{PGUP}")
Else
	IconNotFound($TAG_ICON_HTML_MODE, $MSG_ICON_HTML_MODE)
EndIf

Sleep(128)
;~ ShowTip("匹配","一共找到 "&$totalTimes&" 空行", $SHOW_TIME_S*1000)
;~ MsgBox(0, "结果", "格式化完毕！"&@CRLF&"一共找到 "&$totalTimes&" 空行", $SHOW_TIME_S)
MsgBox(0, "完成", "操作完毕！"&@CRLF&"请帮我检查下吧 (●'◡'●)", $SHOW_TIME_S)
;#ce