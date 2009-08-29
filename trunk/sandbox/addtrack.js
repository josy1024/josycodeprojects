/*    
	 File: searchtrack.js
	 
	modified by: josy1024 http://code.google.com/u/josy1024/
	feature: add a track by location, generate a delete list for the added file
	codebase: http://code.google.com/p/josycodeprojects/
	
*/


var	iTunesApp = WScript.CreateObject("iTunes.Application");
var	mainLibrary = iTunesApp.LibraryPlaylist;
var	mainLibrarySource = iTunesApp.LibrarySource;


var numPlaylistsCreated = 0;
var	i;

var verbose = false;

// var path = 'E:\Archiv_XXXX\2004\2004_08_#4\Radiohead - Pablo Honey\02 - Radiohead -Creep.mp3';

var path = 'E:\\Archiv_XXXX\\2004\\2004_08_#4\\Radiohead - Pablo Honey\\02 - Radiohead -Creep.mp3';

// var path = 'E:/Archiv_XXXX/2004/2004_08_#4/Radiohead - ok computer/06 - Radiohead -Karma Police.mp3';

' WScript.Echo ( path.replace(/\\/g,'/'));

' WScript.Echo ( path.replace(/\//g,'//'));

// WScript.Quit;

	try
	{

		var erg = mainLibrary.AddFile(path);

		WScript.Echo ( "del /Q /S \"" + path + "\"" );

	}
	catch(err)
	{
		WScript.Echo ( err.number + err.description );
	}
		
