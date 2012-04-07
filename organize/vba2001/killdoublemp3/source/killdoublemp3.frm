VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form killdouble 
   BackColor       =   &H80000015&
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "JOSY'S Kill Double MP3's 1.02"
   ClientHeight    =   5295
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9135
   FillStyle       =   0  'Ausgefüllt
   Icon            =   "killdoublemp3.frx":0000
   LinkTopic       =   "Monitorpath"
   MaxButton       =   0   'False
   ScaleHeight     =   5295
   ScaleWidth      =   9135
   StartUpPosition =   3  'Windows-Standard
   Begin VB.Frame logframe 
      Caption         =   "Logfenster"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   4680
      TabIndex        =   7
      Top             =   0
      Width           =   4455
      Begin VB.CommandButton Ende_but 
         Caption         =   "Ende"
         Height          =   255
         Left            =   3660
         TabIndex        =   26
         Top             =   0
         Width           =   795
      End
      Begin MSComctlLib.ProgressBar fertigBar 
         Height          =   315
         Left            =   180
         TabIndex        =   22
         Top             =   4920
         Width           =   3315
         _ExtentX        =   5847
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   1
         Scrolling       =   1
      End
      Begin VB.TextBox log_msg 
         Height          =   3435
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   8
         Top             =   240
         Width           =   4275
      End
      Begin VB.Label lab_st 
         Caption         =   "Vergleiche durchgeführt:"
         Height          =   195
         Left            =   180
         TabIndex        =   25
         Top             =   4680
         Width           =   1935
      End
      Begin VB.Label lab_fertigbar 
         Alignment       =   1  'Rechts
         Caption         =   "0 %"
         Height          =   195
         Left            =   3600
         TabIndex        =   23
         Top             =   4980
         Width           =   735
      End
      Begin VB.Label stat_lab 
         Caption         =   "Status..."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   795
         Left            =   120
         TabIndex        =   14
         Top             =   3780
         Width           =   4215
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "m3u - Datei auswählen"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   2775
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   2535
      End
      Begin VB.DirListBox Dir1 
         Height          =   1665
         Left            =   120
         TabIndex        =   3
         ToolTipText     =   "Mit der rechten Mousetaste kann die Verzeichnisliste vergrößert/verkleinert werden"
         Top             =   600
         Width           =   2535
      End
      Begin VB.FileListBox File1 
         Height          =   2040
         Left            =   120
         Pattern         =   "*.m3u"
         TabIndex        =   5
         Top             =   3180
         Width           =   2535
      End
      Begin VB.TextBox confname 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   120
         TabIndex        =   4
         Text            =   "Dateiname.m3u"
         Top             =   2760
         Width           =   2535
      End
      Begin VB.Label Pfad 
         Caption         =   "Pfad..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   2280
         Width           =   2535
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Commands"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   2760
      TabIndex        =   0
      Top             =   0
      Width           =   1935
      Begin VB.CommandButton checkliste_but 
         Caption         =   "Untersuche Liste"
         Height          =   255
         Left            =   120
         Style           =   1  'Grafisch
         TabIndex        =   24
         Top             =   240
         Width           =   1335
      End
      Begin VB.TextBox killpattern 
         Height          =   255
         Left            =   660
         TabIndex        =   21
         Text            =   "*.KDMP3"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox tol_nlen 
         Height          =   255
         Left            =   1380
         TabIndex        =   15
         Text            =   "5"
         Top             =   2760
         Width           =   315
      End
      Begin VB.TextBox tol_name 
         Height          =   255
         Left            =   1380
         TabIndex        =   12
         Text            =   "3"
         Top             =   2400
         Width           =   315
      End
      Begin VB.TextBox tol_groeße 
         Height          =   315
         Left            =   1380
         TabIndex        =   10
         Text            =   "3"
         Top             =   1740
         Width           =   315
      End
      Begin VB.CheckBox move_files 
         Caption         =   "umbenennen auf:"
         Height          =   315
         Left            =   120
         TabIndex        =   9
         Top             =   960
         Width           =   1635
      End
      Begin VB.CommandButton search_button 
         Caption         =   "Start"
         Height          =   255
         Left            =   120
         Style           =   1  'Grafisch
         TabIndex        =   1
         Top             =   600
         Width           =   795
      End
      Begin VB.Label Label4 
         Caption         =   "Namenslänge:"
         Height          =   315
         Left            =   300
         TabIndex        =   17
         Top             =   2760
         Width           =   1035
      End
      Begin VB.Label Label3 
         Caption         =   "Buchstaben:"
         Height          =   315
         Left            =   300
         TabIndex        =   16
         Top             =   2460
         Width           =   915
      End
      Begin VB.Label Label2 
         Caption         =   "Toleranz Name[%]:"
         Height          =   195
         Left            =   120
         TabIndex        =   13
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label Label1 
         Caption         =   "Toleranz Dateigröße[%]:"
         Height          =   435
         Left            =   120
         TabIndex        =   11
         Top             =   1680
         Width           =   1575
      End
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Zentriert
      BackColor       =   &H00000000&
      Caption         =   "ICQ: 84911746"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   315
      Left            =   2820
      TabIndex        =   19
      Top             =   4560
      Width           =   1875
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Zentriert
      BackColor       =   &H00000000&
      Caption         =   "Author: josy1024@gmx.at"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   615
      Left            =   2820
      TabIndex        =   18
      Top             =   3360
      Width           =   1875
   End
