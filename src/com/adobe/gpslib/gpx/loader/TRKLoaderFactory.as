package com.adobe.gpslib.gpx.loader
{
	import com.adobe.gpslib.gpx.Track;
	import com.adobe.gpslib.gpx.loader.track.TRKLoader1_0;
	import com.adobe.gpslib.gpx.loader.track.TRKLoader1_1;

	public class TRKLoaderFactory
	{
		public function TRKLoaderFactory()
		{
		}

		public static function load(trk_xml:XML) : Track
		{
			var name:String = trk_xml.name();
			trace(name);
			switch ( name )
			{
				case "http://www.topografix.com/GPX/1/1::trk":
					return TRKLoader1_1.load(trk_xml);
					break;
				case "http://www.topografix.com/GPX/1/0::trk":
					//return TRKLoader1_0.load(trk_xml);
				default:
					return null;
			}
		}

	}
}