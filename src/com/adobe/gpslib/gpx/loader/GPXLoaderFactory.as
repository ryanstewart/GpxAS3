package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.loader.gpx.GPXLoader1_0;
	import com.adobe.gpslib.gpx.loader.gpx.GPXLoader1_1;

	import flash.events.EventDispatcher;

	public class GPXLoaderFactory extends EventDispatcher
	{

			public function loadGPX(gpx_xml:XML) : GPX
			{
				var gpx:GPX;
				var name:String = gpx_xml.name();
				if( name == 'http://www.topografix.com/GPX/1/1::gpx' )
				{
					var gpxLoader1_1 : GPXLoader1_1 = new GPXLoader1_1();
					gpx = gpxLoader1_1.load(gpx_xml);

				}else if ( name == 'http://www.topografix.com/GPX/1/0::gpx' )
				{
					var gpxLoader1_0 : GPXLoader1_0 = new GPXLoader1_0();
					gpx = gpxLoader1_0.load(gpx_xml);
				}else
				{
					trace('bugger off this is not gpx data');
					gpx = null;
				}
				return gpx
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