End
Attribute VB_Name = "killdouble"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim sf_name As String
Dim sf_len As Integer
Dim sf_file As String

Dim cf_name As String
Dim cf_len As Integer
Dim cf_file As String

Dim stand As Integer
Dim maxzeilen As Integer
Dim defzeilen As Integer
Dim letzesprung As Integer
Dim vergleiche As Long
Dim vergleicheist As Long







Private Sub Command1_Click()


End Sub

Private Sub checkliste_but_Click()
letzesprung = 0

'confname = dateiname
anzahlegefunden = 0
If Right$(Pfad.Caption, 1) = "\" Then
    fname = Pfad.Caption & confname.Text
Else
    fname = Pfad.Caption & "\" & confname.Text
End If


If Right$(fname, 4) = ".m3u" Then
Else
    fname = fname & ".m3u"
End If

MSGMAIN (Time & " " & Date & " <" & fname & ">")
MSG ("")
Open fname For Append As #1
Close #1
maxzeilen = 0
defzeilen = 0


MSGNOCR ("Teste Playliste... ")
Open fname For Input As #1

If Not (EOF(1)) Then Line Input #1, a
Do
    maxzeilen = maxzeilen + 1
    defzeilen = defzeilen - 1
    Do
        If Not (EOF(1)) Then Line Input #1, a
        defzeilen = defzeilen + 1
    Loop Until Mid$(a, 1, 8) = "#EXTINF:" Or EOF(1) 'Suche bis EXTinfotag gefunden
    If Not (EOF(1)) Then Line Input #1, a           'Verzeichnis
Loop Until EOF(1)
maxzeilen = maxzeilen - 1
If maxzeilen < 0 Then maxzeilen = 0
Close #1
MSG ("")
MSG (maxzeilen & " gültige Playlisteinträge gefunden")

MSG (defzeilen & " Playlisteinträge können nicht verglichen werden")
If defzeilen > 0 Then MSG ("Erstellen sie die Playliste neu inclusive Liederlänge!!!")
MSG ("")

vergleicheist = 0
vergleiche = 0

For i = 1 To maxzeilen - 1
    vergleiche = vergleiche + i         'Anzahl der Vergleiche Berechnen
Next i

MSG "Nehme " + Str$(vergleiche) + " Vergleiche vor."
MSG ""
MSGMAIN "Mit <Start> Überprüfung beginnen"

End Sub

Private Sub Dir1_Change()
File1.Path = Dir1.Path
Pfad.Caption = Dir1.Path
ChDir Dir1.Path

End Sub

Private Sub Dir1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    dir1_height_max = 4590
    
    If Button = 2 Then
        If Dir1.Height = 1665 Then
            For i = 1665 To dir1_height_max Step 60
                Dir1.Height = i
            Next i
            Dir1.Height = dir1_height_max
        Else
            For i = dir1_height_max To 1665 Step -60
                Dir1.Height = i
            Next i
            Dir1.Height = 1665
        End If
    End If
End Sub



Private Sub Drive1_Change()
On Error GoTo ErrorHandler:
Dir1.Path = Drive1.Drive
On Error GoTo 0
Exit Sub
ErrorHandler:
    Select Case Err.Number
        Case 68
            Drive1.Drive = Dir1.Path
        Case Else
            On Error GoTo 0
        
    End Select
    Resume  ' Ausführung in der Zeile

End Sub




Private Sub Ende_but_Click()
    End
End Sub

Private Sub File1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    confname.Text = File1.FileName
    
    file1_height_max = 4575
    
    If Button = 2 Then
       
        If File1.Height = 2040 Then
            Dir1.Visible = False
            For i = 0 To 100 Step 2
                File1.Top = 600 + (100 - i) * (3120 - 600) / 100
                File1.Height = 2040 + i * (file1_height_max - 2040) / 100
            Next i
        Else
            For i = 100 To 0 Step -2
                File1.Top = 600 + (100 - i) * (3120 - 600) / 100
                File1.Height = 2040 + i * (file1_height_max - 2040) / 100
            Next i
            Dir1.Visible = True
        End If
    End If
    

