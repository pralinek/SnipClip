Msgbox, Script created by Tomasz Jan Olech, Junior service agent at hemmersbach`nplease do not copy, share or modify without consent (test version)

#SingleInstance Force
#Maxmem



Mainshortarray := []
shortarray := []
Nrshortarray := []
listarray := []
Mainarray := []
Array := []
Nrarray := []
nrshortarray := []
arraytest := []
mailarray := []

CoordMode, tooltip, screen

counttotal = 0
countcontrol = 0
countchange = 0
countchange = 0
countdelete = 0
countminus = 0

script = %A_ScriptDir%\script.ahk
groupmail = %A_ScriptDir%\mail.ini
brelease = false
upbutton = %A_ScriptDir%\files\buttons\up.png
hidebutton = %A_ScriptDir%\files\buttons\down.png
playbutton = %A_ScriptDir%\files\buttons\play.png
pausebutton = %A_ScriptDir%\files\buttons\pause.png
cbutton2 = %A_ScriptDir%\files\buttons\cmd.png
cbutton1 = %A_ScriptDir%\files\buttons\cmd2.png

;b1 = %A_ScriptDir%\files\buttons\b1.png
;b2 = %A_ScriptDir%\files\buttons\b2.png
;b3 = %A_ScriptDir%\files\buttons\b3.png
;b4 = %A_ScriptDir%\files\buttons\b4.png
;b5 = %A_ScriptDir%\files\buttons\b5.png

hangbutton = %A_ScriptDir%\files\buttons\hangbutton.png
prebutton = %A_ScriptDir%\files\buttons\predefine.png
closebutton = %A_ScriptDir%\files\buttons\close.png
splitbutton = %A_ScriptDir%\files\buttons\split.png


Fullpre = %A_ScriptDir%\files\predefine.ini
Fullpre2 = %A_ScriptDir%\files\predefine2.ini
macropre = %A_ScriptDir%\files\template.ini
mailfile = %A_ScriptDir%\files\mail.txt
mailfile2 = %A_ScriptDir%\files\mail2.txt
fmailini = %A_ScriptDir%\files\fmail.ini

brelease = false
ks1 = false
ks3 = false
hide01 = false
cmdvar = false
onvar = true
onvar2 = true
onvar3 = true

wvar7 = 300	
hvar7 = 20
wvar1 = 300	
hvar1 = 100
xvar1 := A_ScreenWidth - wvar1 - 8
yvar1:= A_Screenheight - hvar1 - 125
xvar2 := A_ScreenWidth - 430
yvar2:= A_Screenheight - 92
xvar4 := A_ScreenWidth - 900
yvar4:= A_Screenheight - 600
xvar5 := A_ScreenWidth - 750
yvar5:= A_Screenheight - 750
xvar6 := A_ScreenWidth - 100
yvar6:= A_Screenheight - 130
xvar7 := A_ScreenWidth - wvar1 - 8
yvar7:= A_Screenheight - hvar1 - 180

;--------------------------------------------------------------------gui;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

gosub, maingui
IniRead, list, %fullpre%
Stringreplace, list2, list, `n, |, all    
Loop, parse, list2, |
{
arraytest.push(A_loopfield)
}

IniRead, lmacro, %macropre%
Stringreplace, lmacro2, lmacro, `n, |, all
Loop, parse, lmacro2, |
{
arraymacro.push(A_loopfield)
}

IniRead, listmail, %fmailsini%
Stringreplace, listmail, listmail, `n, |, all
Loop, parse, listmail, |
{
arraymails.push(A_loopfield)
}



;CoordMode, ToolTip, Screen
;loop 
;{
;sleep, 10
;mousegetpos, x, y
;tooltip, %vartooltip%, (x + 20), (y + 20), 1
;sleep, 10
;}

return





maingui:




Gui 1: Color, c000515
Gui 1: Show, x%xvar1%  y%yvar1% w%wvar1% h%hvar1%

Gui 1: font, cwhite s12, Segoe UI bold

Gui 1: Add, picture, x270 y95 w30 h30 gpre, %prebutton%
Gui 1: Add, picture, x270 y0 w30 h30 ghide, %hidebutton%
Gui 1: Add, picture, x235 y30 w30 h30 gcmdbutton vcmdbutton, %cbutton1%
Gui 1: Add, picture, x235 y0 w30 h30 gmoveon, %hangbutton%
Gui 1: Add, picture, x270 y30 w30 h30 gsplit, %splitbutton%
Gui 1: Add, picture, x270 y60 w30 h30 gpause, %pausebutton%



Gui 1: Add, text, x10 y10 vText1 w200, 
Gui 1: Add, text, x10 y40 vText2 w200, 


gui 1: font, bold s13
Gui 1: Add, text, x10 y70 vVALUE cwhite vTextMain gTextmain w200,
gui 1: font, normal s12
Gui 1: Add, text, x10 y100 vText4 w200, 

Gui 1:  +lastfound +AlwaysOnTop +ToolWindow -Caption 
WinSet, TransColor, color 220


Gui 8: Color, cE8422A
Gui 8: Show, x%xvar7%  y%yvar7% w%wvar7% h%hvar7%
Gui 8:  +lastfound +AlwaysOnTop +ToolWindow -Caption 
Gui 8: Add, text, x10 y10 vinstext w200, 
Gui 8: hide
WinSet, TransColor, color 220
;---------------------------------------------------------------------------------------------------------------------------


Gui 2: -caption +toolwindow
Gui 2: Add, picture, x365 y0 w30 h30 gMainon, %upbutton%
Gui 2: Add, picture, x330 y0 w30 h30 gmoveon, %hangbutton%
Gui 2: Add, picture, x295 y0 w30 h30 gpause, %pausebutton%
Gui 2: Color, c000515
Gui 2: Show, x%xvar2%  y%yvar2% w400 h30
Gui 2: font,cwhite s12, Segoe UI

Gui 2: Add, text, x10 y3 vValue cwhite vTextmain gTextmain w270, 
Gui 2: +lastfound +AlwaysOnTop +toolwindow -caption
WinSet, TransColor, color 245
Gui 2: hide


Gui 7: Color, FFFFFF
Gui 7: Show, x%xvar6%  y%yvar6% w45 h20
Gui 7: font, cwhite s12, Segoe UI
Gui 7: Add, picture, x0 y0 w45 h45 gplay, %playbutton%
Gui 7:  +lastfound +AlwaysOnTop +ToolWindow -Caption 
gui 7: hide
;-------------------------------------------------------------------------------------------------------------------------
return



pregui:
return
;------------------------------------------predefajn function  -----------------------------------------------------



