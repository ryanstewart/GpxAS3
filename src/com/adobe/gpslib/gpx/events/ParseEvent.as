package com.adobe.gpslib.gpx.events
{
	import com.adobe.gpslib.GPX;

	import flash.events.Event;

	public class ParseEvent extends Event
	{
		public static const PARSE_COMPLETE : String = "parseComplete";

		public function ParseEvent(type:String, gpx:GPX,
									bubbles:Boolean=true,
									cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.gpx = gpx;
		}

		public var gpx : GPX;

		override public function clone() : Event
		{
			return new ParseEvent(type, gpx, bubbles, cancelable);
		}
	}
}