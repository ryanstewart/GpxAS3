package com.adobe.gpslib.gpx.loader.waypoint
{
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.waypoint.GpsFix;
	import com.adobe.utils.DateUtil;
	
	public class WPTLoader1_1
	{
		public function WPTLoader1_1()
		{
		}
		public static function load(xml:XML):Waypoint
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			var lat : Number = xml.@lat;
			var lon : Number = xml.@lon;
			var waypoint : Waypoint = new Waypoint(lat, lon);
			waypoint.elevation = xml.ele;
			var strTime : String = xml.time;
			if( strTime != "" ) { waypoint.time = DateUtil.parseW3CDTF(strTime); }
			waypoint.magneticVariation = xml.magvar;
			waypoint.geoIdHeight = xml.geoidheight;
			waypoint.name = xml.name;
			waypoint.comment = xml.cmt;
			waypoint.description = xml.desc;
			waypoint.link = xml.link;
			waypoint.linkText = xml.link.text;
			waypoint.linkType = xml.link.type;
			waypoint.symbol = xml.sym;
			waypoint.type = xml.type;
			waypoint.fix = xml.fix as GpsFix;
			waypoint.satelliteNum = xml.sat;
			waypoint.hdop = xml.hdop;
			waypoint.vdop = xml.vdop;
			waypoint.pdop = xml.pdop;
			waypoint.ageOfGpsData = xml.ageofgpsdata;
			waypoint.dgpsid = xml.dgpsid;
			return waypoint;
		}
	}
}