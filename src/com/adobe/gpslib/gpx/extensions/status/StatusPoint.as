package com.adobe.gpslib.gpx.extensions.status
{
	
	public class StatusPoint
	{
		private var _createdAt : Date;
		private var _id : Number;
		private var _text : String;
		private var _source : String; // link
		private var _userId : Number;
		private var _userName : String;
		
		private var _thisNamespace : String = "http://www.digitalbackcountry.com/StatusPoint/1/0";
		
		public function StatusPoint( text:String )
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
		
		public function set userId (value:Number) : void { _userId = value; }
		public function get userId () : Number { return _userId; }

		public function set userName (value:String) : void { _userName = value; }
		public function get userName () : String { return _userName; }
		
		public function get thisNamespace () : String { return _thisNamespace; }
	}
}