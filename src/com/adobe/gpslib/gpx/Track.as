package com.adobe.gpslib.gpx
{


	public class Track
	{
		private var _name : String;
		private var _comment : String; //<cmt>
		private var _description : String; //<description>
		private var _source : String; //<src>
		private var _link : String;
		private var _linkText : String;
		private var _linkType : String;
		private var _number : Number; // track number?
		private var _type : String;
		private var _trackSegment : Array; // Array of Track Points (waypoints)

		public function Track(name:String, trackSegment : Array)
		{
			this._name = name;
			this._trackSegment = trackSegment;
		}

		/*******
		 * Getters and Setters
		 **/

		/* Name */
		public function set name (value:String) : void { this._name = value; }
		public function get name () : String { return this._name; }

		/* Comment */
		public function set comment (value:String) : void { this._comment = value; }
		public function get comment () : String { return this._comment; }

		/* Description */
		public function set description (value:String) : void { this._description = value; }
		public function get description () : String { return this._description; }

		/* Source */
		public function set source (value:String) : void { this._source = value; }
		public function get source () : String { return this._source; }

		/* Url */
		public function set link (value:String) : void { this._link = value; }
		public function get link () : String { return this._link; }

		/* UrlName */
		public function set linkText (value:String) : void { this._linkText = value; }
		public function get linkText () : String { return this._linkText; }

		/* Link Type */
		public function set linkType (value:String) : void { this._linkType = value; }
		public function get linkType () : String { return this._linkType; }

		/* Track Number? */
		public function set number (value:Number) : void { this._number = value; }
		public function get number () : Number { return this._number; }

		/* Track Type */
		public function set type (value:String) : void {this._type = value; }
		public function get type () : String { return this._type; }

		/* Track Segments */
		public function set trackSegment(value:Array) : void { this._trackSegment = value; }
		public function get trackSegment() : Array { return this._trackSegment; }

		public function appendTrackSegment( trk : Track ) : void
		{

		}
	}
}