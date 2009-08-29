/*    
	 File: searchtrack.js
	 
	modified by: josy1024 http://code.google.com/u/josy1024/
	features: create a itunes playlist by searching in tracklist.txt file
	codebase: http://code.google.com/p/josycodeprojects/
	
	
*/


var	iTunesApp = WScript.CreateObject("iTunes.Application");
var	mainLibrary = iTunesApp.LibraryPlaylist;
var	mainLibrarySource = iTunesApp.LibrarySource;

var tracklistfile = "tracklist.txt";
var searchalways = "";

var numPlaylistsCreated = 0;
var	i;


// FIXME take a -v parameter eventually
var timestamp = false;

var warning = true; // WARN
var verbose = true // INFO
var vverbose = false; // ERR


var PlaylistBase = "";

if (timestamp) {
	var d = new Date();
	// var month = d.getMonth() + 1;
	var month = (d.getMonth () < 10 ? '0' + (d.getMonth () + 1) : (d.getMonth () + 1) );

	var day = d.getDate();
	var year = d.getFullYear();

	var h = (d.getHours () < 10 ? '0' + d.getHours () : d.getHours ());
	var  m = (d.getMinutes () < 10 ? '0' + d.getMinutes () : d.getMinutes ());
	var  s = (d.getSeconds () < 10 ? '0' + d.getSeconds () : d.getSeconds ());

	var PlaylistBase = "Search: " + year  + "_" + month + "_" + day  + "_" + h +  "_" +  m + "_" + s + " ";
}


// var searchText = "Paranoid ";
var searchFields = 0; //ITPlaylistSearchFieldAll  (0) Search all fields of each track.  

var fso = new ActiveXObject("Scripting.FileSystemObject");
var s = fso.OpenTextFile(tracklistfile, 1, true);
// read tracklist.txt
while ( ! s.AtEndOfStream)
{
	searchText = s.ReadLine();

	if (Left(searchText,1) == "#") 
	{
		if (Left(searchText,15) == "# searchalways:") 
		{
			searchalways = String(searchText).substring(15);
			if (verbose) WScript.Echo ( "KEY # searchalways:" + searchalways );
		}
		else if (Left(searchText,11) == "# playlist:") 
		{
			var PlaylistName = PlaylistBase + String(searchText).substring(11);
			if (verbose) WScript.Echo ( "KEY # playlist:" + PlaylistName );
			var OHWPlaylist = iTunesApp.CreatePlaylist(PlaylistName);
		}
		else
		{
			//
		}
	}
	else
	{
		try
		{
			var tracks = mainLibrary.Search(searchText + " " + searchalways,searchFields);
			var	numTracks = tracks.Count;
			if (verbose) WScript.Echo ("Search: " + searchText + " found: " + numTracks);
		}
		catch(err)
		{
			// if (vverbose) WScript.Echo ( err.number + err.description );
			numTracks = 0;
			if (warning) WScript.Echo ("!Not found: " + searchText);
		}
		for (i = 1; i <= numTracks; i++)
		{
			var	currTrack = tracks.Item(i);
			
			OHWPlaylist.AddTrack(currTrack);
			
			if (vverbose) WScript.Echo (i + ": ADD: " + currTrack.Artist +" - " + currTrack.Album +" - "+ currTrack.Name);
			
		}
	}
	
}

s.Close();

function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}