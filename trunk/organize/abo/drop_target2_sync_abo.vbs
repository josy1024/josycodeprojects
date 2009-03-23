
Const ForAppending = 8
Const ForWriting = 2
Const ForReading = 1	
Const ADS_SCOPE_SUBTREE = 2
dim syncdir 
'	CONST ropts = "/MIR /NDL /NFL /R:2 /W:10 /COPYALL" 'admin-account
	
	CONST ropts = "/MIR /NDL /NFL /R:2 /W:10"' user account

Set objArgs = WScript.Arguments
For Each arg in objArgs

	fullname = arg

Next

wscript.echo GET_SCRIPT_Verzeichnis
wscript.echo "ZIEL: " & fullname
msgbox "start?"

if fullname <> "" then
	syncdir = fullname
	'CONST ropts = "/MIR /NDL /NFL /R:2 /W:10 /SECALL"
		' VORLAGE EINLESEN
		Set objFSO = CreateObject("Scripting.FileSystemObject")
		Set objTextFile = objFSO.OpenTextFile _
		( GET_SCRIPT_Verzeichnis & "aboliste.txt", ForReading)
		
		vorlagetext =""
		Do Until objTextFile.AtEndOfStream
			readline = objTextFile.Readline 
				copyfromto readline, syncdir 
			if readline <> "" then
			end if
		Loop
		objTextFile.Close
end if



function copyfromto (fromdir, basedir)

	Set sh = Wscript.CreateObject("Wscript.Shell")
	Set env = sh.Environment("PROCESS")

	dim debugme, log

	debugme = 0
	
	'replace(fromdir,"\\","\",1,-1,1)
	todir = basename(fromdir)
	todir = basedir & "\" & todir
	log = basedir & "\" & basename (fromdir) & ".log"
	Wscript.Stdout.Write fromdir 
	prog = "%comspec% /C " & GET_SCRIPT_Verzeichnis & "robocopy.exe """ & fromdir & """ """ & todir & """ " & ROPTS & " > """ & log & """"
	if debugme > 1 then Wscript.Stdout.Write prog
	'sh.Run prog, 1, True (no hiding), /K = cmd nicht beenden
	sh.Run prog, 0, True
	
end function

function basename(fullname)

	dim c1
	dim c2
	
	C2 = InStr(C1 + 1, fullname, "\")
	While C2 > 0
	   'basename = Mid(fullname, C1 + 1, C2 - C1 - 1)
	   
	   C1 = C2
	   C2 = InStr(C1 + 1, fullname, "\")
	Wend
	    
	basename = Right(fullname, Len(fullname) - C1)
end function
	
	
Function GET_SCRIPT_Verzeichnis()
	Dim strPfad
	Dim intLaenge
	strPfad=WScript.ScriptFullName
	intLaenge=Len(WScript.ScriptName)
	strPfad=Mid(strPfad,1,Len(strPfad)-intLaenge)
	
	'If strPfad = "" Then
	'		strPfad="\\server-gpm\autoinstall\"
	'End If

	GET_SCRIPT_Verzeichnis=strPfad
End Function
