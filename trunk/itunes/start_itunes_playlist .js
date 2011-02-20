// SOURCE: http://discussions.apple.com/thread.jspa?threadID=1907539
// ALSO INTERESTING: http://mysite.verizon.net/teridon/itunesscripts/

var PlaylistName="playlist name";


// You do not need to edit below this Line!
var iTunesApp = WScript.CreateObject("iTunes.Application");
var volume=iTunesApp.SoundVolume;

//WScript.Echo (volume);

var LibraryName=iTunesApp.LibraryPlaylist.Name; // The Library Name differs from Language to Language
var Playlist=iTunesApp.Sources.ItemByName(LibraryName).Playlists.ItemByName(PlaylistName);


// Set Mute and Play the Playlist
iTunesApp.SoundVolume=0;
Playlist.PlayFirstTrack();

if (Playlist.Shuffle==1) // If Shuffle is On, then Shuffle Playlist again
{
	Playlist.Shuffle=0;
	Playlist.Shuffle=1;

	/* After Shuffeling the first track will still be the old one (because its playling silently
	so:
	Play Next Track 
	*/
	iTunesApp.NextTrack();
	
	// josy: I've inserted a second nexttrack to always give another track if you start the file
	iTunesApp.NextTrack();
}

// set Volume back to normal and Play. Well i guess its allready playling but it doesnt hurt 
iTunesApp.SoundVolume=volume
// iTunesApp.SoundVolume=100
iTunesApp.Play(); 

/*
For more Documentation you can see this link:
http://cnx.com/iTunes.pp
I have found it very helpfull!
Mind the Get and Set Functions: you can just call them without Set_ and Get_
it is just documented that you can letssay
var g=Playlist.Shuffle;
wich will then put a value in g if your shuffle is on or not
you can just set the value in defining it, as it seems to me:

Playlist.Shuffle=1

Volume takes integers from 0 to 100

Interesting should be the part about:
procedure BackTrack; safecall;
procedure FastForward; safecall;
procedure NextTrack; safecall;
procedure Pause; safecall;
procedure Play; safecall;
procedure PlayFile(const filePath: WideString); safecall;
procedure PlayPause; safecall;
procedure PreviousTrack; safecall;
procedure Resume; safecall;
procedure Rewind; safecall;
procedure Stop; safecall;
although i have not yet tried all of those.

Thank you very much again for your Help!
*/ 