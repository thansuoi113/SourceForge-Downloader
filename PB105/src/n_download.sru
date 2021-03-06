$PBExportHeader$n_download.sru
forward
global type n_download from nonvisualobject
end type
type process_information from structure within n_download
end type
type shellexecuteinfo from structure within n_download
end type
type startupinfo from structure within n_download
end type
type str_security_attributes from structure within n_download
end type
end forward

type process_information from structure
	long  hprocess 
 long  hthread 
 long  dwprocessid 
 long  dwthreadid 
end type

type shellexecuteinfo from structure
	unsignedlong		cbsize
	unsignedlong		fmask
	long		hwnd
	string		lpverb
	string		lpfile
	string		lpparameters
	string		lpdirectory
	long		nshow
	long		hinstapp
	long		lpidlist
	string		lpclass
	long		hkeyclass
	long		hicon
	long		hmonitor
	long		hprocess
end type

type startupinfo from structure
	long		cb
	long		lpreserved
	long		lpdesktop
	long		lptitle
	long		dwx
	long		dwy
	long		dwxsize
	long		dwysize
	long		dwxcountchars
	long		dwycountchars
	long		dwfillattribute
	long		dwflags
	long		wshowwindow
	long		cbreserved2
	long		lpreserved2
	long		hstdinput
	long		hstdoutput
	long		hstderror
end type

type str_security_attributes from structure
		Long nLength
    Long lpSecurityDescriptor
    Long bInheritHandle
end type

global type n_download from nonvisualobject
end type
global n_download n_download

type prototypes
Function Boolean CreateProcess ( &
	String lpApplicationName, &
	Ref String lpCommandLine, &
	long lpProcessAttributes, &
	long lpThreadAttributes, &
	Boolean bInheritHandles, &
	Long dwCreationFlags, &
	long lpEnvironment, &
	String lpCurrentDirectory, &
	STARTUPINFO lpStartupInfo, &
	Ref PROCESS_INFORMATION lpProcessInformation &
	) Library "kernel32.dll"  alias for "CreateProcessA;Ansi" 		  //Alias For "CreateProcessW"
Function Boolean CreateProcessA ( String lpApplicationName, String lpCommandLine,  ULong lpProcessAttributes, ULong lpThreadAttributes, Boolean bInheritHandles, &
	ULong dwCreationFlags, ULong lpEnvironment, String lpCurrentDirectory,  STARTUPINFO lpStartupInfo, Ref process_information lpProcessInformation ) Library "kernel32.dll"  Alias For "CreateProcessA;Ansi"

Function Long WaitForSingleObject ( &
	long hHandle, &
	Long dwMilliseconds &
	) Library "kernel32.dll"

Function Boolean CloseHandle ( &
	long hObject &
	) Library "kernel32.dll"

Function Boolean GetExitCodeProcess ( &
	long hProcess, &
	Ref Long lpExitCode &
	) Library "kernel32.dll"

Function Boolean TerminateProcess ( &
	long hProcess, &
	Long uExitCode &
	) Library "kernel32.dll"

Function Long ExpandEnvironmentStrings ( &
	String lpSrc, &
	Ref String lpDst, &
	Long nSize &
	) Library "kernel32.dll" Alias For "ExpandEnvironmentStringsW"
	
Function Boolean ShellExecuteEx ( &
	Ref SHELLEXECUTEINFO lpExecInfo &
	) Library "shell32.dll" Alias For "ShellExecuteExW"
	
FUNCTION ulong GetModuleFileName (ulong hinstModule, ref string lpszPath, ulong cchPath ) LIBRARY "KERNEL32.DLL"  ALIAS FOR "GetModuleFileNameA;ansi"  // ;ansi  required for PB10 or better

Subroutine SleepMS ( &
	ulong dwMilliseconds &
	) Library "kernel32.dll" Alias For "Sleep"

Function long GetDesktopWindow ( &
	) Library "user32.dll"

Function long GetWindow ( &
	long hWnd, &
	ulong uCmd &
	) Library "user32.dll"

