package com.adobe.gpslib.gpx.loader.groundspeak
{
	import com.adobe.gpslib.gpx.groundspeak.Cache;
	import com.adobe.gpslib.gpx.loader.groundspeak.cache.CacheLoader1_0;
	
	public class CacheLoaderFactory
	{
			
		public static function load(cache_xml:XML):Cache
		{
			var name:String = cache_xml.name();
			if( name == 'http://www.groundspeak.com/cache/1/0::cache' )
			{
				return CacheLoader1_0.load(cache_xml);
			}else{
				trace('Library not set up for ' + name + " version files" );
				return null;
			}
		}
		
	}
}