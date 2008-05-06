package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.loader.gpx.GPXLoader1_1;
	
	public class GPXLoaderFactory
	{
		
			public static function loadGPX(gpx_xml:XML):GPX
			{
				if( gpx_xml.name() == 'http://www.topografix.com/GPX/1/1::gpx' )
				{
					trace('load gpx 1.1');
					return GPXLoader1_1.load(gpx_xml);
				}else if ( gpx_xml.name() == 'http://www.topografix.com/GPX/1/0::gpx' )
				{
					trace('load gpx 1.0');
					return null;
				}else
				{
					trace('fuck off this is not gpx data');
					return null;
				}
			}
		

	}
}