Function long GetWindowText ( &
	long hWnd, &
	Ref string lpString, &
	long nMaxCount &
	) Library "user32.dll" Alias For "GetWindowTextW"

Function ulong GetWindowThreadProcessId ( &
	long hWnd, &
	Ref ulong lpdwProcessId &
	) Library "user32.dll"

Function long SetParent ( &
	long hWndChild, &
	long hWndNewParent &
	) Library "user32.dll"

Function boolean MoveWindow ( &
	long hWnd, &
	long xpos, &
	long ypos, &
	long nWidth, &
	long nHeight, &
	boolean bRepaint &
	) Library "user32.dll"

Function boolean ShowWindow ( &
	long hWnd, &
	long nCmdShow &
	) Library "user32.dll"

Function Long SetWindowLong( &
	long hWnd, &
	long nIndex, &
	ulong dwNewLong &
	) Library "user32.dll" Alias For "SetWindowLongW"

FUNCTION ulong CreatePipe(ref ulong phReadPipe,ref ulong phWritePipe, &
 ref str_security_attributes lpPipeAttributes,ulong nSize) LIBRARY "kernel32.dll" 

function long ReadFile( ulong hFile,  ref blob lpBuffer, long nNumberOfBytesToRead, &
 ref long lpNumberOfBytesRead, ulong lpOverlapped) library "kernel32.dll"

function ulong GetLastError() library "kernel32.dll" 

FUNCTION ulong PeekNamedPipe(ulong hNamedPipe,ref blob lpBuffer,ulong nBufferSize,&
 ref ulong lpBytesRead,ref ulong lpTotalBytesAvail,ref ulong lpBytesLeftThisMessage) LIBRARY "kernel32.dll"
 
 //length of the ansi string
private function long lstrlenA(long lpString1)library "kernel32.dll" alias for "lstrlenA"
private function long lstrlenA(ref blob b)library 'kernel32' alias for 'lstrlenA'

//convert multibyte to wide char
private function long MultiByteToWideChar(ulong CodePage, long dwFlags, long lpMBStr, long cchMB, ref string lpWStr, long cchWStr)library 'kernel32.dll' alias for 'MultiByteToWideChar'
private function long MultiByteToWideChar(ulong CodePage, long dwFlags, readonly blob lpMBStr, long cchMB, ref string lpWStr, long cchWStr)library 'kernel32.dll' alias for 'MultiByteToWideChar'

private function long WideCharToMultiByte(ulong CodePage,long dwFlags,readonly string lpWideCharStr,long cchWideChar,long mbstr,long cchMultiByte,long lpDefaultChar, ref long lpUsedDefaultChar)library 'kernel32.dll' alias for 'WideCharToMultiByte'

private function long WideCharToMultiByte(ulong CodePage,long dwFlags,readonly string lpWideCharStr,long cchWideChar,ref blob mbstr,long cchMultiByte,long lpDefaultChar, long lpUsedDefaultChar)library 'kernel32.dll' alias for 'WideCharToMultiByte'


Function ULong SHGetFolderPath(ULong hwndOwner, Long nFolder, ULong hToken, Long dwFlags, Ref String pszPath) Library 'shell32.dll' Alias For "SHGetFolderPathA;Ansi"





end prototypes

type variables
n_download_arg inv_arg
 long il_ansi_cp
Boolean ib_terminate
Long il_millsecs


Constant Long INFINITE			 = -1
Constant Long WAIT_ABANDONED	 = 128
Constant Long WAIT_COMPLETE	 = 0
Constant Long WAIT_OBJECT_0	 = 0
Constant Long WAIT_TIMEOUT		 = 258

Constant Long SW_HIDE				 = 0
Constant Long SW_SHOWNORMAL		 = 1
Constant Long SW_NORMAL				 = 1
Constant Long SW_SHOWMINIMIZED	 = 2
Constant Long SW_SHOWMAXIMIZED	 = 3
Constant Long SW_MAXIMIZE			 = 3
Constant Long SW_SHOWNOACTIVATE	 = 4
Constant Long SW_SHOW				 = 5
Constant Long SW_MINIMIZE			 = 6
Constant Long SW_SHOWMINNOACTIVE	 = 7
Constant Long SW_SHOWNA				 = 8
Constant Long SW_RESTORE			 = 9
Constant Long SW_SHOWDEFAULT		 = 10
Constant Long SW_FORCEMINIMIZE	 = 11
Constant Long SW_MAX					 = 11

