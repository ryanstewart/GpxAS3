package com.adobe.gpslib.gpx.loader.groundspeak.cache
{
	import com.adobe.gpslib.gpx.groundspeak.Cache;
	import com.adobe.gpslib.gpx.groundspeak.Owner;
	
	public class CacheLoader1_0
	{
		public function CacheLoader1_0()
		{
		}
		
		public static function load(xml:XML):Cache
		{
			namespace geoNS = "http://www.groundspeak.com/cache/1/0";
			use namespace geoNS;
			
			var cache:Cache = new Cache();
			cache.id = xml.@id;
			cache.available = xml.@available;
			cache.archived = xml.@archived;
			cache.name = xml.name;
			cache.placed_by = xml.placed_by;
			cache.owner = new Owner(xml.owner.@id, xml.owner);
			cache.type = xml.type;
			cache.container = xml.container;
			cache.difficulty = xml.difficulty;
			cache.terrain = xml.terrain;
			cache.country = xml.country;
			cache.state = xml.state;
			cache.short_description = xml.short_description;
			cache.long_description = xml.long_description;
			cache.encoded_hints = xml.encoded_hints;
			cache.logs = new Array();
			cache.travelbugs = new Array();
			
			
			
			
			
			return cache;
		}
	}
}