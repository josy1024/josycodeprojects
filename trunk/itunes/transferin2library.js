/* 
    modified by: josy1024 http://code.google.com/u/josy1024/
    feature: transfers files referring out of libary to libary folder ...
    codebase: http://code.google.com/p/josycodeprojects/

'  $URL$
'  $Author$
'  $Rev$ 
'  $LastChangedDate$

	
usage: run and then cleanup with deleteme.cmd  

script //NOLOGO transferin2library.js > deleteme.cmd
deleteme.cmd

*/ 


var ITTrackKindFile	= 1;
var	iTunesApp = WScript.CreateObject("iTunes.Application");
var	movedTracks = 0;
var	mainLibrary = iTunesApp.LibraryPlaylist;
var	tracks = mainLibrary.Tracks;
var	numTracks = tracks.Count;
var tracklocation = "";
var trackexclude = "E:\\STORE\\AUDIO\\"
var aboveratingupdate = 1;
var rating = "";

var sizesum = 0;

var	i;

while (numTracks != 0)
{
	var	currTrack = tracks.Item(numTracks);
	
	// is this a file track?
	if (currTrack.Kind == ITTrackKindFile)
	{
		// yes, does it have an empty location?
		// (remove dead tracks)
		if (currTrack.Location == "")
		{
		}
		else
		{
			tracklocation= currTrack.Location;
			
			if (String(trackexclude).length < String(tracklocation).length) 
			{
				if (trackexclude == Left(tracklocation, String(trackexclude).length))
				{
					//tracklocation = "";
				}
				else
				{
					// if track not in store (trackexclude)
					// tracklocation = "; " + tracklocation
					
					try
					{
						var sizetrack = currTrack.size / 1024 / 1024;
						sizesum += sizetrack;
						var erg = mainLibrary.AddFile(tracklocation);

						WScript.Echo ( "del /Q /S \"" + tracklocation + "\"" );
						movedTracks++;
					}
					catch(err)
					{
						WScript.Echo ( err.number + err.description );
					}

				}
				
			}

			
		}
		
		/*
		if (((numTracks % 1000) == 0) && (tracklocation != ""))
		{
		// just for info, that script is doing something
		WScript.Echo (numTracks + ": INF: " + currTrack.Artist +" - " + currTrack.Album +" - "+ currTrack.Name);
		}
		*/
		
	}
	numTracks--;

}

if (movedTracks > 0)
{
	if (movedTracks == 1)
	{
		WScript.Echo("Moved 1 track. Size (MB): " + sizesum);
	}
	else
	{
		WScript.Echo("Moved " + movedTracks + " tracks. Size (MB): " + sizesum);
	}
}
else
{
	WScript.Echo("No tracks out of Libary found!");
}

function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}