MyListBox1:
if A_GuiEvent <> click
GuiControlGet, MyListBox1 
IniRead, preview, %Fullpre%,%mylistbox1%,
stringreplace, preview, preview, $enter$,`n,All
GuiControl,4:, Viewp, %preview%
return

create:
arraytest := {}
Guicontrolget, View
stringreplace, view, view,`n, $enter$, All
GuiControlGet,predefajn
stringreplace,predefajn,predefajn,A_space,,All
Iniread, kontrol, %fullpre%, %predefajn%
if view !=
if predefajn !=
if kontrol =
{
Iniwrite, %view%, %Fullpre%, %predefajn%



IniRead, list, %fullpre%
Stringreplace, list, list, `n, |, all
GuiControl, , Mylistbox1, |
GuiControl, , Mylistbox1, %list%

Loop, parse, list, |
{
arraytest.push(A_loopfield)
Gui +LastFound
GuiControl, Choose, ListBox1, %A_index%
IniRead, preview, %Fullpre%,%A_loopfield%,
stringreplace, preview, preview, $enter$,`n,All
GuiControl,4:, Viewp, %preview%
}

}
else
{
msgbox, This predefine already exists
}
return

ok:
IniRead, list, %fullpre%
Stringreplace, list, list, `n, |, all
loop, parse, list, |
{
Guicontrolget, search1
if A_loopfield = %search1%
{
Gui +LastFound
GuiControl, Choose, ListBox1, %A_index%
IniRead, preview, %Fullpre%,%A_loopfield%,
stringreplace, preview, preview, $enter$,`n,All
GuiControl,4:, Viewp, %preview%

}
}

~+*::
clipstore = %clipboardall%

