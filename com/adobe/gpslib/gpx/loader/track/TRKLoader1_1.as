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
		
		public static function toXMLString(trk:Track) : XML
		{
			var xml : XML = <trk></trk>;
			xml.addNamespace("http://www.topografix.com/GPX/1/1");
			if ( trk.name ) { xml.name = trk.name; }
			if ( trk.comment ) { xml.cmt = trk.comment; }
			if ( trk.description ) { xml.desc = trk.description; }
			if ( trk.source ) { xml.src = trk.source; }
			if ( trk.link ) { xml.link.@href = trk.link; }
			if ( trk.linkText ) { xml.link.text = trk.linkText; }
			if ( trk.linkType ) { xml.link.type = trk.linkType; }
			xml.trkseg = <trkseg></trkseg>;
			for ( var i : Number = 0; i < trk.trackSegment.length-1; i++ )
			{
				var trkpt : Waypoint = trk.trackSegment[i] as Waypoint;				
				xml.trkseg.appendChild(WPTLoader1_1.toXMLString(trkpt,"trkpt"));
			}
			return xml;
			
		}	
	}
}