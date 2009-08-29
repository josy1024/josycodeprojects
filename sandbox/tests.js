// komment test.js read


var fso = new ActiveXObject("Scripting.FileSystemObject");
var s = fso.OpenTextFile("tests.js", 1, true);

while ( ! s.AtEndOfStream)
{
row = s.ReadLine();

//also we can use s.ReadAll() to read all the lines;

WScript.Echo (row);
}

s.Close();

/*
Const ForReading = 1
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile _
    ("c:\scripts\servers and services.txt", ForReading)
Do Until s.AtEndOfStream
    strNextLine = s.Readline
    arrServiceList = Split(strNextLine , ",")
    Wscript.Echo "Server name: " & arrServiceList(0)
    For i = 1 to Ubound(arrServiceList)
        Wscript.Echo "Service: " & arrServiceList(i)
    Next
Loop

*/