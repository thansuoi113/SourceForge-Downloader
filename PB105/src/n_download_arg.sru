$PBExportHeader$n_download_arg.sru
forward
global type n_download_arg from nonvisualobject
end type
end forward

global type n_download_arg from nonvisualobject
end type
global n_download_arg n_download_arg

type variables
Boolean ib_runflag
n_download in_download
String is_dirapp

multilineedit imle_output
end variables

forward prototypes
public subroutine of_download (string as_rss, string as_outdir, string as_user, string as_pass, boolean ab_authen, boolean ab_cert, boolean ab_listdir)
public subroutine of_msg (string as_msg)
end prototypes

public subroutine of_download (string as_rss, string as_outdir, string as_user, string as_pass, boolean ab_authen, boolean ab_cert, boolean ab_listdir);
If Not IsValid(in_download) Then
	in_download = Create n_download
End If

in_download.is_dirapp = is_dirapp
in_download.of_ini( This)
in_download.of_genbatfile (  as_rss,  as_outdir,  as_user,  as_pass,  ab_authen,  ab_cert,  ab_listdir )

ib_runflag= True
in_download.Post of_download( )
//in_download.of_download( )
end subroutine

public subroutine of_msg (string as_msg);If IsValid(imle_output) Then
	imle_output.setredraw( False)
	//imle_output.Text += as_msg
	imle_output.Text = as_msg
	imle_output.Scroll(Len(imle_output.Text))
	imle_output.setredraw( true)
End If

If Not ib_runflag Then
	//Destroy in_download
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
End If


end subroutine

on n_download_arg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_download_arg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ErrorReturn lErrorReturn
lErrorReturn = SharedObjectRegister("n_download", "in_download")
lErrorReturn = SharedObjectGet("in_download", in_download)

end event

event destructor;ErrorReturn lErrorReturn
lErrorReturn = SharedObjectUnRegister("in_download")
Destroy in_download

end event

