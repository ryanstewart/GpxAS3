package com.adobe.gpslib.gpx.loader.gpx
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.WPTLoaderFactory;
	
	public class GPXLoader1_1
	{
		public function GPXLoader1_1()
		{
		}

		public static function load(xml:XML):GPX
		{
			var gpx:GPX = new GPX();
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			var xmlList : XMLList = xml.children();
			gpx.name = xml.metadata.name;
			gpx.description = xml.metadata.desc;
			gpx.author = xml.metadata.author;
			gpx.link = xml.metadata.link.@href;
			gpx.linkText = xml.metadata.link.text;
			gpx.linkType = xml.metadata.link.type;
			// Dealing with Time
			var strTime : String = xml.metadata.time;
			var year : Number = Number(strTime.substring(0,4));
			var month : Number = Number(strTime.substring(5,7));
			var day : Number = Number(strTime.substring(8,10));
			var hours : Number = Number(strTime.substring(11,13));
			var minutes : Number = Number(strTime.substring(14,16));
			var seconds : Number = Number(strTime.substring(17,19));
			if( strTime != "" )
			{
				gpx.time = new Date();
				gpx.time.setUTCFullYear(year, month, day);
				gpx.time.setUTCHours(hours, minutes, seconds);
			}
			// End of Time Logic
			gpx.keywords = xml.metadata.keywords;
			gpx.minLatitude = xml.metadata.bounds.@minlat;
			gpx.minLongitude = xml.metadata.bounds.@minlon;
			gpx.maxLatitude = xml.metadata.bounds.@maxlat;
			gpx.maxLongitude = xml.metadata.bounds.@maxlon;
		
			for( var i:Number = 0; i < xmlList.length(); i++ )
			{
				if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::wpt' ) {
					var wpt : Waypoint = WPTLoaderFactory.load(xmlList[i]);
					gpx.arrWaypoints.push(wpt);
				} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::trk' ) {
					//var trk : Track = Track.createTrackFromXML(xmlList[i]);
					//gpx.arrTracks.push(trk);
				} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::rte') {
					//var rte : Route = Route.createRouteFromXML(xmlList[i]);
					//gpx.arrRoutes.push(rte);
				}
			}
			
			return gpx;
				
		}
	}
}