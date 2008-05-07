package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.gpx.Route;
	import com.adobe.gpslib.gpx.loader.route.RTELoader1_0;
	import com.adobe.gpslib.gpx.loader.route.RTELoader1_1;	
	
	public class RTELoaderFactory
	{
		public function RTELoaderFactory()
		{
		}
		
		public static function load(rte_xml:XML) : Route
		{
			var name:String = rte_xml.name();
			trace(name);
			switch ( name ) 
			{
				case "http://www.topografix.com/GPX/1/1::rte":
					return RTELoader1_1.load(rte_xml);
					break;
				case "http://www.topografix.com/GPX/1/0::rte":
					//return RTELoader1_0.load(rte_xml);
				default:
					return null;
			}			
		}

	}
}