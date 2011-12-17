package com.adobe.gpslib.gpx.loader.route
{
	import com.adobe.gpslib.gpx.Route;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.waypoint.WPTLoader1_1;

	public class RTELoader1_1
	{
		public function RTELoader1_1()
		{
		}

		public static function load(xml:XML) : Route
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;

			var name : String = xml.name;
			var routePoint : Array = new Array();
			if( XMLList(xml.rtept).length() > 0 )
			{
				for( var i:int = 0; i < xml.rtept.length(); i++ )
				{
					var rtept : Waypoint = WPTLoader1_1.load(xml.rtept[i]);
					routePoint.push(rtept);
				}

			}
			var route : Route = new Route(name, routePoint);
			route.comment = xml.cmt;
			route.description = xml.desc;
			route.source = xml.src;
			route.link = xml.link;
			route.linkText = xml.link.text;
			route.linkType = xml.link.type;
			route.number = xml.number;
			route.type = xml.type;
			return route;
		}

		public static function toXMLString(rte:Route) : XML
		{
			var xml : XML = <rte></rte>;
			xml.addNamespace("http://www.topografix.com/GPX/1/1");
			if ( rte.name ) { xml.name = rte.name; }
			if ( rte.comment ) { xml.cmt = rte.comment; }
			if ( rte.description ) { xml.desc = rte.description; }
			if ( rte.source ) { xml.src = rte.source; }
			if ( rte.link ) { xml.link.@href = rte.link; }
			if ( rte.linkText ) { xml.link.text = rte.linkText; }
			if ( rte.linkType ) { xml.link.type = rte.linkType; }
			for ( var i : Number = 0; i < rte.routePoint.length-1; i++ )
			{
				var rtept : Waypoint = rte.routePoint[i] as Waypoint;
				xml.appendChild(WPTLoader1_1.toXMLString(rtept,"rtept"));
			}
			return xml;

		}

	}
}