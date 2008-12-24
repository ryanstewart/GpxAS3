package com.adobe.gpslib.gpx.groundspeak
{
	public class Cache
	{
		// groundspeak:cache attributes
		public var id:String;
		public var available:String;
		public var archived:String;
		
		//groundspeak:cache nodes
		public var name:String;
		public var placed_by:String;
		public var owner:Owner;
		public var type:String;
		public var container:String;
		public var difficulty:String;
		public var terrain:String;
		public var country:String;
		public var state:String;
		public var short_description:String;
		public var long_description:String;
		public var encoded_hints:String;
		
		public var logs:Array; //Array of cache logs
		public var travelbugs:Array; //Array of travel bug objects
		
		
		
		public function Cache()
		{
		}

	}
}