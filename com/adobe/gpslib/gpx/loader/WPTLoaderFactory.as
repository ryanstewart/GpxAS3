package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.waypoint.WPTLoader1_0;
	import com.adobe.gpslib.gpx.loader.waypoint.WPTLoader1_1;
	
	public class WPTLoaderFactory
	{
		public function WPTLoaderFactory()
		{
		}
		public static function load(wpt_xml:XML):Waypoint
		{
				var name:String = wpt_xml.name();
				trace(name);
				switch ( name ) 
				{
					case "http://www.topografix.com/GPX/1/1::wpt":
					case "http://www.topografix.com/GPX/1/1::trkpt":
					case "http://www.topografix.com/GPX/1/1::rtept":
						return WPTLoader1_1.load(wpt_xml);
						break;
					case "http://www.topografix.com/GPX/1/0::wpt":
						return WPTLoader1_0.load(wpt_xml);
					default:
						return null;
				}
				
		}
		
		public static function toXMLString(wpt:Waypoint,type:String,ver:Number=1.1) : XML
		{
			switch ( ver )
			{
				case 1.1:
					return WPTLoader1_1.toXMLString(wpt, type);
					break;
				default:
					return null;
			}
		}
	}
}