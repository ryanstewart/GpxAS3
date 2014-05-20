package com.adobe.gpslib.gpx.loader.waypoint
{
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.extensions.loader.EXTLoader1_1;
	import com.adobe.gpslib.gpx.waypoint.GpsFix;
	import com.adobe.utils.DateUtil;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class WPTLoader1_1 extends EventDispatcher
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
			//var e : Event = new Event('gpxLoad');
			//dispatchEvent('gpxLoad');
			return waypoint;
		}

		public static function toXMLString(wpt:Waypoint,type:String) : XML
		{
			var pt:XML;
			switch(type) {
				case "trkpt":
					pt = <trkpt></trkpt>;
					break;
				case "rtept":
					pt = <rtept></rtept>;
					break;
				default:
					pt = <wpt></wpt>;
			}


			pt.addNamespace("http://www.topografix.com/GPX/1/1");
			pt.@lat = wpt.latitude;
			pt.@lon = wpt.longitude;
			if ( wpt.elevation ) { pt.ele = wpt.elevation; }
			if ( wpt.time ) { pt.time = wpt.time; }
			if ( wpt.magneticVariation ) { pt.magvar = wpt.magneticVariation; }
			if ( wpt.geoIdHeight ) { pt.geoidheight = wpt.geoIdHeight; }
			if ( wpt.name ) { pt.name = wpt.name; }
			if ( wpt.comment ) { pt.cmt = wpt.comment; }
			if ( wpt.description ) { pt.desc = wpt.description; }
			if ( wpt.source ) { pt.src = wpt.source; }
			if ( wpt.link ) { pt.link = wpt.link; }
			if ( wpt.linkText ) { pt.link.text = wpt.linkText; }
			if ( wpt.linkType ) { pt.link.type = wpt.linkType; }
			if ( wpt.symbol ) { pt.sym = wpt.symbol; }
			if ( wpt.type ) { pt.type  = wpt.type; }
			if ( wpt.fix ) { pt.fix = wpt.fix; }
			if ( wpt.satelliteNum ) { pt.sat = wpt.satelliteNum; }
			if ( wpt.hdop ) { pt.hdop = wpt.hdop; }
			if ( wpt.vdop ) { pt.vdop = wpt.vdop; }
			if ( wpt.pdop ) { pt.pdop = wpt.pdop; }
			if ( wpt.ageOfGpsData ) { pt.ageofgpsdata = wpt.ageOfGpsData; }
			if ( wpt.dgpsid ) { pt.dgpsid = wpt.dgpsid; }
			//if ( wpt.extensions.length != 0 ) { pt.extensions = EXTLoader1_1.toXMLString(wpt.extensions); }
			return pt;
		}
	}
}