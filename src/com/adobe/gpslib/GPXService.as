package com.adobe.gpslib
{
	import com.adobe.gpslib.gpx.events.ParseEvent;
	import com.adobe.gpslib.gpx.loader.GPXLoaderFactory;
	
	import flash.events.EventDispatcher;
	
	[Event(name="parseComplete", type="com.adobe.gpslib.gpx.events.ParseEvent")]
	public class GPXService extends EventDispatcher
	{
		public function GPXService()
		{
		}
		
		public function load(gpx_xml:XML) : void
		{
			var gpxLoader : GPXLoaderFactory = new GPXLoaderFactory();
			var gpx : GPX =  gpxLoader.loadGPX(gpx_xml);
			var e : ParseEvent = new ParseEvent(ParseEvent.PARSE_COMPLETE, gpx);
			dispatchEvent(e);
		}
		
	}
}