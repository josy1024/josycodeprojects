/*    
	 File: searchtrack.js
	 
	modified by: josy1024 http://code.google.com/u/josy1024/
	feature: search a track objects by name
	codebase: http://code.google.com/p/josycodeprojects/
	
*/


var	iTunesApp = WScript.CreateObject("iTunes.Application");
var	mainLibrary = iTunesApp.LibraryPlaylist;
var	mainLibrarySource = iTunesApp.LibrarySource;


var numPlaylistsCreated = 0;
var	i;

// FIXME take a -v parameter eventually
var verbose = false;

var searchText = "Paranoid ";
var searchFields = 0;

/*
ITPlaylistSearchFieldAll  (0) Search all fields of each track.  
ITPlaylistSearchFieldVisible  (1) Search only the fields with columns that are currently visible in the display for the playlist. 
Note that song name, artist, album, and composer will always be searched, even if these columns are not visible.  
ITPlaylistSearchFieldArtists  (2) Search only the artist field of each track (IITTrack::Artist).  
ITPlaylistSearchFieldAlbums  (3) Search only the album field of each track (IITTrack::Album).  
ITPlaylistSearchFieldComposers  (4) Search only the composer field of each track (IITTrack::Composer).  
ITPlaylistSearchFieldSongNames  (5) Search only the song name field of each track (IITTrack::Name).  

*/
// var	tracks = mainLibrary.Tracks;
var tracks = mainLibrary.Search(searchText,searchFields);
var	numTracks = tracks.Count;


// first, make an array indexed by album name
var	albumArray = new Array();

for (i = 1; i <= numTracks; i++)
{
	var	currTrack = tracks.Item(i);
	
	// var	album = currTrack.Album;
	
	WScript.Echo (i + ": INF: " + currTrack.Artist +" - " + currTrack.Album +" - "+ currTrack.Name);
	
}