package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.loader.gpx.GPXLoader1_0;
	import com.adobe.gpslib.gpx.loader.gpx.GPXLoader1_1;
	
	import flash.events.Event;
	
	public class GPXLoaderFactory
	{
		
			public static function loadGPX(gpx_xml:XML):GPX
			{
				var name:String = gpx_xml.name();
				if( name == 'http://www.topografix.com/GPX/1/1::gpx' )
				{
					return GPXLoader1_1.load(gpx_xml);
				}else if ( name == 'http://www.topografix.com/GPX/1/0::gpx' )
				{
					return GPXLoader1_0.load(gpx_xml);
				}else
				{
					trace('bugger off this is not gpx data');
					return null;
				}
			}
			
			public static function toXMLString(gpx:GPX,ver:Number=1.1) : XML
			{
				switch ( ver )
				{
					case 1.1:
						return GPXLoader1_1.toXMLString(gpx);
						break;
					default:
						return null;
				}				
			}
		

	}
}