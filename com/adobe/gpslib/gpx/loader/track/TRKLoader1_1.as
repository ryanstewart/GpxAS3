package com.adobe.gpslib.gpx.loader.track
{
	import com.adobe.gpslib.gpx.Track;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.waypoint.WPTLoader1_1;
	
	public class TRKLoader1_1
	{
		public function TRKLoader1_1()
		{
		}

		public static function load(xml:XML) : Track
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			var name : String = xml.name;
			var trackSegment : Array = new Array();
			if( xml.trkseg.children().length() > 0 )
			{
				for( var i:int = 0; i < xml.trkseg.children().length(); i++ )
				{
					var trkpt : Waypoint = WPTLoader1_1.load( xml.trkseg.trkpt[i] );
					trackSegment.push(trkpt);
				}				
			}
			var track : Track = new Track(name, trackSegment);
			track.comment = xml.cmt;
			track.description = xml.desc;
			track.source = xml.src;
			track.link = xml.link;
			track.linkText = xml.link.text;
			track.linkType = xml.link.type;
			track.number = xml.number;
			track.type = xml.type;
			return track;
		}	
	}
}