End Sub

Private Sub Form_Load()

File1.Path = Dir1.Path
Pfad.Caption = Dir1.Path
ChDir Dir1.Path
    
   
    
  
End Sub




Private Sub kitt_button_Click()
        Name confname.Text As confname.Text & ".kil"
End Sub





Private Sub Label7_Click()

End Sub

Private Sub lab_ende_Click()

End Sub



Private Sub search_button_Click()
letzesprung = 0

'confname = dateiname
anzahlegefunden = 0
If Right$(Pfad.Caption, 1) = "\" Then
    fname = Pfad.Caption & confname.Text
Else
    fname = Pfad.Caption & "\" & confname.Text
End If


If Right$(fname, 4) = ".m3u" Then
Else
    fname = fname & ".m3u"
End If

MSGMAIN (Time & " " & Date & " <" & fname & ">")
MSG ("")
Open fname For Append As #1
Close #1
maxzeilen = 0
defzeilen = 0


MSGNOCR ("Teste Playliste... ")
Open fname For Input As #1

If Not (EOF(1)) Then Line Input #1, a
Do
    maxzeilen = maxzeilen + 1
    defzeilen = defzeilen - 1
    Do
        If Not (EOF(1)) Then Line Input #1, a
        defzeilen = defzeilen + 1
    Loop Until Mid$(a, 1, 8) = "#EXTINF:" Or EOF(1) 'Suche bis EXTinfotag gefunden
    If Not (EOF(1)) Then Line Input #1, a           'Verzeichnis
Loop Until EOF(1)
maxzeilen = maxzeilen - 1
If maxzeilen < 0 Then maxzeilen = 0
Close #1
MSG ("")
MSG (maxzeilen & " gültige Playlisteinträge gefunden")

MSG (defzeilen & " Playlisteinträge können nicht verglichen werden")
If defzeilen > 0 Then MSG ("Erstellen sie die Playliste neu inclusive Liederlänge!!!")
MSG ("")

vergleicheist = 0
vergleiche = 0
For i = 1 To maxzeilen - 1
    vergleiche = vergleiche + i         'Anzahl der Vergleiche Berechnen
Next i

'Windowanimation
MSG "Nehme " + Str$(vergleiche) + " Vergleiche vor."
MSG ""
For i = 0 To 4680 Step 4680 / 100
    Me.Width = 9225 - i
    logframe.Left = 4680 - i
    DoEvents
Next i
Me.Width = 9225 - 4680
logframe.Left = 0


For stand = 1 To (maxzeilen - 1)
   
    Open fname For Input As #1
'Kopf auslesen muss #EXTM3U - File sein
    If Not (EOF(1)) Then Input #1, a
    If a <> "#EXTM3U" Then
        MSG "Keine EXTM3U - Datei!!!!!"
        MSG "Suche wird abgebrochen"
        StatusMSG ("Fehler!")
        Exit Sub
    End If
    
    
    Do