Constant Long STARTF_USESHOWWINDOW		 = 1
Constant Long STARTF_USESIZE				 = 2
Constant Long STARTF_USEPOSITION			 = 4
Constant Long STARTF_USECOUNTCHARS		 = 8
Constant Long STARTF_USEFILLATTRIBUTE	 = 16
Constant Long STARTF_RUNFULLSCREEN		 = 32
Constant Long STARTF_FORCEONFEEDBACK	 = 64
Constant Long STARTF_FORCEOFFFEEDBACK	 = 128
Constant Long STARTF_USESTDHANDLES		 = 256
Constant Long STARTF_USEHOTKEY			 = 512

Constant Long CREATE_DEFAULT_ERROR_MODE	 = 67108864
Constant Long CREATE_FORCEDOS					 = 8192
Constant Long CREATE_NEW_CONSOLE				 = 16
Constant Long CREATE_NEW_PROCESS_GROUP		 = 512
Constant Long CREATE_NO_WINDOW				 = 134217728
Constant Long CREATE_SEPARATE_WOW_VDM		 = 2048
Constant Long CREATE_SHARED_WOW_VDM			 = 4096
Constant Long CREATE_SUSPENDED				 = 4
Constant Long CREATE_UNICODE_ENVIRONMENT	 = 1024
Constant Long DEBUG_PROCESS					 = 1
Constant Long DEBUG_ONLY_THIS_PROCESS		 = 2
Constant Long DETACHED_PROCESS				 = 8

Constant Long HIGH_PRIORITY_CLASS		 = 128
Constant Long IDLE_PRIORITY_CLASS		 = 64
Constant Long NORMAL_PRIORITY_CLASS		 = 32
Constant Long REALTIME_PRIORITY_CLASS	 = 256


Constant Long Null = 0
Constant Long GWL_STYLE		 = -16
Constant ULong GW_HWNDNEXT	 = 2
Constant ULong GW_OWNER		 = 4
Constant ULong GW_CHILD		 = 5
Constant ULong WS_POPUP		 = 2147483648
Constant ULong WM_SIZE		 = 5
Constant ULong WM_CLOSE		 = 16

Long il_hWnd
String is_commandline

String is_message
String is_sqlfile = ""
String is_batfile
UnsignedLong 		iul_process_handle = 0
String is_dirapp


end variables

forward prototypes
public subroutine of_ini (nonvisualobject anv_arg)
private function long of_getmbcp (boolean ab_utf8)
public function long of_string2mb (boolean ab_utf8, string src, ref blob dst)
public function boolean of_writetext_utf8 (string filename, string text, encoding e, ref string as_error)
public function string of_getappname ()
public function string of_getappname_notextention ()
public function string of_getsysdir ()
public function string of_getappdirtemp ()
public subroutine of_cleardirtemp (string as_remark)
public subroutine of_cleardirtemp ()
public function string of_getmodulepath ()
public function integer of_lastpos (string as_str1, string as_str2)
public function integer of_readfile (string as_file, ref string as_returnstring)
public function integer of_readfile_encode (string as_file, ref string as_returnstring)
public function string of_replaceall (string as_oldstring, string as_findstr, string as_replace)
public subroutine of_genbatfile (string as_rss, string as_outdir, string as_user, string as_pass, boolean ab_authen, boolean ab_cert, boolean ab_listdir)
public function integer of_download ()
end prototypes

public subroutine of_ini (nonvisualobject anv_arg);inv_arg = anv_arg
end subroutine

private function long of_getmbcp (boolean ab_utf8);//returns multibyte charset for internal use for WidechartoMultibyte and vice-versa
long CP_ACP=0  //
long CP_UTF8=65001
long CP_THREAD_ACP=3


