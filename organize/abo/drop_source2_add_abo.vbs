' author: modified by: josy1024 http://code.google.com/u/josy1024/
' codebase: http://code.google.com/p/josycodeprojects/
' URL: $URL$
' Author: $Author$
' Rev: $Rev$ ($Rev$)
' LastChangedDate: $LastChangedDate$
' $Id$


first = true
fullname = ""
	Const ForAppending = 8
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	
	Set objTextFile = objFSO.OpenTextFile _
		    (GET_SCRIPT_Verzeichnis & "\aboliste.txt", ForAppending, True)
			
Set objArgs = WScript.Arguments
For Each arg in objArgs

	fullname = arg
	objTextFile.WriteLine(fullname)
	REM objTextFile.WriteLine(fullname)

Next
objTextFile.Close

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