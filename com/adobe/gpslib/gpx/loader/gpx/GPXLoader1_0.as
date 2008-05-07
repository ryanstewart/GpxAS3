package com.adobe.gpslib.gpx.loader.gpx
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.WPTLoaderFactory;
	
	public class GPXLoader1_0
	{
		public function GPXLoader1_0()
		{
		}
		public static function load(xml:XML):GPX
		{
			var gpx:GPX = new GPX();
			namespace gpxNS = "http://www.topografix.com/GPX/1/0";
			use namespace gpxNS;
			var xmlList : XMLList = xml.children();
			gpx.name = xml.name;
			gpx.description = xml.desc;
			gpx.author = xml.author;
			gpx.link = xml.url;
			gpx.linkText = xml.urlname;
			
			// Dealing with Time
			var strTime : String = xml.time;
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
			gpx.keywords = xml.keywords;
			gpx.minLatitude = xml.bounds.@minlat;
			gpx.minLongitude = xml.bounds.@minlon;
			gpx.maxLatitude = xml.bounds.@maxlat;
			gpx.maxLongitude = xml.bounds.@maxlon;
			
			for( var i:Number = 0; i < xmlList.length(); i++ )
			{
				var ln:String = xmlList[i].name();
				if( ln == 'http://www.topografix.com/GPX/1/0::wpt' ) {
					var wpt : Waypoint = WPTLoaderFactory.load(xmlList[i]);
					gpx.arrWaypoints.push(wpt);
				} else if( ln == 'http://www.topografix.com/GPX/1/0::trk' ) {
					//var trk : Track = Track.createTrackFromXML(xmlList[i]);
					//gpx.arrTracks.push(trk);
				} else if( ln == 'http://www.topografix.com/GPX/1/0::rte') {
					//var rte : Route = Route.createRouteFromXML(xmlList[i]);
					//gpx.arrRoutes.push(rte);
				}
			}
			
			return gpx;
				
		}
	}
}