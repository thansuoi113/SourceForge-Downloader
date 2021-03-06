$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type mle_output from multilineedit within w_main
end type
type cb_close from commandbutton within w_main
end type
type cb_stop from commandbutton within w_main
end type
type cb_start from commandbutton within w_main
end type
type cbx_cert from checkbox within w_main
end type
type sle_user from singlelineedit within w_main
end type
type st_4 from statictext within w_main
end type
type st_3 from statictext within w_main
end type
type sle_pass from singlelineedit within w_main
end type
type cbx_authen from checkbox within w_main
end type
type cbx_listdir from checkbox within w_main
end type
type cb_2 from commandbutton within w_main
end type
type sle_dirout from singlelineedit within w_main
end type
type st_2 from statictext within w_main
end type
type cb_1 from commandbutton within w_main
end type
type st_1 from statictext within w_main
end type
type sle_rss from singlelineedit within w_main
end type
end forward

global type w_main from window
integer width = 2601
integer height = 1412
boolean titlebar = true
string title = "SourceForge Downloader"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_output mle_output
cb_close cb_close
cb_stop cb_stop
cb_start cb_start
cbx_cert cbx_cert
sle_user sle_user
st_4 st_4
st_3 st_3
sle_pass sle_pass
cbx_authen cbx_authen
cbx_listdir cbx_listdir
cb_2 cb_2
sle_dirout sle_dirout
st_2 st_2
cb_1 cb_1
st_1 st_1
sle_rss sle_rss
end type
global w_main w_main

type variables
n_download_arg in_download_arg
end variables

on w_main.create
this.mle_output=create mle_output
this.cb_close=create cb_close
this.cb_stop=create cb_stop
this.cb_start=create cb_start
this.cbx_cert=create cbx_cert
this.sle_user=create sle_user
this.st_4=create st_4
this.st_3=create st_3
this.sle_pass=create sle_pass
this.cbx_authen=create cbx_authen
this.cbx_listdir=create cbx_listdir
this.cb_2=create cb_2
this.sle_dirout=create sle_dirout
this.st_2=create st_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_rss=create sle_rss
this.Control[]={this.mle_output,&
this.cb_close,&
this.cb_stop,&
this.cb_start,&
this.cbx_cert,&
this.sle_user,&
this.st_4,&
this.st_3,&
this.sle_pass,&
this.cbx_authen,&
this.cbx_listdir,&
this.cb_2,&
this.sle_dirout,&
this.st_2,&
this.cb_1,&
this.st_1,&
this.sle_rss}
end on

on w_main.destroy
destroy(this.mle_output)
destroy(this.cb_close)
destroy(this.cb_stop)
destroy(this.cb_start)
destroy(this.cbx_cert)
destroy(this.sle_user)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_pass)
destroy(this.cbx_authen)
destroy(this.cbx_listdir)
destroy(this.cb_2)
destroy(this.sle_dirout)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_rss)
end on

event open;cbx_authen.Event Clicked( )

end event

event close;If  IsValid(in_download_arg) Then
	 in_download_arg.ib_runflag = False
End If



end event

event timer;If  IsValid(in_download_arg) Then
	If in_download_arg.ib_runflag Then
		cb_stop.Enabled = True
		cb_start.Enabled = False
	Else
		Timer(0)
		cb_stop.Enabled = False
		cb_start.Enabled = True
	End If
End If


end event

type mle_output from multilineedit within w_main
event ue_msg ( string as_msg )
integer x = 37
integer y = 768
integer width = 2487
integer height = 512
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_msg(string as_msg);
mle_output.text = mle_output.text + as_msg
end event

type cb_close from commandbutton within w_main
integer x = 2231
integer y = 576
integer width = 293
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type cb_stop from commandbutton within w_main
integer x = 512
integer y = 576
integer width = 256
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Stop"
end type

