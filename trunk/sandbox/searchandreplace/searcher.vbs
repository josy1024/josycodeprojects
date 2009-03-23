Set RE = New RegExp

function filter_regexp(teststring, pattern)
	Dim RE
	Set RE = New RegExp
	RE.IgnoreCase = True
	RE.Pattern = pattern

   If RE.Test(teststring) Then 
		filter_regexp = teststring
   else
		filter_regexp = ""
   end if

end function

Private Sub debugprint (compareid, text)
	if debug > compareid then
		wscript.Stdout.writeline "# DEBUG-" & compareid & " :" & text
	end if
end sub

Private Sub basefunction
	
	dim Verzeichnis, recursive, filtertype, pattern, UnterVZ
	
	'VzName,erw,bef,such,ersetz
	' rem c:\daten_lokal, recursive(0/1), regex, *.lnk, "LNKREPL",
	' rem c:\daten_lokal, recursive(0/1), regex, *.lnk, "writeline",
	' rem c:\daten_lokal, recursive(0/1), regex, *.lnk, "writelinefullpath",
	' rem c:\daten_lokal, recursive(0/1), regex, *.lnk, "writelinelinktargets",
	if debug > 0 then
	
		for i = 0 to WScript.Arguments.count -1
			debugprint 1, i & ": " & WScript.Arguments(i)
		next
	end if
	
	VzName = WScript.Arguments(0)
	recursive = false
	if WScript.Arguments(1) = 1 then recursive = true
	
	filtertype = WScript.Arguments(2)
	pattern = WScript.Arguments(3)
	
	If fso.FolderExists(VzName) Then		
		Set Verzeichnis = fso.GetFolder(VzName)
		Call filterchecker(Verzeichnis,pattern,filtertype)

			if (recursive) then
				For Each UnterVZ In Verzeichnis.SubFolders
					Call filterchecker(UnterVZ,pattern,filtertype)
				Next
			end if
	end if
end sub

Private Sub filterchecker(Verzeichnis,pattern,filtertype)
	debugprint 2, "filterchecker: " & Verzeichnis & " " & pattern & " " & filtertype
	
		lastfullpath = Verzeichnis.ShortPath
	
	dim result
	For Each datei In Verzeichnis.Files		
		if filtertype="regex" then
			result=filter_regexp(fso.GetFileName(datei), pattern)
		else
			result=filter_regexp(fso.GetFileName(datei), pattern)
		end if
		if result <> "" then actionresult (result)
	next
end sub