if ab_utf8 then return CP_UTF8
return il_ansi_cp
//return CP_THREAD_ACP

end function

public function long of_string2mb (boolean ab_utf8, string src, ref blob dst);//returns the length of the blob in bytes
long len
long cp

cp=of_getMbCP(ab_utf8)

len=WideCharToMultiByte( cp,0,src,-1, dst,0,0,0)
dst=blob(space(len+1),EncodingANSI!) //+1 because PB removes zerochar at the end of string :(
WideCharToMultiByte( cp,0,src,-1, dst,len+1,0,0)

return len

end function

public function boolean of_writetext_utf8 (string filename, string text, encoding e, ref string as_error);//====================================================================
// Function: n_download.of_writetext_utf8()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string  	filename	
// 	value    	string  	text    	
// 	value    	encoding	e       	
// 	reference	string  	as_error	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_writetext_utf8 ( string filename, string text, encoding e, ref string as_error )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

int f
long i
blob b

if e=EncodingANSI! then
	//for ansi use winapi convert, because PB uses system instead of user conversation
	f=FileOpen(filename, StreamMode!, Write!, LockWrite!, Replace!)
elseif e=EncodingUTF8! then
	//for utf8 avoid adding BOM!
	//required by isql???
	f=FileOpen(filename, StreamMode!, Write!, LockWrite!, Replace!)
else
	f=FileOpen(filename, TextMode!, Write!, LockWrite!, Replace!,e)
end if

if f=-1 then 
	as_error = "Can't create the file~r~n~""+filename+'"'
	return false
end if


if e=EncodingANSI! then
	//i=gn_unicode.of_string2mb( /*boolean ab_utf8*/ false, text, b)
	i= of_string2mb(true, text, b)
	i=len(text)
	i=FileWriteEx(f, b ,i)
elseif e=EncodingUTF8! then
	//for utf8 avoid adding BOM!
	//required by isql???
	i=FileWriteEx(f, blob(text,EncodingUTF8!) )
else
	i=FileWriteEx(f, text)
end if


FileClose(f)

return true

end function

public function string of_getappname ();//====================================================================
// Function: n_download.of_getappname()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_getappname ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String	ls_AppPath
String	ls_FullPath
String	ls_Exe
Int	li_Ret
Int	li_Pos = 0
ULong lul_handle, lul_length = 1024
ClassDefinition  lcd

ls_FullPath = Space (1024)
If Handle(GetApplication()) = 0 Then
	// running from the IDE
	lcd = GetApplication().ClassDefinition
	ls_FullPath = lcd.LibraryName
	If Len(ls_FullPath) > 0 Then
		li_Ret = 1
	Else
		li_Ret = 0
	End If
Else
	// running from EXE
	lul_handle = Handle( GetApplication() )
	ls_FullPath = Space(lul_length)
	li_Ret = GetModuleFilename( lul_handle, ls_FullPath, lul_length )
End If