event clicked;If  IsValid(in_download_arg) Then
	 in_download_arg.ib_runflag = False
	 Integer li_rc, li_return
	OleObject ole_wsh
	Try
		ole_wsh = Create OleObject
		li_rc = ole_wsh.ConnectToNewObject ( "WScript.Shell" )
		If li_rc = 0 Then
			li_return = ole_wsh.Run ('taskkill /F /IM wget.exe', 0,True)
		End If
	Catch (RuntimeError rte)
	End Try
	Destroy ole_wsh
	mle_output.setredraw( False)
	mle_output.text += "~r~n ~r~n Stop"
	mle_output.setredraw( True)
End If

cb_stop.Enabled = False
cb_start.Enabled = True
end event

type cb_start from commandbutton within w_main
integer x = 256
integer y = 576
integer width = 256
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;n_osversion ln_osversion
String ls_dirapp

ls_dirapp = ln_osversion.of_getmodulepath( )
ChangeDirectory ( ls_dirapp)

If Not IsValid(in_download_arg) Then
	in_download_arg = Create n_download_arg
End If

If in_download_arg.ib_runflag Then Return

String ls_rss, ls_outdir, ls_user, ls_pass
Boolean lb_authen, lb_cert, lb_listdir

ls_rss = sle_rss.Text
ls_outdir = sle_dirout.Text
ls_user = sle_user.Text
ls_pass = sle_pass.Text
lb_authen = cbx_authen.Checked
lb_cert = cbx_cert.Checked
lb_listdir = cbx_listdir.Checked

If IsNull(ls_rss) Or Len(Trim(ls_rss)) = 0 Then
	Messagebox("Warning", "RSS Is Null")
	sle_rss.setfocus( )
	Return
End If

If IsNull(ls_outdir) Or Len(Trim(ls_outdir)) = 0 Then
	Messagebox("Warning", "Output Directory Is Null")
	sle_dirout.setfocus( )
	Return
End If

If lb_authen Then
	If IsNull(ls_user) Or Len(Trim(ls_user)) = 0 Then
		Messagebox("Warning", "User Is Null")
		sle_user.setfocus( )
		Return
	End If
	If IsNull(ls_pass) Or Len(Trim(ls_pass)) = 0 Then
		Messagebox("Warning", "Password Is Null")
		sle_pass.setfocus( )
		Return
	End If
End If

mle_output.Text = ""
in_download_arg.is_dirapp = ls_dirapp
in_download_arg.imle_output = mle_output
in_download_arg.of_download( ls_rss, ls_outdir, ls_user, ls_pass, lb_authen, lb_cert, lb_listdir)
If in_download_arg.ib_runflag Then
	cb_stop.Enabled = True
	cb_start.Enabled = False
	Timer(5)
End If


end event

type cbx_cert from checkbox within w_main
integer x = 695
integer y = 320
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Certificate"
end type

type sle_user from singlelineedit within w_main
integer x = 270
integer y = 416
integer width = 768
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_main
integer x = 37
integer y = 428
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_main
integer x = 1097
integer y = 428
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_pass from singlelineedit within w_main
integer x = 1390
integer y = 416
integer width = 951
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type cbx_authen from checkbox within w_main
integer x = 293
integer y = 320
integer width = 366
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Authen"
end type

event clicked;sle_user.Enabled = This.Checked
sle_pass.Enabled = This.Checked

end event

type cbx_listdir from checkbox within w_main
integer x = 1097
integer y = 320
integer width = 539
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "List Directories"
boolean checked = true
end type

type cb_2 from commandbutton within w_main
integer x = 2359
integer y = 196
integer width = 146
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "...."
end type

type sle_dirout from singlelineedit within w_main
integer x = 270
integer y = 192
integer width = 2085
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "D:\test"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_main
integer x = 37
integer y = 204
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dir Out:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_main
integer x = 2359
integer y = 64
integer width = 146
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "...."
end type

type st_1 from statictext within w_main
integer x = 37
integer y = 80
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rss:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_rss from singlelineedit within w_main
integer x = 270
integer y = 64
integer width = 2085
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