'Dateilänge und name auslesen...
        If letzesprung = 1 Then
            Do
                If Not (EOF(1)) Then Line Input #1, a
            Loop Until Mid$(a, 1, 8) = "#EXTINF:" Or EOF(1)
            If Not (EOF(1)) Then Line Input #1, sf_file
            letzesprung = 0
        Else
            For i = 1 To stand
                Do
                    If Not (EOF(1)) Then Line Input #1, a
                Loop Until Mid$(a, 1, 8) = "#EXTINF:" Or EOF(1)
                If Not (EOF(1)) Then Line Input #1, sf_file
            Next i
        End If
        
        
    
        StatusMSG ("Ich suche nach Datei nr." & stand & Chr$(13) & Chr$(10) & Mid$(a, 9))
        lab_fertigbar.Caption = Str$(Int(fertigBar.Value * 1000) / 1000) + " %"
        
        sf_name = Getpurestring(a)
        sf_len = Getpurelen(a)
       
        If sf_len < 2 Then
            letzesprung = 1
        Else
          Do
            Do
                If Not (EOF(1)) Then Line Input #1, a
            Loop Until Mid$(a, 1, 8) = "#EXTINF:" Or EOF(1)
            If Not (EOF(1)) Then Line Input #1, cf_file
            cf_len = Getpurelen(a)
            If ((sf_len / cf_len) > 1 + (Val(tol_groeße.Text) / 100)) Then 'dateigrößengleichheit durchgefallen
                vergleicheist = vergleicheist + 1
            ElseIf ((sf_len / cf_len) < 1 - (Val(tol_groeße.Text) / 100)) Then
                vergleicheist = vergleicheist + 1
            ElseIf cf_len < 2 Then
                vergleicheist = vergleicheist + 1
            Else    'nähere auswahl
                'untersuche name
                cf_name = Getpurestring(a)
                n = cf_name
                anz = 0
                For i = 1 To Len(sf_name)
                    buchst = Mid$(sf_name, i, 1)
                For j = 1 To Len(n)
                    If buchst = Mid$(n, j, 1) Then
                        anz = anz + 1
                        Mid$(n, j) = Mid$(n, j + 1)
                        n = Left$(n, Len(n) - 1)
                    End If
                Next j
                DoEvents
                Next i
                vergleicheist = vergleicheist + 1
                If vergleicheist > vergleiche Then vergleiche = vergleicheist
                Me.Caption = "KDMP3:" & Str$(vergleicheist)
                fertigBar.Value = 100 * vergleicheist / vergleiche
                faktor = anz / Len(cf_name)
                lfakt = (Len(cf_name) - Len(sf_name)) / Len(sf_name)
                
                If faktor > (1 - Val(tol_name.Text) / 100) Then
                If Sqr(lfakt ^ 2) < (Val(tol_nlen.Text) / 100) Then
                    Open (fname & "_info.txt") For Append As #2
                    Open (fname & "_lösch.bat") For Append As #3
                    Print #2, stand & " * " & Round(faktor, 4) & " * " & Round(lfakt, 4) & " *** " & cf_file
                    Print #3, "del " & Chr$(34) & cf_file & Chr$(34)
                    Close #2
                    Close #3
                    If move_files.Value = 1 Then
                        kpat = Mid$(killpattern.Text, 3)
                        If Len(kpat) < 3 Then kpat = kpat & "_josy_.kil"
                        Name cf_file As cf_file & kpat
                    End If
                    anzahlegefunden = anzahlegefunden + 1
                End If
                End If
             
             End If
          Loop Until EOF(1)
       End If
    Loop Until EOF(1)
    Close #1

Next stand

StatusMSG ("Fertig")
MSG (anzahlegefunden & " ähnliche Dateien gefunden")
MSG ("***************************************")
MSGMAIN (Time & " " & Date)
MSG ("")

'Restauriere Fenstergröße
For i = 0 To 4680 Step 4680 / 100
    logframe.Left = i
    Me.Width = 9225 - 4680 + i
    DoEvents
Next i

logframe.Left = 4680
Me.Width = 9225
Me.Caption = "JOSY'S Kill Double MP3's 1.02"

Dir1.Path = Drive1.Drive

File1.Refresh

End Sub



Sub MSGMAIN(Message As String)
log_msg.Text = log_msg.Text + "@ " + Message + Chr$(13) + Chr$(10)
End Sub

Sub MSG(Message As String)
log_msg.Text = log_msg.Text + Message + Chr$(13) + Chr$(10)
End Sub

Sub MSGNOCR(Message As String)
log_msg.Text = log_msg.Text + Message
End Sub


Sub StatusMSG(Message As String)
    stat_lab.Caption = Message
End Sub

Function Getpurestring(ByVal Source As String) As String

        Source = Mid$(Source, 9)
        j = 0
        Do
            j = j + 1
            i = Mid$(Source, j, 1)
        Loop Until i = ","
        
'exttag wegschneiden
        al = Val(Left$(Source, j - 1))
        an = Mid$(Source, j + 1)
        an = LCase(an)
'comparefähigen name suchen:
'titelnummern ggf entfernen:
        If Val(Left$(an, 2)) <> 0 Then
        an = Mid$(an, 3)
        End If
'bindestriche, doppelpunkte, underlines in "*" umwandeln
'und leerzeichen entfernen
        For i = 1 To Len(an)
            X = Mid$(an, i, 1)
            If X = "'" Or X = "`" Or X = "´" Or X = "." Or X = "+" Or X = "~" Or X = "(" Or X = ")" Then
                Mid$(an, i, 1) = "*"
            End If
            If X = "=" Or X = " " Or X = ":" Or X = "-" Or X = "_" Or X = "," Then
                Mid$(an, i) = Mid$(an, i + 1)
                an = Left$(an, Len(an) - 1)
                i = i - 1
            End If
        Next i
        If an = "" Then an = Str$(Timer * Rnd(10000) / 10000)
                
    Getpurestring = an
End Function
Function Getpurelen(ByVal Source As String) As Integer

        Source = Mid$(Source, 9)
        j = 0
        Do
            j = j + 1
            i = Mid$(Source, j, 1)
        Loop Until i = ","
        
'exttag wegschneiden
        al = Val(Left$(Source, j - 1))
        If al = 0 Then al = 1
Getpurelen = al

End Function