input, pred, V T5 L20, {space},
loop
{
test := arraytest[A_index]
if test := pred
{

testLength := StrLen(pred) + 2
Iniread, pred0, %fullpre%, %pred%
if pred0 !=
{
sendinput,{backspace %testlength%}
stringreplace, pred0, pred0, $enter$, `n,All
ifWinActive, ahk_class RemoteToolsFrame
{
sendinput, %pred0%
return
}
IfWinactive, ahk_class ConsoleWindowClass
{
Sendinput, %pred0%
return 
}
else
{
clipboard = %pred0%
Clipwait, 2,2
sleep, 80
send ^v
Clipwait, 3,3
sleep, 500
clipboard = %clipstore%
clipstore =
return
}



}
return

}
else
break
}
return





modifybutton:
GuiControlGet, ListBox1
Guicontrolget, viewp
StringReplace, viewp, viewp,`n,$enter$,All  

IniDelete, %Fullpre%, %listbox1%, 

Iniwrite, %viewp%, %Fullpre%, %listbox1%
StringReplace, viewp, viewp,$enter$, `n,All
msgbox, predefined modified to: `n`n%viewp%
return

deletebutton:
GuiControlGet, ListBox1
IniDelete, %Fullpre%, %listbox1%, 
IniRead, list, %fullpre%
Stringreplace, list, list, `n, |, all
GuiControl, , Mylistbox1, |
GuiControl,, mylistbox1, %list%
guicontrol,, viewp,

return

;------------------------------------------------------------------MACROS----------------------------------------------------------------------


mcreate:
arraymacro := {}
Guicontrolget, view2
GuiControlGet,makros
Iniread, mkontrol, %macropre%, %makros%
if view2 !=
if makros !=
if mkontrol =
{
stringreplace,view2, view2, !, {!}
stringreplace,view2, view2, `n, $enter$, All
Iniwrite, %view2%, %macropre%, %makros%,

IniRead, lmacro, %macropre%
Stringreplace, lmacro2, lmacro, `n, |, all
GuiControl, , mylistboxmacro, |
GuiControl, , mylistboxmacro, %lmacro2%

Loop, parse, lmacro2, |
{
arraymacro.push(A_loopfield)
Gui +LastFound
GuiControl, Choose, mylistboxmacro, %A_index%
IniRead, preview2, %macropre%,%A_loopfield%,
stringreplace, preview2, preview2, $enter$,`n,All
GuiControl,4:, viewp2, %preview2%
}

}
else
{
msgbox, This macro shortcut already exists
}
return


		
~+>::
Nrvarmacro := nrshortarray[countchange]
nrvarmacro1 := nrvarmacro - 1
nrvarmacro2 := nrvarmacro - 2
nrvarmacro3 := nrvarmacro - 3
nrvarmacro4 := nrvarmacro - 4
nrvarmacro5 := nrvarmacro - 5
nrvarmacro6 := nrvarmacro - 6
nrvarmacro7 := nrvarmacro - 7
nrvarmacro8 := nrvarmacro - 8
nrvarmacro9 := nrvarmacro - 9

clip1 := mainarray[countchange - nrvarmacro1]
clip2 := mainarray[countchange - nrvarmacro2]
clip3 := mainarray[countchange - nrvarmacro3]
clip4 := mainarray[countchange - nrvarmacro4]
clip5 := mainarray[countchange - nrvarmacro5]
clip6 := mainarray[countchange - nrvarmacro6]
clip7 := mainarray[countchange - nrvarmacro7]
clip8 := mainarray[countchange - nrvarmacro8]
clip9 := mainarray[countchange - nrvarmacro9]
arraylines := []
fullmacro :=
loop
{
input, mark, I V T10 L20, {space}
test := arraymacro[A_index],
if test := mark
{
testLength := StrLen(mark) + 2
Iniread, markmacro, %macropre%, %mark%,
if markmacro !=
{
stringreplace, markmacro, markmacro, clip1, %clip1%, All
stringreplace, markmacro, markmacro, clip2, %clip2%, All
stringreplace, markmacro, markmacro, clip3, %clip3%, All
stringreplace, markmacro, markmacro, clip4, %clip4%, All
stringreplace, markmacro, markmacro, clip5, %clip5%, All
stringreplace, markmacro, markmacro, clip6, %clip6%, All
stringreplace, markmacro, markmacro, clip7, %clip7%, All
stringreplace, markmacro, markmacro, clip8, %clip8%, All
stringreplace, markmacro, markmacro, clip9, %clip9%, All
StringReplace, markmacro, markmacro,$enter$tab$enter$,`t,All
StringReplace, markmacro, markmacro,$enter$tab,`t,All
StringReplace, markmacro, markmacro,tab$enter$,`t,All
StringReplace, markmacro, markmacro,$enter$,`n,All
Stringreplace, markmacro, markmacro, tab,`t,All

Loop, parse, markmacro, `t
{
arraylines.push(A_loopfield)
varmacro := A_index
}
firstline := arraylines[1]
sendinput,{backspace %testlength%}
sendinput, %firstline%

loopvar := varmacro - 1

Loop, %loopvar%
{
loopvar2 := A_index + 1
varline := arraylines[loopvar2]
sleep, 40
sendinput, {tab}%varline%
}




}
return
}
else
{
break
}
}

return

deletebutton2:
GuiControlGet, ListBox2
IniDelete, %macropre%, %listbox2%, 
IniRead, lmacro2, %macropre%
Stringreplace, lmacro2, lmacro2, `n, |, all
GuiControl,4:, Mylistboxmacro, |
GuiControl,4:, mylistboxmacro, %lmacro2%
guicontrol,4:, viewp2,
return



modifybutton2:
GuiControlGet, ListBox2
Guicontrolget, viewp2

IniDelete, %macropre%, %listbox2%, 
stringreplace,viewp2, viewp2, !,{!}
stringreplace,viewp2, viewp2, `n,$enter$,All
Iniwrite, %viewp2%, %macropre%, %listbox2%

msgbox, environemntal predefine modified to: `n`n%viewp2%
return

mylistboxmacro:
if A_GuiEvent <> click
GuiControlGet, mylistboxmacro 
IniRead, preview2, %macropre%,%mylistboxmacro%,
stringreplace, preview2, preview2, $enter$,`n,All
GuiControl,4:, viewp2, %preview2%
return
return

ok2:
IniRead, lmacro2, %macropre%
Stringreplace, lmacro2, lmacro2, `n, |, all
loop, parse, lmacro2, |
{
Guicontrolget, search2
if A_loopfield = %search2%
{
Gui +LastFound
GuiControl, Choose, mylistboxmacro, %A_index%
IniRead, preview2, %macropre%,%A_loopfield%,
stringreplace, preview2, preview2, $enter$,`n,All
GuiControl,4:, viewp2, %preview2%

}
}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAils;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~+@::
Nrvarmacro := nrshortarray[countchange]
nrvarmacro1 := nrvarmacro - 1
nrvarmacro2 := nrvarmacro - 2
nrvarmacro3 := nrvarmacro - 3
nrvarmacro4 := nrvarmacro - 4
nrvarmacro5 := nrvarmacro - 5
nrvarmacro6 := nrvarmacro - 6
nrvarmacro7 := nrvarmacro - 7
nrvarmacro8 := nrvarmacro - 8
nrvarmacro9 := nrvarmacro - 9

clip1 := mainarray[countchange - nrvarmacro1]
clip2 := mainarray[countchange - nrvarmacro2]
clip3 := mainarray[countchange - nrvarmacro3]
clip4 := mainarray[countchange - nrvarmacro4]
clip5 := mainarray[countchange - nrvarmacro5]
clip6 := mainarray[countchange - nrvarmacro6]
clip7 := mainarray[countchange - nrvarmacro7]
clip8 := mainarray[countchange - nrvarmacro8]
clip9 := mainarray[countchange - nrvarmacro9]

input, xmailx, V T5 L20, {space},
loop
{
test := arraymails[A_index]
if test := xmailx
{
testLength := StrLen(pred) + 2
Iniread, controlmail, %fmailini%, %xmailx%
if controlmail !=
{
sendinput,{backspace %testlength%}
IniRead, mailto, %fmailini%,%xmailx%, to
iniread, mailcc, %fmailini%, %xmailx%, cc
iniread, mailbcc, %fmailini%, %xmailx%, bcc
iniread, mailsubject, %fmailini%, %xmailx%, subject
iniread, mailbody, %fmailini%, %xmailx%, mailbody
stringreplace, mailbody, mailbody, $enter$,`n,All
stringreplace, mailbody, mailbody, clip1, %clip1%, All
stringreplace, mailbody, mailbody, clip2, %clip2%, All
stringreplace, mailbody, mailbody, clip3, %clip3%, All
stringreplace, mailbody, mailbody, clip4, %clip4%, All
stringreplace, mailbody, mailbody, clip5, %clip5%, All
stringreplace, mailbody, mailbody, clip6, %clip6%, All
stringreplace, mailbody, mailbody, clip7, %clip7%, All
stringreplace, mailbody, mailbody, clip8, %clip8%, All
stringreplace, mailbody, mailbody, clip9, %clip9%, All


stringreplace, mailto, mailto, clip1, %clip1%, All
stringreplace, mailto, mailto, clip2, %clip2%, All
stringreplace, mailto, mailto, clip3, %clip3%, All
stringreplace, mailto, mailto, clip4, %clip4%, All
stringreplace, mailto, mailto, clip5, %clip5%, All
stringreplace, mailto, mailto, clip6, %clip6%, All
stringreplace, mailto, mailto, clip7, %clip7%, All
stringreplace, mailto, mailto, clip8, %clip8%, All
stringreplace, mailto, mailto, clip9, %clip9%, All


stringreplace, mailcc, mailcc, clip1, %clip1%, All
stringreplace, mailcc, mailcc, clip2, %clip2%, All
stringreplace, mailcc, mailcc, clip3, %clip3%, All
stringreplace, mailcc, mailcc, clip4, %clip4%, All
stringreplace, mailcc, mailcc, clip5, %clip5%, All
stringreplace, mailcc, mailcc, clip6, %clip6%, All
stringreplace, mailcc, mailcc, clip7, %clip7%, All
stringreplace, mailcc, mailcc, clip8, %clip8%, All
stringreplace, mailcc, mailcc, clip9, %clip9%, All


stringreplace, mailbcc, mailbcc, clip1, %clip1%, All
stringreplace, mailbcc, mailbcc, clip2, %clip2%, All
stringreplace, mailbcc, mailbcc, clip3, %clip3%, All
stringreplace, mailbcc, mailbcc, clip4, %clip4%, All
stringreplace, mailbcc, mailbcc, clip5, %clip5%, All
stringreplace, mailbcc, mailbcc, clip6, %clip6%, All
stringreplace, mailbcc, mailbcc, clip7, %clip7%, All
stringreplace, mailbcc, mailbcc, clip8, %clip8%, All
stringreplace, mailbcc, mailbcc, clip9, %clip9%, All


stringreplace, mailsubject, mailsubject, clip1, %clip1%, All
stringreplace, mailsubject, mailsubject, clip2, %clip2%, All
stringreplace, mailsubject, mailsubject, clip3, %clip3%, All
stringreplace, mailsubject, mailsubject, clip4, %clip4%, All
stringreplace, mailsubject, mailsubject, clip5, %clip5%, All
stringreplace, mailsubject, mailsubject, clip6, %clip6%, All
stringreplace, mailsubject, mailsubject, clip7, %clip7%, All
stringreplace, mailsubject, mailsubject, clip8, %clip8%, All
stringreplace, mailsubject, mailsubject, clip9, %clip9%, All


try
{
tomApp := ComObjActive("Outlook.Application")
tomMailItem := tomApp.CreateItem(0) ;  tomMailItem := 0
tomMailItem.display
tomMailItem.TO := mailto
tomMailItem.CC :=  mailcc
tomMailItem.bcc := mailbcc
tomMailItem.Subject := mailsubject
tomMailItem.body := mailbody

}
	catch e
	{
	msgbox, please open outlook `nor close any outlook'error messages to use this function

	}

}

return
}
else
break
}
return



mailcreate:
guicontrolget, mailto
guicontrolget, mailcc
guicontrolget, mailbcc
guicontrolget, mailsubject
guicontrolget, mailbody
guicontrolget, mcreation
Iniread, mailcontrol, %fmailini%, %mcreation%
if mkontrol =
if mcreation !=
{
stringreplace,mailbody, mailbody, !, {!}
stringreplace,mailbody, mailbody, `n, $enter$, All


Iniwrite, %mailto%, %fmailini%, %mcreation%, to
Iniwrite, %mailcc%, %fmailini%, %mcreation%, cc
Iniwrite, %mailbcc%, %fmailini%, %mcreation%, bcc
Iniwrite, %mailsubject%, %fmailini%, %mcreation%, subject
Iniwrite, %mailbody%, %fmailini%, %mcreation%, mailbody 

Iniread, listmail, %fmailini%
Stringreplace, listmail, listmail, `n, |, all
GuiControl, , mylistboxmail, |
GuiControl, , mylistboxmail, %listmail%

Loop, parse, listmail, |
{
arraymails.push(A_loopfield)
Gui +LastFound
GuiControl, Choose, mylistboxmail, %A_index%
IniRead, mailto2, %fmailini%,%A_loopfield%, to
iniread, mailcc2, %fmailini%, %A_loopfield%, cc
iniread, mailbcc2, %fmailini%, %A_loopfield%, bcc
iniread, mailsubject, %fmailini%, %A_loopfield%, subject
iniread, mailbody2, %fmailini%, %A_loopfield%, mailbody, 

stringreplace, mailbody2, mailbody2, $enter$,`n,All
GuiControl,4:, mailto, %mailto2%
GuiControl,4:, mailcc, %mailcc2%
GuiControl,4:, mailbcc, %mailbcc2%
GuiControl,4:, mailsubect, %mailsubject2%
GuiControl,4:, mailbody, %mailbody2%
}

}
else
{
msgbox, this mail shortcut already exists
}
return

return
mailmodify:
GuiControlGet, MyListBoxmail 
guicontrolget, mailto
guicontrolget, mailcc
guicontrolget, mailbcc
guicontrolget, mailsubject
guicontrolget, mailbody
guicontrolget, mcreation
StringReplace, mailbody, mailbody,`n,$enter$,All  

IniDelete, %fmailini%, %mylistboxmail%, 

Iniwrite, %mailto%, %fmailini%, %mcreation%, to
Iniwrite, %mailcc%, %fmailini%, %mcreation%, cc
Iniwrite, %mailbcc%, %fmailini%, %mcreation%, bcc
Iniwrite, %mailsubject%, %fmailini%, %mcreation%, subject
Iniwrite, %mailbody%, %fmailini%, %mcreation%, mailbody 

msgbox, your mail template was successfully modified
return

maildelete:
GuiControlGet, MyListBoxmail 
IniDelete, %fmailini%, %mylistboxmail%, 
IniRead, list, %fmailini%
Stringreplace, list, list, `n, |, all
GuiControl,, Mylistboxmail, |
GuiControl,, mylistboxmail, %list%
guicontrol,, mailto,
guicontrol,, mailcc,
guicontrol,, mailbcc,
guicontrol,, mailsubject,
guicontrol,, mailbody,
guicontrol,, mcreation,
msgbox, Mail template deletion success
return

mylistboxmail:
if A_GuiEvent <> click
GuiControlGet, MyListBoxmail 
iniread, mailto, %fmailini%, %mylistboxmail%, to
iniread, mailcc, %fmailini%, %mylistboxmail%, cc
iniread, mailbcc, %fmailini%, %mylistboxmail%, bcc
iniread, mailsubject, %fmailini%, %mylistboxmail%, subject
iniread, mailbody, %fmailini%, %mylistboxmail%, mailbody 
stringreplace, mailbody, mailbody, $enter$,`n,All
GuiControl,4:, mailto, %mailto%
GuiControl,4:, mailcc, %mailcc%
GuiControl,4:, mailbcc, %mailbcc%
GuiControl,4:, mailsubject, %mailsubject%
GuiControl,4:, mailbody, %mailbody%
Guicontrol,4:, mcreation, %mylistboxmail%
return
okmail:
return


fmail:


return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;gUi;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macrogui:
;predefine needed


;general
Gui 4: color, c000515
Gui 4: Add, button, x600 y25 w75 h50 gxpredefines, Predefines
Gui 4: Add, button, x600 y75 w75 h50 gxtemplates, Templates
Gui 4: Add, button, x600 y125 w75 h50 gxmails, Mails 
Gui 4: Add, button, x600 y175 w75 h50 gsettings, Settings
Gui 4: Add, button, x600 y225 w75 h50 gblue, Help
Gui 4: Add, button, x600 y275 w75 h50 gblue, General

Gui 4: Show, x%xvar4%  y%yvar4% w700 h350


;predefines
Gui 4: Add, edit, x140 y60 vviewp w200 h200
Gui 4: Add, edit, x360 y60 vView w200 h200
Gui 4: Add, edit, x380 y270 vPredefajn w100
Gui 4: Add, button, x500 y270 vcreate gcreate, CREATE
Gui 4: Add, button, x200 y270 vdeletebutton gdeletebutton, DELETE
Gui 4: Add, button, x280 y270 vmodifybutton gmodifybutton, MODIFY
Gui 4: Add, ListBox, vMyListBox1 gMyListBox1 x20 y60 w100 r17
Gui 4: Add, Edit, x20 y300 w100 vSearch1,
Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vok gOK, Search

fullview := mainarray[countchange]
Iniread, fullvar, %fulltext%, %countchange%
IniRead, list, %fullpre%
Stringreplace, list, list, `n, |, all
Stringreplace, searchlist, list, |, ``,, all
GuiControl, , Mylistbox1,
GuiControl, 4:, Mylistbox1, %list%
Guicontrol, 4:, view, %fullview%

;templates
Gui 4: Add, edit, x140 y60 vviewp2 w200 h200
Gui 4: Add, edit, x360 y60 vView2 w200 h100
Gui 4: Add, edit, x380 y270 vmakros w100
Gui 4: Add, button, x500 y270 vmcreate gmcreate, CREATE
Gui 4: Add, button, x200 y270 vdeletebutton2 gdeletebutton2, DELETE
Gui 4: Add, button, x280 y270 vmodifybutton2 gmodifybutton2, MODIFY
Gui 4: Add, ListBox, vmylistboxmacro gmylistboxmacro x20 y60 w100 r17
Gui 4: Add, Edit, x20 y300 w100 vSearch2,
Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vok2 gOK2, Search


IniRead, lmacro, %macropre%
Stringreplace, lmacro2, lmacro, `n, |, all
GuiControl, 4:, mylistboxmacro, |
GuiControl, 4:, mylistboxmacro, %lmacro2%

;mails
gui 4: Add, text, x290 y20 vtexto, To
gui 4: Add, text, x290 y45 vtextcc, CC
gui 4: Add, text, x290 y70 vtextbcc, BCC
gui 4: Add, text, x290 y95 vtextsubject, Subject
Gui 4: Add, Edit, x330 y20 vmailto w200  h20
Gui 4: Add, Edit, x330 y45 vmailcc w200  h20
Gui 4: Add, Edit, x330 y70 vmailbcc w200  h20
Gui 4: Add, Edit, x330 y95 vmailsubject w200  h20
Gui 4: Add, edit, x230 y120 vmailbody w300 h160
Gui 4: Add, edit, x230 y300 vmcreation w150 h20
Gui 4: Add, button, x410 y300 vmailcreate gmailcreate, CREATE
Gui 4: Add, button, x140 y250 vmaildelete gmaildelete, DELETE
Gui 4: Add, button, x470 y300 vmailmodify gmailmodify, MODIFY
Gui 4: Add, ListBox, vmylistboxmail gmylistboxmail x20 y20 w100 r20
Gui 4: Add, Edit, x20 y300 w100 vSearchMail,
Gui 4: Add, Button, x130 y300 w120 h20 w50 Default vokmail gOKmail, Search

IniRead, listmail2, %fmailini%
Stringreplace, listmail2, listmail2, `n, |, all
GuiControl, 4:, mylistboxmail, |
GuiControl, 4:, mylistboxmail, %listmail2%
	

    GuiControl 4: hide, texto
	GuiControl 4: hide, textcc
	GuiControl 4: hide, textbcc
	GuiControl 4: hide, textsubject
	GuiControl 4: hide, mailto
	GuiControl 4: hide, mailcc
	GuiControl 4: hide, mailbcc
	GuiControl 4: hide, mailsubject
	GuiControl 4: hide, mcreation
	GuiControl 4: hide, mailbody
	GuiControl 4: hide, mailcreate
	GuiControl 4: hide, maildelete
	GuiControl 4: hide, mailmodify
	GuiControl 4: hide, mylistboxmail
	GuiControl 4: hide, searchmail
	GuiControl 4: hide, okmail


	GuiControl 4: hide, viewp2
	GuiControl 4: hide, view2
	GuiControl 4: hide, makros
	GuiControl 4: hide, mcreate
	GuiControl 4: hide, deletebutton2
	GuiControl 4: hide, modifybutton2
	GuiControl 4: hide, mylistboxmacro
	GuiControl 4: hide, search2
	GuiControl 4: hide, ok2
return

xpredefines:
	

    Gui 4: color, c000515
	GuiControl 4: show, viewp
	GuiControl 4: show, view
	GuiControl 4: show, predefajn
	GuiControl 4: show, create
	GuiControl 4: show, deletebutton
	GuiControl 4: show, modifybutton
	GuiControl 4: show, mylistbox1
	GuiControl 4: show, search1
	GuiControl 4: show, ok
	
	
	GuiControl 4: hide, viewp2
	GuiControl 4: hide, view2
	GuiControl 4: hide, makros
	GuiControl 4: hide, mcreate
	GuiControl 4: hide, deletebutton2
	GuiControl 4: hide, modifybutton2
	GuiControl 4: hide, mylistboxmacro
	GuiControl 4: hide, search2
	GuiControl 4: hide, ok2
	
	GuiControl 4: hide, texto
	GuiControl 4: hide, textcc
	GuiControl 4: hide, textbcc
	GuiControl 4: hide, textsubject
	GuiControl 4: hide, mailto
	GuiControl 4: hide, mailcc
	GuiControl 4: hide, mailbcc
	GuiControl 4: hide, mailsubject
	GuiControl 4: hide, mcreation
	GuiControl 4: hide, mailbody
	GuiControl 4: hide, mailcreate
	GuiControl 4: hide, maildelete
	GuiControl 4: hide, mailmodify
	GuiControl 4: hide, mylistboxmail
	GuiControl 4: hide, searchmail
	GuiControl 4: hide, okmail
return

xtemplates:
	Gui 4: color, cE82C0C
	GuiControl 4: Hide, viewp
	GuiControl 4: Hide, view
	GuiControl 4: Hide, predefajn
	GuiControl 4: Hide, create
	GuiControl 4: Hide, deletebutton
	GuiControl 4: Hide, modifybutton
	GuiControl 4: Hide, mylistbox1
	GuiControl 4: Hide, search1
	GuiControl 4: Hide, ok
	
	GuiControl 4: show, viewp2
	GuiControl 4: show, view2
	GuiControl 4: show, makros
	GuiControl 4: show, mcreate
	GuiControl 4: show, deletebutton2
	GuiControl 4: show, modifybutton2
	GuiControl 4: show, mylistboxmacro
	GuiControl 4: show, search2
	GuiControl 4: show, ok2
	
	GuiControl 4: hide, texto
	GuiControl 4: hide, textcc
	GuiControl 4: hide, textbcc
	GuiControl 4: hide, textsubject
	GuiControl 4: hide, mailto
	GuiControl 4: hide, mailcc
	GuiControl 4: hide, mailbcc
	GuiControl 4: hide, mailsubject
	GuiControl 4: hide, mcreation
	GuiControl 4: hide, mailbody
	GuiControl 4: hide, mailcreate
	GuiControl 4: hide, maildelete
	GuiControl 4: hide, mailmodify
	GuiControl 4: hide, mylistboxmail
	GuiControl 4: hide, searchmail
	GuiControl 4: hide, okmail
	return
xmails:	
	Gui 4: color, c0173c7
	GuiControl 4: Hide, viewp
	GuiControl 4: Hide, view
	GuiControl 4: Hide, predefajn
	GuiControl 4: Hide, create
	GuiControl 4: Hide, deletebutton
	GuiControl 4: Hide, modifybutton
	GuiControl 4: Hide, mylistbox1
	GuiControl 4: Hide, search1
	GuiControl 4: Hide, ok
	
	GuiControl 4: hide, viewp2
	GuiControl 4: hide, view2
	GuiControl 4: hide, makros
	GuiControl 4: hide, mcreate
	GuiControl 4: hide, deletebutton2
	GuiControl 4: hide, modifybutton2
	GuiControl 4: hide, mylistboxmacro
	GuiControl 4: hide, search2
	GuiControl 4: hide, ok2
	
	GuiControl 4: show, texto
	GuiControl 4: show, textcc
	GuiControl 4: show, textbcc
	GuiControl 4: show, textsubject
	GuiControl 4: show, mailto
	GuiControl 4: show, mailcc
	GuiControl 4: show, mailbcc
	GuiControl 4: show, mailsubject
	GuiControl 4: show, mcreation
	GuiControl 4: show, mailbody
	GuiControl 4: show, mailcreate
	GuiControl 4: show, maildelete
	GuiControl 4: show, mailmodify
	GuiControl 4: show, mylistboxmail
	GuiControl 4: show, searchmail
	GuiControl 4: show, okmail

	
settings:
blue:
return

GuiClose:
ExitApp


return
;--------------------------------------------------------------Controls-------------------------------------------------------------
removetooltip:
tooltip
return

Textmain:
if onvar2 = true
{
Gosub, pregui
onvar2 = false
}
else
{
Gui 3: destroy
onvar2 = true
}
return
;000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
pre:
if onvar3 = true
{
Gosub, macrogui
onvar3 = false
}
else
{
Gui 4: destroy
onvar3 = true
}
return
;-----------------------------------------------------------------------------------------------------------------
moveon:
if onvar = true
{
onvar = false
Gui 1: +caption -toolwindow
Gui 2: +caption -toolwindow
Gui 3: +caption
Settimer, moveoff, 10000
}
else
Gosub, moveoff
return
;;-----------------------------------------------------------------------------------------------------------------
moveoff:
Gui 1: -caption 
Gui 2: -caption
Gui 3: -caption
onvar = true
return
;--------------------------------------------------------------------------------------------------------
close:
onvar2 = true
Gui 3: destroy
return
;---------------------------------------------------------------------------------------------------------

;----------------------------------------------------------------------------------------------------------------------
hide:
Gui 1: hide
Gui 2: show
hide01 = true
return
;--------------------------------------------------------------------------------------------------------------
mainon:
Gui 1: show
Gui 2: hide
hide01 = false
return
;------------------------------------------------------------------------------------
play:

suspend, off
Gui 7: hide
if hide01 = false
Gui 1: show
else
Gui 2: show
return

pause:
Gui 1: hide
Gui 2: hide
Gui 7: show
suspend, on
return
;---------------------------------------


;--------------------------------------------------------functions functions---------------------------------------------------


split:
countcontrol = 0
splitvar := Mainarray[countchange]
StringReplace, splitvar, splitvar, `r,,All
loop, parse, splitvar, `n
{
sleep, 20
splitobj := A_loopfield
if splitobj !=
{
counttotal := counttotal + 1
countcontrol := countcontrol + 1
countchange := countchange + 1
countdelete := countchange + 1
countminus := countchange + 1
count2 := counttotal - 1
count1 := count2 - 1

Mainarray.push(splitobj)
shortclip := substr(splitobj, 1, 60)
StringReplace, shortclip, shortclip, `r`n,,All
shortarray.push(shortclip)
Nrshortarray.push(countcontrol)
Nrvar1 := Nrshortarray[counttotal]
Nrvar2 := Nrshortarray[count1]
Nrvar3 := Nrshortarray[count2]
nrvarminus := Nrarray[countminus]
linevar1 := shortarray[counttotal]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]

Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
Guicontrol, 1: ,Text4, 
}


}
countcontrol = 0


return

;---------------------------------------------------------Functions controls----------------------------------------------------------- */

fcopy:
gui, font, s13 cwhite bold
GuiControl, Font, Textmain


countchange := counttotal
clipboard =


Send ^c
clipwait, 2, 2
Clipsaved := clipboardall

if clipboard !=
{
loop, 1
{
counttotal := counttotal + 1
countcontrol := countcontrol + 1
countchange := countchange + 1
countdelete := countchange + 1
countminus := countchange + 1
count2 := counttotal - 1
count1 := count2 - 1
}
clip1 := clipboard
Mainarray.push(clip1)
shortclip := substr(clip1, 1, 60)
StringReplace, shortclip, shortclip, `r`n,,All


shortarray.push(shortclip)
Nrshortarray.push(countcontrol)
clipboard =
sleep 10

Nrvar1 := Nrshortarray[counttotal]
Nrvar2 := Nrshortarray[count1]
Nrvar3 := Nrshortarray[count2]
nrvarminus := Nrarray[countminus]
linevar1 := shortarray[counttotal]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]

Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
Guicontrol, 1: ,Text4, 



if onvar2 = false
{
fullview := mainarray[countchange]
Guicontrol, 3:, view, %fullview%
}

tooltip, %Nrvar1%. %linevar1%
SetTimer, RemoveToolTip, -1500
clipboard = %clipsaved%
clipsaved = 
clipchange = false
return
}
else
{
clipboard = %clipsaved%
clipsaved = 
return
}


;Delete;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Fdelete:
sleep, 50


RemovedValue := Mainarray.RemoveAt(counttotal)
RemovedValue := Nrshortarray.RemoveAt(counttotal)
RemovedValue := shortarray.Removeat(counttotal)

if countchange > 0
{
counttotal := counttotal - 1

countchange := countchange - 1
countminus := countchange + 1
count2 := counttotal - 1
count1 := count2 - 1

if countcontrol > 0
countcontrol := countcontrol - 1
else
countcontrol = 0
}

Nrvar1 := nrshortarray[countchange]
Nrvar2 := nrshortarray[count1]
Nrvar3 := nrshortarray[count2]
Nrvarminus := nrshortarray[countminus]
linevar1 := shortarray[countchange]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]
linevarminus := shortarray[countminus]

Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
Guicontrol, 1: ,Text4, 

Guicontrol, 3:, view, %fullview%

tooltip, %Nrvar1%. "%linevar1%"
SetTimer, RemoveToolTip, -1500


return

;upupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupupup
Fup:
if countchange > 1
{
countcontrol = 0

Loop, 1
	{
	countchange := countchange - 1
	countdelete := countchange + 1
	countminus := countchange + 1
	count2 := countchange - 1
	count1 := count2 - 1	
	

	}


sleep 50

Nrvar1 := nrshortarray[countchange]
Nrvar2 := nrshortarray[count1]
Nrvar3 := nrshortarray[count2]
Nrvarminus := nrshortarray[countminus]
linevar1 := shortarray[countchange]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]
linevarminus := shortarray[countminus]

Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
Guicontrol, 1: ,Text4, %nrvarminus%.%linevarminus%
fullview := mainarray[countchange]
Guicontrol, 3:, view, %fullview%

tooltip, %Nrvar1%. "%linevar1%"
SetTimer, RemoveToolTip, -1500
return
}
else
{
return
}

;downdowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndowndown
Fdown:
countcontrol = 0
 if countchange < %counttotal%

Loop, 1
	{
	countchange := countchange + 1
	countdelete := countchange + 1
	countminus := countchange + 1
	count2 := countchange - 1
	count1 := count2 - 1
	}


sleep 50

Nrvar1 := nrshortarray[countchange]
Nrvar2 := nrshortarray[count1]
Nrvar3 := nrshortarray[count2]
nrvarminus := nrshortarray[countminus]
linevar1 := shortarray[countchange]
shortvar1 := shortshortarray[countchange]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]
linevarminus := shortarray[countminus]


Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%

Guicontrol, 1: ,Text4, %nrvarminus%.%linevarminus%
fullview := mainarray[countchange]
Guicontrol, 3:, view, %fullview%




tooltip, %Nrvar1%. "%linevar1%"
SetTimer, RemoveToolTip, -1500
return

;releaseall-------------------------------------------------------------------------------------------------------------

releaseall8:
gui, font, s13 cRed bold
GuiControl, Font, Textmain

nrvarallview =
linevarall =
countcontrol = 0
brelease = true
Nrvar2 := Nrshortarray[countchange]
Varstart := countchange - Nrvar2 + 1
linevar0 := shortarray[varstart]

varenter = `n


loop, %Nrvar2%
{
linevarall%A_index% := mainarray[varstart]
IfWinActive, ahk_class XLMAIN ahk_exe EXCEL.EXE
{
StringReplace,linevarall%A_index%,linevarall%A_index%,`n,,L
}
linevarall%A_index% .= varenter


Nrvarall%A_index% := Nrshortarray[varstart]
dot = ._
Nrvarall%A_index% .= dot
Nrvarall%A_index% .= linevarall%A_index%
Nrvarall%A_index% := substr(Nrvarall%A_index%, 1, 150)
Nrvarall%A_index% .= varenter
Nrvarallview .= Nrvarall%A_index%


linevarall .= linevarall%A_index%



varstart++
}
CoordMode, tooltip,
tooltip, %Nrvarallview%
SetTimer, RemoveToolTip, -2000
Settimer, release00, -2000

return

pasteClip2:	
gui, font, s13 cRed bold
GuiControl, Font, Textmain
sus = true
											
countcontrol = 0
linevar1 := Mainarray[countchange]
IfWinactive, ahk_class ConsoleWindowClass
{
Sendinput, %linevar1%
return 
}
else
{
if brelease = true
clipboard = %linevarall%
else
clipboard = %linevar1%

clipwait, 2, 2
Send, ^v

return
} 


IfWinActive, ahk_class ConsoleWindowClass
Sendinput, %clipboard%
else
Send, ^v
return

release00:
brelease = false
Inidelete, %releaseini%, alllines
return


server:
return



^e::
countcontrol = 0
insarray :=["copy ticket number", "copy user id", "copy short description", "copy date", "copy group assigned", "copy justification","pres ctrl + shift +e]",""]
vartool := countcontrol + 1
CoordMode, ToolTip, Screen
vartooltip := insarray[countcontrol + 1]


^F1::
escalation:
Nrvarmacro := nrshortarray[countchange]
nrvarmacro1 := nrvarmacro - 1
nrvarmacro2 := nrvarmacro - 2
nrvarmacro3 := nrvarmacro - 3
nrvarmacro4 := nrvarmacro - 4
nrvarmacro5 := nrvarmacro - 5
nrvarmacro6 := nrvarmacro - 6
nrvarmacro7 := nrvarmacro - 7
nrvarmacro8 := nrvarmacro - 8
nrvarmacro9 := nrvarmacro - 9


xxclip1 := mainarray[countchange - nrvarmacro1]
xxclip2 := mainarray[countchange - nrvarmacro2]
xxclip3 := mainarray[countchange - nrvarmacro3]
xxclip4 := mainarray[countchange - nrvarmacro4]
xxclip5 := mainarray[countchange - nrvarmacro5]
xxclip6 := mainarray[countchange - nrvarmacro6]
xxclip7 := mainarray[countchange - nrvarmacro7]
xxclip8 := mainarray[countchange - nrvarmacro8]
xxclip9 := mainarray[countchange - nrvarmacro9]



mailarray := []


shortout := substr(xxclip1, 1, 3)
if shortout = inc
{

	try
	{
	Fileread, mail, %mailfile%
	stringreplace, mail, mail, $#,`n, All
	
	stringreplace, mail, mail, clip1, %xxclip1%, All
	stringreplace, mail, mail, clip2, %xxclip2%, All
	stringreplace, mail, mail, clip3, %xxclip3%, All
	stringreplace, mail, mail, clip4, %xxclip4%, All
	stringreplace, mail, mail, clip5, %xxclip5%, All
	stringreplace, mail, mail, clip6, %xxclip6%, All
	stringreplace, mail, mail, clip7, %xxclip7%, All
	stringreplace, mail, mail, clip8, %xxclip8%, All
	stringreplace, mail, mail, clip9, %xxclip9%, All
	Mailarray.push(mail)
	tomApp := ComObjActive("Outlook.Application")
	tomMailItem := tomApp.CreateItem(0) ;  tomMailItem := 0
	tomMailItem.display
	IniRead, groupvar, %groupmail%, %xxclip5%
	if groupvar !=
	tomMailItem.TO := groupvar
	else
	tomMailItem.TO := "SSCIM@pl.ibm.com"
	tomMailItem.CC :=  "Kiec, Konrad"
	tomMailItem.Subject := "Escalation for "mainarray[countchange - nrvarmacro1]
	clipboard := mailarray[1]
	wEditor := tomApp.ActiveInspector.WordEditor 	
    wEditor.Application.Selection.Paste
	mailarray := []
	}
	catch e
	{
	msgbox, please open outlook `nor close any outlook'error messages to use this function

	}
	
}
else if shortout = RIT
if xxclip6 = IBM-SRC-CATALOG-SR
msgbox, IBM-SRC-CATALOG-SR this group is wrong pleas copy the group from task
else
{	
	try
	{
	fileread, mail2, %mailfile2%
	stringreplace, mail2, mail2, $#,`n, All
	stringreplace, mail2, mail2, clip1, %xxclip1%, All
	stringreplace, mail2, mail2, clip2, %xxclip2%, All
	stringreplace, mail2, mail2, clip3, %xxclip3%, All
	stringreplace, mail2, mail2, clip4, %xxclip4%, All
	stringreplace, mail2, mail2, clip5, %xxclip5%, All
	stringreplace, mail2, mail2, clip6, %xxclip6%, All
	stringreplace, mail2, mail2, clip7, %xxclip7%, All
	stringreplace, mail2, mail2, clip8, %xxclip8%, All
	stringreplace, mail2, mail2, clip9, %xxclip9%, All
	Mailarray.push(mail2)
	tomApp := ComObjActive("Outlook.Application")
	tomMailItem := tomApp.CreateItem(0) ;  tomMailItem := 0
	tomMailItem.display
	IniRead, groupvar, %groupmail%, %xxclip6%
	if groupvar !=
	tomMailItem.TO := groupvar
	else
	tomMailItem.TO := "SSCIM@pl.ibm.com"
	tomMailItem.CC :=  "Kiec, Konrad"
	tomMailItem.Subject := "Escalation for "mainarray[countchange - nrvarmacro1] / mainarray[countchange - nrvarmacro2]
	clipboard := mailarray[1]
	wEditor := tomApp.ActiveInspector.WordEditor 	
    wEditor.Application.Selection.Paste
	mailarray := []
	}
	catch e
	{
	msgbox, please open outlook `nor close any outlook'error messages to use this function

	}
	
	
}
nrvarmacro1 := 
nrvarmacro2 := 
nrvarmacro3 := 
nrvarmacro4 := 
nrvarmacro5 := 
nrvarmacro6 := 
nrvarmacro7 := 
nrvarmacro8 := 
nrvarmacro9 := 
return


::>esc::
Nrvarmacro := nrshortarray[countchange]
nrvarmacro1 := nrvarmacro - 1
nrvarmacro2 := nrvarmacro - 2
nrvarmacro3 := nrvarmacro - 3
nrvarmacro4 := nrvarmacro - 4
nrvarmacro5 := nrvarmacro - 5
nrvarmacro6 := nrvarmacro - 6
nrvarmacro7 := nrvarmacro - 7
nrvarmacro8 := nrvarmacro - 8
nrvarmacro9 := nrvarmacro - 9


xxclip1 := mainarray[countchange - nrvarmacro1]
xxclip2 := mainarray[countchange - nrvarmacro2]
xxclip3 := mainarray[countchange - nrvarmacro3]
xxclip4 := mainarray[countchange - nrvarmacro4]
xxclip5 := mainarray[countchange - nrvarmacro5]
xxclip6 := mainarray[countchange - nrvarmacro6]
xxclip7 := mainarray[countchange - nrvarmacro7]
xxclip8 := mainarray[countchange - nrvarmacro8]
xxclip9 := mainarray[countchange - nrvarmacro9]



mailarray := []


shortout := substr(xxclip1, 1, 3)
if shortout = inc
{
	Fileread, mail, %mailfile%
	stringreplace, mail, mail, $#,`n, All
	stringreplace, mail, mail, clip1, %xxclip1%, All
	stringreplace, mail, mail, clip2, %xxclip2%, All
	stringreplace, mail, mail, clip3, %xxclip3%, All
	stringreplace, mail, mail, clip4, %xxclip4%, All
	stringreplace, mail, mail, clip5, %xxclip5%, All
	stringreplace, mail, mail, clip6, %xxclip6%, All
	stringreplace, mail, mail, clip7, %xxclip7%, All
	stringreplace, mail, mail, clip8, %xxclip8%, All
	stringreplace, mail, mail, clip9, %xxclip9%, All
	IniRead, groupvar, %groupmail%, %xxclip5%
	if groupvar !=
	sendinput, %groupvar%;
	else
	sendinput, SSCIM@pl.ibm.com;
	sleep, 100
	sendinput, {tab} Kiec, Konrad;
	sleep, 500
	sendinput, {tab}Escalation for %xxclip1%
	sleep, 500
	sendinput, {tab}%mail%
}	
else if shortout = RIT
if xxclip6 = IBM-SRC-CATALOG-SR
msgbox, IBM-SRC-CATALOG-SR this group is wrong pleas copy the group from task
else
{	
	fileread, mail2, %mailfile2%
	stringreplace, mail2, mail2, $#,`n, All
	stringreplace, mail2, mail2, clip1, %xxclip1%, All
	stringreplace, mail2, mail2, clip2, %xxclip2%, All
	stringreplace, mail2, mail2, clip3, %xxclip3%, All
	stringreplace, mail2, mail2, clip4, %xxclip4%, All
	stringreplace, mail2, mail2, clip5, %xxclip5%, All
	stringreplace, mail2, mail2, clip6, %xxclip6%, All
	stringreplace, mail2, mail2, clip7, %xxclip7%, All
	stringreplace, mail2, mail2, clip8, %xxclip8%, All
	stringreplace, mail2, mail2, clip9, %xxclip9%, All
	IniRead, groupvar, %groupmail%, %xxclip5%
	if groupvar !=
	sendinput, %groupvar%;
	else
	sendinput, SSCIM@pl.ibm.com;
	sleep, 500
	sendinput, {tab} Kiec, Konrad;
	sleep, 500
	sendinput, {tab}Escalation for %xxclip1%/%xxclip2%
	sleep, 500
	sendinput, {tab}%mail2%
}
nrvarmacro1 := 
nrvarmacro2 := 
nrvarmacro3 := 
nrvarmacro4 := 
nrvarmacro5 := 
nrvarmacro6 := 
nrvarmacro7 := 
nrvarmacro8 := 
nrvarmacro9 := 
return



^f12::
msgbox be carefull it's autoclicking mode if you want to stop it press SPACE
loop,
{
sleep, 10
click
getkeystate, keydown, space
if keydown = d
break
}

F10::
ifWinActive, ahk_class RemoteToolsFrame
msgbox, active 
return
f11::
WinGetClass, OutputVar, A
msgbox, %outputvar%
return

^space::
gui, font, s13 cRed bold
GuiControl, Font, Textmain										
countcontrol = 0
return
$^x::
gui, font, s13 cwhite bold
GuiControl, Font, Textmain


countchange := counttotal
clipboard =


Send ^x
clipwait, 2, 2
Clipsaved := clipboardall

if clipboard !=
{
loop, 1
{
counttotal := counttotal + 1
countcontrol := countcontrol + 1
countchange := countchange + 1
countdelete := countchange + 1
countminus := countchange + 1
count2 := counttotal - 1
count1 := count2 - 1
}
clip1 := clipboard
Mainarray.push(clip1)
shortclip := substr(clip1, 1, 60)
StringReplace, shortclip, shortclip, `r`n,,All


shortarray.push(shortclip)
Nrshortarray.push(countcontrol)
clipboard =
sleep 10

Nrvar1 := Nrshortarray[counttotal]
Nrvar2 := Nrshortarray[count1]
Nrvar3 := Nrshortarray[count2]
nrvarminus := Nrarray[countminus]
linevar1 := shortarray[counttotal]
linevar2 := shortarray[count1]
linevar3 := shortarray[count2]

Guicontrol, 2: ,Textmain, %linevar1%
Guicontrol, 1: ,TextMain, %nrvar1%.%linevar1%
Guicontrol, 1: ,Text1, %nrvar2%.%linevar2%
Guicontrol, 1: ,Text2, %nrvar3%.%linevar3%
Guicontrol, 1: ,Text4, 



if onvar2 = false
{
fullview := mainarray[countchange]
Guicontrol, 3:, view, %fullview%
}

tooltip, %Nrvar1%. %linevar1%
SetTimer, RemoveToolTip, -1500
clipboard = %clipsaved%
clipsaved = 
clipchange = false
return
}
else
{
clipboard = %clipsaved%
clipsaved = 
return
}

return


cmdbutton:
if cmdvar = false
{
Guicontrol,,cmdbutton, %cbutton2%
cmdvar = true
gosub, cmdfunction
return
}
else
{ 
Guicontrol,,cmdbutton, %cbutton1%
cmdvar = false

return
}

cmdfunction:

ComObjError(enabled)


try
{

input, cmd2, V, {enter},,
 
DetectHiddenWindows,On
Run,%ComSpec% /k,,Hide UseErrorLevel,pid
if not ErrorLevel
{
if !WinExist("ahk_pid" pid)
Sleep,10
DllCall("AttachConsole","UInt",pid)

}

CMD=%cmd2%
objShell:=ComObjCreate("WScript.Shell")


   objExec:=objShell.Exec(CMD)


while,!objExec.StdOut.AtEndOfStream
{
strStdOut:=objExec.StdOut.readline()

sleep, 100
clipboard = `n%strStdOut%
clipwait, 2, 2
send, ^v
}


sleep, 10
objExec =
objShell :=

GuiControl,, cmdbutton, %cbutton1%
}
catch e
{
objExec =
objShell :=

msgbox,4,Wrong command, This cmd command is not Valid!`n Do you want to repeat ?
IfMsgBox yes

gosub, cmdfunction
GuiControl,, cmdbutton, %cbutton1%

}

return






$^c::
gosub, fcopy
return
^Lbutton::
gosub, fcopy
return
$^+backspace::
Gosub, fdelete
return
$^wheelup::
Gosub, Fup
return
$^wheeldown::
Gosub, Fdown
return

$^mbutton::
Gosub, releaseall8
return
$^Rbutton::
Gosub, pasteClip2
return
