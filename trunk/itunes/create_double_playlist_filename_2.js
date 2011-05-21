/*    
	 File: searchtrack.js
	 
	modified by: josy1024 http://code.google.com/u/josy1024/
	features: create a itunes playlist by searching in tracklist.txt file
	codebase: http://code.google.com/p/josycodeprojects/

	'  $URL$
'  $Author$
'  $Rev$ 
'  $LastChangedDate$
	
*/

var ITTrackKindFile	= 1;

var	iTunesApp = WScript.CreateObject("iTunes.Application");
var	mainLibrary = iTunesApp.LibraryPlaylist;
var	mainLibrarySource = iTunesApp.LibrarySource;

var	tracks = mainLibrary.Tracks;
var	numTracks = tracks.Count;

var tracklocation = "";

var numPlaylistsCreated = 0;
var	i;


// FIXME take a -v parameter eventually
var timestamp = false;

var warning = true; // WARN
var verbose = true // INFO
var vverbose = false; // ERR

var numTracks;
var tracks;
var lastbitrate;

var PlaylistBase = "";

// var searchText = "Paranoid ";
var searchFields = 0; //ITPlaylistSearchFieldAll  (0) Search all fields of each track.  


var PlaylistName = PlaylistBase + "_2_filenames"
var OHWPlaylist = iTunesApp.CreatePlaylist(PlaylistName);

var PlaylistName = PlaylistBase + "_2_filenames_all"
var OHWPlaylist2 = iTunesApp.CreatePlaylist(PlaylistName);

var	storeArray = new Array();


var addme=false;
// lastbitrate = tracks.Item(numTracks).BitRate;

while (numTracks != 0)
{
	var	currTrack = tracks.Item(numTracks);
	
	if (currTrack.Kind == ITTrackKindFile)
	{
		//tracklocation= currTrack.Location;
		// currTrack.BitRate
		// currTrack.rating
		
		//currTrack.UpdateInfoFromFile();
		addme=false;

		
		//if (currTrack.BitRate <= tracks.Item(numTracks - 1 ).BitRate)
		//{
		//}
		
		if (currTrack.Location.indexOf(" 1.m") != -1)
		{
			addme=true;
		}
		if (currTrack.Location.indexOf(" 2.m") != -1)
		{
			addme=true;
		}
		if (currTrack.Location.indexOf(" 3.m") != -1)
		{
			addme=true;
		}
		if (currTrack.Location.indexOf(" 4.m") != -1)
		{
			addme=true;
		}
		if (currTrack.Location.indexOf(" 5.m") != -1)
		{
			addme=true;
		}
		
		if (currTrack.Podcast == true)
		{
			addme=false;
		}
		
		/*
		if (currTrack.rating > 0)
		{
			addme=false;
		}
		*/
		
		if (addme)
		{
			OHWPlaylist.AddTrack(currTrack);
			
			key = currTrack.Artist + " - " + currTrack.Album + " - "+ currTrack.Name;
			if ((key != undefined) && (key != ""))
			{
				if (storeArray[key] == undefined)
				{
					storeArray[key] = new Array();
				}
				storeArray[key].push(currTrack);
			}
			
			WScript.Echo (numTracks + ": INF: " + currTrack.Location + " : " + currTrack.BitRate );
			//WScript.Echo (" " +  (numTracks - 1) + tracks.Item(numTracks - 1 ).Location + " : " + tracks.Item(numTracks - 1 ).BitRate );
			//WScript.Echo (" " + (numTracks + 1) + tracks.Item(numTracks + 1 ).Location + " : " + tracks.Item(numTracks + 1 ).BitRate );
		}
		
		if (((numTracks % 1000) == 0))
		{
		// just for info, that script is doing something
		WScript.Echo (numTracks + ": INF: " + currTrack.Artist +" - " + currTrack.Album +" - "+ currTrack.Name);
		}
		
	}
	numTracks--;
	
}
var	numTracks = tracks.Count;
/*
while (numTracks != 0)
{
	var	currTrack = tracks.Item(numTracks);
	
	key = currTrack.Artist + " - " + currTrack.Album + " - "+ currTrack.Name;
	
	if ((key != undefined) && (key != ""))
	{
		if (storeArray[key] == undefined)
		{
			storeArray[key] = new Array();
		}
		else
		storeArray[key].push(currTrack);
	}
			
	for (var artistNameKey in storeArray)
	{
		var trackArray = storeArray[artistNameKey];

		for (var trackArrayKey in trackArray)
		{
			OHWPlaylist2.AddTrack(trackArray[trackArrayKey]);
		}
	}
	
	numTracks--;
	
}	
*/
function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}