Private Sub actionresult(result)
	debugprint 3, "actionresult: " & result
	dim file
	
	if wscript.arguments(4) = "writeline" then
		wscript.Stdout.writeline result
	elseif wscript.arguments(4) = "writelinefullpath" then
		wscript.Stdout.writeline lastfullpath & "\" & result
	elseif wscript.arguments(4) = "writelinelinktargets" then
		'wscript.Stdout.writeline lastfullpath & "\--" & result
		wscript.Stdout.write fso.GetAbsolutePathName(lastfullpath) & "\" & fso.GetFileName(result)
		wscript.Stdout.writeline "; " & get_target_followlink (lastfullpath , result)
		'dateifollow = get_target_followlink(fso_d.GetAbsolutePathName(Verzeichnis),fso_d.GetFileName(datei))
	elseif wscript.arguments(4) = "del" then
		Set file = fso.GetFile(fso.GetAbsolutePathName(lastfullpath) & "\" & fso.GetFileName(result))
		file.Delete
		set file = nothing
	elseif wscript.arguments(4) = "delmissingtargets" then
		wscript.Stdout.writeline "; " & get_target_followlink (lastfullpath , result)
		target = get_target_followlink (lastfullpath , result)
		If (Not fso.FolderExists(target)) AND (not fso.FileExists(target)) Then
			Set file = fso.GetFile(fso.GetAbsolutePathName(lastfullpath) & "\" & fso.GetFileName(result))
			file.Delete
			set file = nothing	
		end if
	else
		wscript.Stdout.writeline "ELSE:" & result
	end if
end sub

function get_target_followlink (foldername, filename)
	debugprint 4, foldername & " " &  filename
	
' follow shortcuts
' http://www.microsoft.com/technet/scriptcenter/resources/qanda/feb05/hey0209.mspx	

	set link = sh.CreateShortcut(foldername & "\" &  filename)

'	get_target_followlink = LCase(link.targetpath)
	'targetpath = LCase(link.targetpath)
	get_target_followlink = link.targetpath

end function


Private Sub ordner_durcharbeiten(VzName,erw,bef,such,ersetz)		'Durchsuchen des Ordners nach Unterordner

	Dim fso_o, Verzeichnis, datei,UnterVZ
	Dim file
	Set fso_o = CreateObject("Scripting.FileSystemObject")
	
	if(bef="replace") then											'wenn replace: einlesen aus Temp-Datei bezüglich globalen Ersetzungswert
		globresult=Wscript.StdIn.ReadLine
		if debug > 1 then wscript.echo "ordner_durcharbeiten: replace"
	End If
	if(globresult="" AND bef="replace") then						'Wenn keine Datei für replace mitgegeben wurde
			Wscript.echo "Fehlende Übergabedatei"
	else	
		If fso.FolderExists(VzName) Then							'Überprüfen ob Ordnername auch existiert
			if debug > 2 then wscript.echo "ordner_durcharbeiten: ordner existiert"
			Set Verzeichnis = fso.GetFolder(VzName)
			Call ordner_ausgabe(Verzeichnis,erw,bef,such,ersetz)	'Aufruf der Routine zum durcharbeiten der einzelnen Dateien im aktuellen Ordner

			if (recursive) then
				For Each UnterVZ In Verzeichnis.SubFolders				'Aufruf der Routine zum durcharbeiten der einzelnen Dateien in allen Unterordner
					Call ordner_ausgabe(UnterVZ,erw,bef,such,ersetz)
				Next
			end if
			
			if(bef="search")then									'Wenn Befehl "search": Ausgabe des aktuellsten Inhaltes für Temp-Datei
				Wscript.echo globresult
			End If
		Else
			Wscript.Echo "Ordner existiert nicht!!!"				'Fehlermeldung wenn Ordner nicht existiert
		End If
	End If
	Set fso_o = nothing
End Sub

Private Sub ordner_ausgabe(Verzeichnis,erw,bef,such,ersetz)			'Ausgabe aller Dateien eines Ordners
	Dim fso_d
	Set fso_d = CreateObject("Scripting.FileSystemObject")
	Dim datei, ext
	dim dateifollow
	
	For Each datei In Verzeichnis.Files								'Aktion für jede einzelne Datei im Ordner
		wscript.echo "# " & fso_d.GetFileName(datei)
	next 
	For Each datei In Verzeichnis.Files								'Aktion für jede einzelne Datei im Ordner
'	For Each datei In Verzeichnis								'Aktion für jede einzelne Datei im Ordner
		if debug > 1 then wscript.echo "ordner_ausgabe: dateicheck " & fso_d.GetBaseName(datei) 
		ext = LCase(fso_d.GetExtensionName(datei))
		if debug > 2 then wscript.echo "ordner_ausgabe: erweiterung " & ext & " bedingung für erw:" & erw & vbcrlf
		
		if ( ext = erw) Then			'Überprüfen ob richtige Dateinamenerweiterung wie gesucht
			Call datei_bearbeitung(datei,bef,such,ersetz)			'Aufruf einer Routine zum Bearbeiten des Inhalts
		elseif (ext = "lnk") then
			if debug > 2 then wscript.echo fso_d.GetFileName(datei) & " lnk gefunden" 
			if followlinks then
				if debug > 2 then wscript.echo
				dateifollow = get_target_followlink(fso_d.GetAbsolutePathName(Verzeichnis),fso_d.GetFileName(datei))
				if debug > 2 then wscript.echo "#--follow-linkfile: " & dateifollow
				if (fso_d.Fileexists(dateifollow)) then
					ext = LCase(fso_d.GetExtensionName(dateifollow))
					if ( ext = erw) Then
						Call datei_bearbeitung(dateifollow,bef,such,ersetz)
					end if
				end if
			end if
		End If
	Next
	Set fso_d = nothing
End Sub

Private Sub datei_bearbeitung(datei,bef,such,ersetz)				'Bearbeiten der Einzelnen Dateien je nach Befehls-Paramter

    if debug > 1 then wscript.echo "datei_bearbeitung"
	Const ForWriting = 2
	Dim arrFileLines()
	i = 0
	Set fso_d = CreateObject("Scripting.FileSystemObject")
	Set file = fso_d.OpenTextFile(datei,1,False,-1) 				'4.Paramter: UNICode Zeichensatz

	Do Until file.AtEndOfStream										'Einlesen der gesamten Datei, zeilenweise in ein Array
		Redim Preserve arrFileLines(i)
		arrFileLines(i) = file.ReadLine
		i = i + 1
		if debug > 3 then wscript.echo "datei_bearbeitung: einlesen: " & arrFileLines(i) & vbcrlf
	Loop
	file.Close
	Set file=nothing
	
	If(bef="search")then											'Zum Suchen nach den jüngsten Wert
		Call datei_searchres(datei,arrFileLines,such,ersetz)
	elseIf(bef="replace")then										'Zum Ersetzen aller anderen Dateien mit dem jüngsten Wert
		Call datei_replaceres(datei,arrFileLines,such,ersetz)
	else															'Für fixe Ersetzung Zeilen- oder Wortweise
		Dim ausgabe,suchnr,gef
		For j = LBound(arrFileLines) to UBound(arrFileLines) Step 1	'Suchen ob Datei Such/Ersetzttext beinhaltet
			ausgabe=arrFileLines(j)
			suchnr=instr(1,ausgabe, such,1 )
			if  suchnr<> 0 then
				gef=1
				j=UBound(arrFileLines)
			End If
		Next
		if(gef=1) then												'Wenn Datei Suchstring beinhaltet
			Set file = fso_d.openTextFile(datei,ForWriting,False,-1)
			For j = LBound(arrFileLines) to UBound(arrFileLines) Step 1	'Durcharbeiten des Arrays "zeilenweise"
				ausgabe=arrFileLines(j)
				suchnr=instr(1,ausgabe, such, 1)
				if  suchnr<> 0 then
					Select Case(bef)
						Case "word"
							ausgabe=replace(ausgabe,such,ersetz,1,-1,1)	'Ersetzen eines einzelnen Wortes
						Case "line"
							ausgabe=ersetz							'Ersetzen der ganzen Zeile
					End Select
				End If
				file.writeline ausgabe
			Next
			file.Close
			Set file=nothing
		End If
	End If
	Set fso_d = nothing
End Sub

function lastmodified(datei)

	Set fso_d = CreateObject("Scripting.FileSystemObject")
	Set file = fso_d.GetFile(datei)
	
	datum=file.DateLastModified										'Letzte Änderung der Datei
	Set file=nothing
	Set fso_d = nothing
	datum=replace(datum,".","_")									'Aufteilen des Datumstempels in die einzelnen Werte
	datum=replace(datum,":","_")
	tokens=split(datum," ")
	datum=tokens(0)
	zeit=tokens(1)
	
	tokens=split(datum,"_")
	tag=tokens(0)
	monat=tokens(1)
	jahr=tokens(2)
	
	tokens=split(zeit,"_")
	stunde=tokens(0)
	min=tokens(1)
	sekunde=tokens(2)
	
	datum=(((((jahr*100+monat)*100+tag)*100+stunde)*100+min)*100+sekunde)  'zusammenfügen zu einem Vergleichsstempel
	lastmodified=datum
	
End Function

Private Sub datei_searchres(datei,arrFileLines,such,ersetz)			'Suchen nach dem jüngsten Referenzwert in allen Dateien
	
	dim j,user,res
	dim datum
	
	datum=lastmodified(datei)										'Abfrage nach der letzen Veränderung von DATEI
	if(datum>globdate) then											'Nur wenn aktuelles Datum neuer als das bisher jüngste
		For j = LBound(arrFileLines) to UBound(arrFileLines) Step 1
			Dim ausgabe,suchnr
			ausgabe=arrFileLines(j)
			suchus=instr(1,ausgabe,ersetz,1)
			if  suchus<> 0 then										'Suchen ob die Datei "richtigem" USER gehört
				user=ersetz
			End If
			suchres=instr(1,ausgabe,such,1)
			if(suchres<>0) then
				res=ausgabe
			End If
		Next
		if(user<>"" AND res<>"")then								'Setzen der globalen Variablen mit aktuellsten Werten
			globdate=datum
			globuser=user
			globresult=res
		End If
	End If
End Sub

Private sub datei_replaceres(datei,arrFileLines,such,ersetz)		'Ersetze alle Dateien nach Referenzwert

	Set fso_d = CreateObject("Scripting.FileSystemObject")			
	search=ersetz
	
	if debug > 1 then wscript.echo "datei_replaceres: " & datei
	
	For j = LBound(arrFileLines) to UBound(arrFileLines) Step 1		'Suchen ob Datei aktuellem User gehört
		Dim ausgabe,suchnr
		ausgabe=arrFileLines(j)
		suchnr=instr(1,ausgabe, search,1 )
		if  suchnr<> 0 then
			search=such
		End If
	Next
	if(search=such)then												'Ersetzen auf globale Werte
		if debug > 2 then wscript.echo "datei_replaceres: bedingung für inhalt (username) gefunden"
		const forwriting=2											
		Set file = fso_d.OpenTextFile(datei,forwriting,False,-1)
		For j = LBound(arrFileLines) to UBound(arrFileLines) Step 1
			ausgabe=arrFileLines(j)
			suchnr=instr(1,ausgabe, search,1)
			if suchnr<> 0 then
				if debug > 1 then wscript.echo "datei_replaceres: ersetzstring gefunden: search:" & search & " ausgabe:" & ausgabe
				ausgabe=globresult
			End If
			file.writeline ausgabe
		Next
		file.Close
		Set file=nothing
	End If
	Set fso_d = nothing
End Sub 

