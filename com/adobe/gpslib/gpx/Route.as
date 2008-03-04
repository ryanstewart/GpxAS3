package com.adobe.gpslib.gpx
{
	
	
	public class Route
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
		private var _routePoint : Array; // Array of Track Points (waypoints)

		public function Route(name:String, routePoint : Array)
		{
			this.name = name;
			this.routePoint = routePoint;	
		}
		
		/*******
		 * Getters and Setters
		 **/
		
		/* Name */
		
		public function set name (value:String) : void
		{
			this._name = value;
		}
		
		public function get name () : String
		{
			return this._name;
		}
		
		/* Comment */
		
		public function set comment (value:String) : void
		{
			this._comment = value;
		}
		
		public function get comment () : String
		{
			return this._comment;
		}
		
		/* Description */
		
		public function set description (value:String) : void
		{
			this._description = value;
		}
		
		public function get description () : String
		{
			return this._description;
		}
		
		/* Source */
		
		public function set source (value:String) : void
		{
			this._source = value;
		}
		
		public function get source () : String
		{
			return this._source;
		}
		
		/* Url */
		
		public function set link (value:String) : void
		{
			this._link = value;
		}
		
		public function get link () : String
		{
			return this._link;
		}
		
		/* UrlName */
		
		public function set linkText (value:String) : void
		{
			this._linkText = value;
		}
		
		public function get linkText () : String
		{
			return this._linkText;
		}
		
		/* Link Type */
		public function set linkType (value:String) : void
		{
			this._linkType = value;
		}
		
		public function get linkType () : String
		{
			return this._linkType;
		}
		
		/* Route Number? */
		public function set number (value:Number) : void
		{
			this._number = value;
		}	
		
		public function get number () : Number
		{
			return this._number;
		}
		
		/* Type */
		public function set type (value:String) : void
		{
			this._type = value;
		}
		
		public function get type () : String
		{
			return this._type;
		}
		
		/* Route Point */
		public function set routePoint (value:Array) : void
		{
			this._routePoint = value;
		}
		
		public function get routePoint () : Array
		{
			return this._routePoint;
		}

		/*****
		 * Helper Functions
		 *****/

		public static function createRouteFromXML( xml:XML ) : Route
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			if( xml.name() == 'http://www.topografix.com/GPX/1/1::rte' )
			{
				var name : String = xml.name;
				var routePoint : Array = getRoutePoints(xml.children());
				return new Route(name, routePoint);
			} else {
				return null;
			}
		}
		
		public static function getRoutePoints( xmlList:XMLList ) : Array
		{
			var routePoint : Array = new Array();
			for( var i:Number = 0; i < xmlList.length(); i++ )
			{
				if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::rtept' ) {
					var wpt : Waypoint = Waypoint.createWaypointFromXML(xmlList[i]);
					routePoint.push(wpt);
				}
			}
			
			return routePoint;				
		}
		
		public function createXmlRoute() : XML
		{
			var rte : XML = <rte></rte>;
			rte.addNamespace("http://www.topografix.com/GPX/1/1");
			if ( this.name ) { rte.name = this.name; }
			if ( this.comment ) { rte.cmt = this.comment; }
			if ( this.description ) { rte.desc = this.description; }
			if ( this.source ) { rte.src = this.source; }
			if ( this.link ) { rte.link.@href = this.link; }
			if ( this.linkText ) { rte.link.text = this.linkText; }
			if ( this.linkType ) { rte.link.type = this.linkType; }
			for ( var i : Number = 0; i < this.routePoint.length-1; i++ )
			{
				var rtept : Waypoint = this.routePoint[i] as Waypoint;				
				rte.appendChild(rtept.createXMLWaypoint("rtept"));
			}
			return rte;
			
		}

	}
}