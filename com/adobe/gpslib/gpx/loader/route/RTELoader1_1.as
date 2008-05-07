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

	}
}