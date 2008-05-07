package com.adobe.gpslib.gpx.loader.waypoint
{
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.groundspeak.CacheLoaderFactory;
	import com.adobe.gpslib.gpx.waypoint.GpsFix;
	
	public class WPTLoader1_0
	{
		public function WPTLoader1_0()
		{
		}
		public static function load(xml:XML):Waypoint
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/0";
			use namespace gpxNS;
			
			var lat : Number = xml.@lat;
			var lon : Number = xml.@lon;
			var waypoint : Waypoint = new Waypoint(lat, lon);
			waypoint.elevation = xml.ele;
			var strTime : String = xml.time;
			var year : Number = Number(strTime.substring(0,4));
				var month : Number = Number(strTime.substring(5,7));
				var day : Number = Number(strTime.substring(8,10));
				var hours : Number = Number(strTime.substring(11,13));
				var minutes : Number = Number(strTime.substring(14,16));
				var seconds : Number = Number(strTime.substring(17,19));
				if( strTime != "" )
				{
					waypoint.time = new Date();
					waypoint.time.setUTCFullYear(year, month, day);
					waypoint.time.setUTCHours(hours, minutes, seconds);
					
				}
			
			waypoint.magneticVariation = xml.magvar;
			waypoint.geoIdHeight = xml.geoidheight;
			waypoint.name = xml.name;
			waypoint.comment = xml.cmt;
			waypoint.description = xml.desc;
			waypoint.source = xml.src;
			waypoint.link = xml.url;
			waypoint.linkText = xml.urlname;
			waypoint.symbol = xml.sym;
			waypoint.type = xml.type;
			waypoint.fix = xml.fix as GpsFix;
			waypoint.satelliteNum = xml.sat;
			waypoint.hdop = xml.hdop;
			waypoint.vdop = xml.vdop;
			waypoint.pdop = xml.pdop;
			waypoint.ageOfGpsData = xml.ageofdgpsdata;
			waypoint.dgpsid = xml.dgpsid;
			
			namespace geoNS = "http://www.groundspeak.com/cache/1/0";
			use namespace geoNS;
			if ( xml.cache.length() != 0 )
			{
				waypoint.cache = CacheLoaderFactory.load(xml.cache[0]);
			}
			
			return waypoint;
		}
	}
}