If li_Ret > 0 Then
	// ls_AppPath will be something line <drive><full path>\<exe name>
	// You can then strip off the exe name using:
	Do While (Pos (ls_FullPath, "\", li_Pos + 1) > 0)
		li_Pos = Pos (ls_FullPath, "\", li_Pos + 1)
	Loop
	
	ls_AppPath	 = Mid (ls_FullPath, 1, li_Pos - 1)
	ls_Exe		 = Mid (ls_FullPath, li_Pos + 1)
	
	//ls_apppath
	//ls_fullpath
	// ls_exe
	Return ls_Exe
End If
Return ""





end function

public function string of_getappname_notextention ();String ls_exe
Int li_Pos

ls_exe = of_getappname()
li_Pos =  Pos (ls_exe, ".", 1)
ls_exe = Mid(ls_exe, 1 ,li_Pos - 1)

Return ls_exe


end function

public function string of_getsysdir ();//====================================================================
// Function: n_download.of_getsysdir()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_getsysdir ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Constant Long CSIDL_PERSONAL = 5 // current user My Documents
Constant Long CSIDL_APPDATA = 26 // current user Application Data
Constant Long CSIDL_LOCAL_APPDATA = 28 // local settings Application Data
Constant Long CSIDL_COMMON_DOCUMENTS = 46 // all users My Documents
Constant Long CSIDL_COMMON_APPDATA = 35 // all users Application Data
String ls_path
ULong lul_handle, lul_rc, lul_hToken

ls_path = Space(256)
lul_handle = Handle(This)
SetNull(lul_hToken)
lul_rc = SHGetFolderPath(lul_handle, CSIDL_LOCAL_APPDATA, lul_hToken, 0, ls_path)

Return ls_path // path


end function

public function string of_getappdirtemp ();//====================================================================
// Function: n_download.of_getappdirtemp()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_getappdirtemp ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_dirsys

ls_dirsys = of_getsysdir() + "\" + of_getappname_notextention()

If  Not DirectoryExists ( ls_dirsys ) Then
	CreateDirectory (ls_dirsys )
End If

Return ls_dirsys


end function

public subroutine of_cleardirtemp (string as_remark);
//====================================================================
// Function: n_download.of_cleardirtemp()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_remark	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_cleardirtemp ( string as_remark )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_sysdir, ls_filename
Int li_items , li_i

ls_sysdir = of_getsysdir() + "\" + of_getappname_notextention()

If Not (IsNull(as_remark) Or Len(Trim(as_remark)) = 0) Then
	ls_sysdir += "\" + as_remark
End If

window lw_tmp
listbox llb_tmp

Open( lw_tmp )
lw_tmp.Visible = False
lw_tmp.OpenUserObject( llb_tmp )

llb_tmp.DirList(ls_sysdir,0)
li_items = llb_tmp.TotalItems()

For li_i = 1 To li_items
	ls_filename = llb_tmp.Text( li_i )
	If FileExists ( ls_sysdir + '\' + ls_filename ) Then FileDelete ( ls_sysdir + '\' + ls_filename )
Next

lw_tmp.CloseUserObject( llb_tmp )
Close( lw_tmp )



end subroutine

public subroutine of_cleardirtemp ();of_cleardirtemp("")
end subroutine

public function string of_getmodulepath ();//====================================================================
// Function: n_download.of_getmodulepath()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_getmodulepath ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



string	ls_AppPath
string	ls_FullPath
string	ls_Exe
int	li_Ret
int	li_Pos = 0
ulong lul_handle, lul_length = 1024
ClassDefinition  lcd

ls_Fullpath = Space (1024)
IF handle(getapplication()) = 0 THEN
	// running from the IDE
    lcd=getapplication().classdefinition
    ls_FullPath = lcd.libraryname
	if len(ls_FullPath) > 0 then
		li_ret = 1
	else
		li_ret = 0
	end if
else
	// running from EXE
    lul_handle = handle( getapplication() )
    ls_fullpath=space(lul_length) 
    li_ret = GetModuleFilename( lul_handle, ls_FullPath, lul_length )
end if

if li_Ret > 0 then 
	// ls_AppPath will be something line <drive><full path>\<exe name>
	// You can then strip off the exe name using:
	do while (Pos (ls_FullPath, "\", li_Pos + 1) > 0)
		li_Pos = Pos (ls_FullPath, "\", li_Pos + 1)
	loop
	
	ls_AppPath	= Mid (ls_FullPath, 1, li_Pos - 1)
	ls_Exe		= Mid (ls_FullPath, li_Pos + 1)

	//ls_apppath
	//ls_fullpath
	// ls_exe
	return ls_apppath
end if
return ""



end function

public function integer of_lastpos (string as_str1, string as_str2);//====================================================================
// Function: of_lastpos()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	string	as_str1	
// 	string	as_str2	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2018.10.09
//--------------------------------------------------------------------
//	Copyright (c) 2018  PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer li_pos
Integer li_rtn

If ((((IsNull(as_str1)) Or (IsNull(as_str2))) Or (Trim(as_str1) = "")) Or (Trim(as_str2) = "")) Then
	Return 0
End If

Do
	li_rtn = li_pos
	li_pos = Pos(as_str1,as_str2,li_pos + 1)
Loop While li_pos > 0

Return li_rtn

end function

public function integer of_readfile (string as_file, ref string as_returnstring);//====================================================================
// Function: n_download.of_readfile()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string	as_file        	
// 	reference	string	as_returnstring	
//--------------------------------------------------------------------
// Returns:  tring
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_readfile ( string as_file, ref string as_
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



Integer li_loops, li_i
Integer li_FileNum
Long ll_fLen, ll_bRead, ll_NewPos
String ls_tmp, ls_string_file

// Get the file length and open the file
ll_fLen = FileLength(as_file)
li_FileNum = FileOpen(as_file,StreamMode!, Read!, Shared!)
If li_FileNum < 0 Then
	//messagebox('thong bao', 'doc file loi ' +as_file)
	FileClose(li_FileNum)
	Return 1
End If

// Determine how many times to call FileRead
If ll_fLen > 32765 Then
	If Mod(ll_fLen, 32765) = 0 Then
		li_loops = ll_fLen/32765
	Else
		li_loops = (ll_fLen/32765) + 1
	End If
Else
	li_loops = 1
End If

// Read the file
ls_tmp = ''
ls_string_file = ''
ll_NewPos = 1
For li_i = 1 To li_loops
	ll_bRead = FileRead(li_FileNum, ls_tmp)
	If ll_bRead < 0 Then
		//messagebox('thong bao', 'doc file loi ' +as_file)
		FileClose(li_FileNum)
		Return 1
	End If
	ls_string_file = ls_string_file + ls_tmp
Next

FileClose(li_FileNum)
as_returnstring = ls_string_file
Return  0

end function

public function integer of_readfile_encode (string as_file, ref string as_returnstring);//====================================================================
// Function: n_download.of_readfile_encode()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string	as_file        	
// 	reference	string	as_returnstring	
//--------------------------------------------------------------------
// Returns:  tring
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_readfile_encode ( string as_file, ref string as_
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_FileNum, loops, j
Long flen, bytes_read
Integer fh, ret
Blob b, tot_b,C
String  ls_string
Long ll_rowerror

flen = FileLength(as_file)
li_FileNum = FileOpen(as_file,  StreamMode!, Read!, LockRead!)
If li_FileNum < 0 Then
	//messagebox('thong bao', 'doc file loi ' +as_file)
	Return 1
End If
If flen > 32765 Then
	If Mod(flen, 32765) = 0 Then
		loops = flen/32765
	Else
		loops = (flen/32765) + 1
	End If
Else
	loops = 1
End If
For j = 1 To loops
	bytes_read = FileRead(li_FileNum, b)
	tot_b = tot_b + b
Next
FileClose(li_FileNum)

as_returnstring = String(tot_b, EncodingUTF8!)
Return 0


end function

public function string of_replaceall (string as_oldstring, string as_findstr, string as_replace);//====================================================================
// Function: n_download.of_replaceall()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_oldstring	
// 	value	string	as_findstr  	
// 	value	string	as_replace  	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_replaceall ( string as_oldstring, string as_findstr, string as_replace )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



String ls_newstring
Long ll_findstr, ll_replace, ll_pos

// get length of strings
ll_findstr = Len(as_findstr)
ll_replace = Len(as_replace)

// find first occurrence
ls_newstring = as_oldstring
ll_pos = Pos(ls_newstring, as_findstr)

Do While ll_pos > 0
	// replace old with new
	ls_newstring = Replace(ls_newstring, ll_pos, ll_findstr, as_replace)
	// find next occurrence
	ll_pos = Pos(ls_newstring, as_findstr, (ll_pos + ll_replace))
Loop

Return ls_newstring


end function

public subroutine of_genbatfile (string as_rss, string as_outdir, string as_user, string as_pass, boolean ab_authen, boolean ab_cert, boolean ab_listdir);//====================================================================
// Function: n_download.of_genbatfile()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string 	as_rss    	
// 	value	string 	as_outdir 	
// 	value	string 	as_user   	
// 	value	string 	as_pass   	
// 	value	boolean	ab_authen 	
// 	value	boolean	ab_cert   	
// 	value	boolean	ab_listdir	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/22
//--------------------------------------------------------------------
// Usage: n_download.of_genbatfile ( string as_rss, string as_outdir, string as_user, string as_pass, boolean ab_authen, boolean ab_cert, boolean ab_listdir )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_batfile, ls_content, ls_tring_psql, ls_errortext
String ls_apppath, ls_wget

n_osversion ln_osversion

If ln_osversion.of_getosbits( ) =  64 Then
	ls_wget = "wget64"
Else
	ls_wget = "wget32"
End If

is_batfile = ""
//ls_batfile = of_getappdirtemp( ) + "\run" + String(Now(), 'yyyymmddhhmmssfff') + ".bat"
ls_batfile = is_dirapp + "\temp\run" + String(Now(), 'yyyymmddhhmmssfff') + ".bat"

If  Not DirectoryExists ( is_dirapp + "\temp" ) Then
	CreateDirectory ( is_dirapp + "\temp" )
End If

//ls_content = 'Set Path ="' + is_dirapp + "\"+ ls_wget+  '"' + "~r~n"
ls_content = 'cd "' + is_dirapp + "\"+ ls_wget+  '"' + "~r~n"
ls_content = ls_content + 'curl '+as_rss+' | grep "<link>.*</link>" | sed "s|<link>||;s|</link>||" | sed "s|/download$||" >"'+is_dirapp+ '\temp\downloadlist"' + '~r~n'
ls_content = ls_content + 'wget -P "'+as_outdir+'"'

If Not ab_cert Then
	ls_content = ls_content + ' --no-check-certificate'
End If

If ab_authen Then
	ls_content = ls_content +  ' --user='+as_user+' --password="'+as_pass+'"'
End If

If ab_listdir Then
	ls_content = ls_content + ' -x'
End If

ls_content = ls_content + ' -e robots=off -np -i "'+is_dirapp+'\temp\downloadlist"'

ls_errortext = ''
If of_writetext_utf8(ls_batfile,ls_content,EncodingUTF8!, ls_errortext) = False Then
	is_batfile = ""
	Return
Else
	is_batfile = ls_batfile
	Return
End If


end subroutine

public function integer of_download ();//====================================================================
// Function: n_download.of_download()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/04/23
//--------------------------------------------------------------------
// Usage: n_download.of_download ( )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Constant ULong 			DUPLICATE_SAME_ACCESS = 2
Constant ULong 			BUFSIZE = 1024
Constant ULong 			PIPE_READMODE_BYTE = 0
Constant ULong 			PIPE_NOWAIT = 1

str_security_attributes	lstr_secure_attrib
startupinfo lstr_si
process_information lstr_pi
Long ll_null, ll_creationflags, ll_exitcode, ll_msecs
String ls_null, ls_message
UnsignedLong 			lul_null, luoverlapped, lul_err
UnsignedLong 			hpiperead,hpipewrite
UnsignedLong 			lpbytesread, lptotalbytesavail, lpbytesleft, lpbufoutlen
Boolean 					lb_created
Blob						lbl_read
Long						  lbytesread, lpipeoutlen
Long ll_row, ll_pos
String ls_tmp
String ls_bat

ls_bat = is_batfile

// initialize arguments
lbl_read = Blob(Space(BUFSIZE))
SetNull(ll_null)
SetNull(ls_null)
SetNull(lul_null)
luoverlapped = 0

lstr_secure_attrib.nLength = 12
lstr_secure_attrib.bInheritHandle = 1
lstr_secure_attrib.lpSecurityDescriptor = 0


//lstr_si.cb = 72
lstr_si.cb = 17 *4
lstr_si.dwFlags = STARTF_USESHOWWINDOW   + STARTF_USESTDHANDLES
lstr_si.wShowWindow = SW_HIDE
ll_creationflags = 0

If CreatePipe(hpiperead, hpipewrite, lstr_secure_attrib, 0) = 0 Then
	//messageBox("error", "create pipe failed")
	Return -1
End If

lstr_si.hStdOutput  = hpipewrite
lstr_si.hStdError = hpipewrite
lstr_si.hStdInput = hpipewrite

// create process/thread and execute the passed program
If CreateProcess(ls_null, ls_bat, ll_null, ll_null, True, ll_creationflags, ll_null, ls_null, lstr_si, lstr_pi) Then
	// wait for the process to complete
	If il_millsecs > 0 Then
		// wait until process ends or timeout period expires
		ll_exitcode = WaitForSingleObject(lstr_pi.hProcess, il_millsecs)
		// terminate process if not finished
		If ib_terminate And ll_exitcode = WAIT_TIMEOUT Then
			TerminateProcess(lstr_pi.hProcess, -1)
			ll_exitcode = WAIT_TIMEOUT
		Else
			// check for exit code
			GetExitCodeProcess(lstr_pi.hProcess, ll_exitcode)
		End If
	Else
		
		// close hPipeWrite and thread handles
		CloseHandle(hpipewrite)
		CloseHandle(lstr_pi.hThread)
		
		//redirect out message
		lbytesread = ReadFile( hpiperead, lbl_read, BUFSIZE,lpipeoutlen, 0)
		If lbytesread = 0 Then
			lul_err = GetLastError()
			If lul_err = 109 Then
				//messagebox("error reading", "error 109 - broken pipe")
			Else
				//messagebox("error reading", string(lul_err))
			End If
		End If
		ls_message = ""
		ll_row = 0
		ls_tmp = ""
		Do While lbytesread > 0 And lpipeoutlen > 0
			
			ls_tmp = String(BlobMid(lbl_read,1, lpipeoutlen), encodingANSI!)
			/*
						If ll_row = 0 Then
							ll_pos = 0
							ll_pos = Pos(Lower(ls_tmp),"saving", 1) + Pos(Lower(ls_tmp),"robots=off", 1) 
							If ll_pos > 0 Then
								ll_row ++
							End If
						End If
						
						If ll_row > 0 Then
							ll_pos = 0
							ll_pos = Pos(Lower(ls_tmp),"saved", 1) +  Pos(Lower(ls_tmp),"awaiting", 1) +  Pos(Lower(ls_tmp),"https://sourceforge.net", 1) +  Pos(Lower(ls_tmp),"443", 1) //+  Pos(Lower(ls_tmp),"kb/s", 1) 
							If ll_pos > 0 Then
								ll_row = 0
							End If
						End If
			*/
			
			If ll_row > 0 Then
				ls_message += ls_tmp
				inv_arg.of_msg(ls_message)
			End If
			
			If ll_row = 0 Then
				ll_pos = 0
				ll_pos = Pos(Lower(ls_tmp),"saving", 1) + Pos(Lower(ls_tmp),"robots=off", 1)
				If ll_pos > 0 Then
					ll_row ++
				End If
			End If
			
			If Not inv_arg.ib_runflag Then
				TerminateProcess(lstr_pi.hProcess, -1)
				inv_arg.of_msg("Stop")
				CloseHandle(hpipewrite)
				CloseHandle(lstr_pi.hThread)
				closeHandle(hpiperead)
				CloseHandle(lstr_pi.hProcess)
			End If
			
			lbytesread = ReadFile( hpiperead, lbl_read, BUFSIZE,lpipeoutlen, 0)
		Loop
		is_message = ls_message
		
		// wait until process ends
		WaitForSingleObject(lstr_pi.hProcess, INFINITE)
		// check for exit code
		GetExitCodeProcess(lstr_pi.hProcess, ll_exitcode)
	End If
	
	// close process and hPipeRead
	closeHandle(hpiperead)
	CloseHandle(lstr_pi.hProcess)
	//CloseHandle(lstr_pi.hThread)
Else
	// return failure
	ll_exitcode = -1
End If
If inv_arg.ib_runflag Then
	ls_message += "~r~n" +  "Complete"
End If
Filedelete(is_batfile)
//ls_message = "Compulete"
inv_arg.ib_runflag = False
inv_arg.of_msg(ls_message)

Return ll_exitcode

end function

on n_download.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_download.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//of_cleardirtemp()
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

Filedelete(is_batfile)
end event

