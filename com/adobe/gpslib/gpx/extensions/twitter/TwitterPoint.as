package com.adobe.gpslib.gpx.extensions.twitter
{
	
	public class TwitterPoint
	{
		private var _createdAt : Date;
		private var _id : Number;
		private var _text : String;
		private var _source : String;
		private var _truncated : Boolean;
		private var _inReplyToStatusId : Number;
		private var _inReplyToUserId : String;
		private var _favorited : String;
		private var _userId : Number;
		private var _userName : String;
		private var _userScreenName : String;
		private var _userLocation : String;
		
		private var _thisNamespace : String = "http://www.digitalbackcountry.com/TwitterPoint/1/0";
		
		public function TwitterPoint( text:String )
		{
			this.text = text;
		}

		public function set createdAt (value:Date) : void { _createdAt = value; }
		public function get createdAt () : Date { return _createdAt; }

		public function set id (value:Number) : void { _id = value; }
		public function get id () : Number { return _id; }

		public function set text (value:String) : void { _text = value; }
		public function get text () : String { return _text; }
		
		public function set source (value:String) : void { _source = value; }
		public function get source () : String { return _source; }
		
		public function set truncated (value:Boolean) : void { _truncated = value; }
		public function get truncated () : Boolean { return _truncated; }
		
		public function set inReplyToStatusId (value:Number) : void { _inReplyToStatusId = value; }
		public function get inReplyToStatusId () : Number { return _inReplyToStatusId; }
		
		public function set inReplyToUserId (value:String) : void { _inReplyToUserId = value; }
		public function get inReplyToUserId () : String { return _inReplyToUserId; }
		
		public function set favorited (value:String) : void { _favorited = value; }
		public function get favorited () : String { return _favorited; }
		
		public function set userId (value:Number) : void { _userId = value; }
		public function get userId () : Number { return _userId; }

		public function set userName (value:String) : void { _userName = value; }
		public function get userName () : String { return _userName; }

		public function set userScreenName (value:String) : void { _userScreenName = value; }
		public function get userScreenName () : String { return _userScreenName; }

		public function set userLocation (value:String) : void { _userLocation = value; }
		public function get userLocation () : String { return _userLocation; }
		
		public function get thisNamespace () : String { return _thisNamespace; }
	}
}