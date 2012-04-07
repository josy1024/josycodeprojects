VERSION 5.00
Begin VB.Form killdouble 
   BackColor       =   &H80000015&
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "JOSY'S Rename Files 1.00 from List"
   ClientHeight    =   5280
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9060
   FillStyle       =   0  'Ausgefüllt
   Icon            =   "Renamefiles_main.frx":0000
   LinkTopic       =   "Monitorpath"
   MaxButton       =   0   'False
   ScaleHeight     =   5280
   ScaleWidth      =   9060
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
      Left            =   4500
      TabIndex        =   7
      Top             =   0
      Width           =   4575
      Begin VB.CommandButton Ende_but 
         Caption         =   "Ende"
         Height          =   255
         Left            =   3420
         TabIndex        =   12
         Top             =   0
         Width           =   1035
      End
      Begin VB.TextBox log_msg 
         Height          =   4995
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   8
         Top             =   240
         Width           =   4455
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
         TabIndex        =   11
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
      Height          =   2115
      Left            =   2820
      TabIndex        =   0
      Top             =   0
      Width           =   1635
      Begin VB.CommandButton Command1 
         Caption         =   "Test"
         Height          =   255
         Left            =   180
         TabIndex        =   16
         Top             =   1320
         Width           =   1275
      End
      Begin VB.CommandButton txt_but 
         Caption         =   "Textliste - Liste"
         Height          =   255
         Left            =   180
         TabIndex        =   14
         Top             =   900
         Width           =   1275
      End
      Begin VB.CommandButton m3u_but 
         Caption         =   "M3U - Liste"
         Height          =   255
         Left            =   180
         TabIndex        =   13
         Top             =   600
         Width           =   1275
      End
      Begin VB.CommandButton search_button 
         Caption         =   "Start"
         Height          =   255
         Left            =   180
         Style           =   1  'Grafisch
         TabIndex        =   1
         Top             =   1680
         Width           =   1275
      End
      Begin VB.Label Label1 
         Caption         =   "Liste auswählen"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   60
         TabIndex        =   15
         Top             =   240
         Width           =   1455
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
      Left            =   2700
      TabIndex        =   10
      Top             =   3960
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
      Left            =   2700
      TabIndex        =   9
      Top             =   2640
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
Private Type infotype
    m3ulistanz As Integer
    txtlistanz As Integer
    m3ufile As String
    txtfile As String
End Type

Dim info As infotype






Private Sub Command1_Click()

Open info.m3ufile For Input As #1
Open info.txtfile For Input As #2

If info.txtlistanz <> info.m3ulistanz Then
    MSG "Nummerierung stimmt vielleicht nicht mit Dateiname und Musik überein! Ändern sie bitte die Textdatei ab! Oder fügen sie eine TrackCode ein"
End If
MSG ""
i = 0
Do
    i = i + 1
    Do
        If Not (EOF(1)) Then Line Input #1, a
    Loop Until Left$(a, 1) <> "#" Or EOF(1)

    If Not (EOF(2)) Then
        Line Input #2, b
    Else
        b = "Track"
    End If
        
    If Left(b, 1) = "*" Then
        b = Mid$(b, 2)
        If Left(b, 1) = "-" Or Left(b, 1) = "+" Then
            i = i + Val(b)
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
        Else
            i = Val(b)
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
        End If
    ElseIf Left(b, 1) = "#" Then
            i = i + 1
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
    End If
    
    b = Format(i, "00- ") & b & Right$(a, 4)
    
    'Name a As b
    MSG "" & b
Loop Until EOF(1)

Close

Dir1.Path = Drive1.Drive

File1.Refresh

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
    
MSG "Mit diesem Programm können sie Dateien aus einer *.m3u Playliste umbenennen. Die Dateien werden nach den jeweiligen Namen in der Textdatei umbenannt."
MSG "Zuerst die M3u-Liste wählen"

    
  
End Sub








Private Sub m3u_but_Click()

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

Open fname For Append As #1
Close #1
maxzeilen = 0

MSG ""
MSGNOCR ("Teste Playliste... <" & fname & ">")
Open fname For Input As #1


Do
    If Not (EOF(1)) Then Line Input #1, a
    If Left$(a, 1) <> "#" Then maxzeilen = maxzeilen + 1
Loop Until EOF(1)

Close #1
MSG (" " & maxzeilen & " gültige Playlisteinträge gefunden")
File1.Pattern = "*.txt"
MSG ""
MSG "Textdatei angeben:"
info.m3ufile = fname
info.m3ulistanz = maxzeilen
End Sub

Private Sub search_button_Click()

Open info.m3ufile For Input As #1
Open info.txtfile For Input As #2
Open info.m3ufile & "_rename.bat" For Output As #3

If info.txtlistanz <> info.m3ulistanz Then
    MSG "Nummerierung stimmt vielleicht nicht mit Dateiname und Musik überein! Ändern sie bitte die Textdatei ab! Oder fügen sie eine TrackCode ein"
End If
MSG ""
i = 0
Do
    i = i + 1
    Do
        If Not (EOF(1)) Then Line Input #1, a
    Loop Until Left$(a, 1) <> "#" Or EOF(1)

    If Not (EOF(2)) Then
        Line Input #2, b
    Else
        b = "Track"
    End If
        
    If Left(b, 1) = "*" Then
        b = Mid$(b, 2)
        If Left(b, 1) = "-" Or Left(b, 1) = "+" Then
            i = i + Val(b)
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
        Else
            i = Val(b)
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
        End If
    ElseIf Left(b, 1) = "#" Then
            i = i + 1
            If Not (EOF(2)) Then
                Line Input #2, b
            Else
                b = "Track"
            End If
    End If
    
    b = Format(i, "00- ") & b & Right$(a, 4)
    
    Print #3, "ren " & Chr$(34) & a & Chr$(34) & " " & Chr$(34) & b & Chr$(34)
    
    MSG "" & b
Loop Until EOF(1)

Close

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

Private Sub txt_but_Click()

letzesprung = 0

'confname = dateiname
anzahlegefunden = 0
If Right$(Pfad.Caption, 1) = "\" Then
    fname = Pfad.Caption & confname.Text
Else
    fname = Pfad.Caption & "\" & confname.Text
End If


If Right$(fname, 4) = ".txt" Then
Else
    fname = fname & ".txt"
End If

Open fname For Append As #1
Close #1
maxzeilen = 0
defzeilen = 0

MSG ""
MSGNOCR ("Teste Textdatei... <" & fname & ">")
Open fname For Input As #1

If Not (EOF(1)) Then Line Input #1, a
Do
    If Not (EOF(1)) Then
        Line Input #1, a           'Verzeichnis
        maxzeilen = maxzeilen + 1
    Else
        Exit Do
    End If
Loop Until EOF(1)
Close #1
MSG (" " & maxzeilen & " gültige Playlisteinträge gefunden")
File1.Pattern = "*.txt"
MSG ""
info.txtfile = fname
info.txtlistanz = maxzeilen
End Sub
