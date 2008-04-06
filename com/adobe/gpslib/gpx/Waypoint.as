package com.adobe.gpslib.gpx
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.waypoint.GpsFix;
	import com.adobe.utils.DateUtil;
	
	[Bindable]
	public class Waypoint
	{	
		
		private var _latitude : Number; // <lat>
		private var _longitude : Number; // <lon>
		private var _elevation : Number; // <ele>
		private var _time : Date; // should be time.
		private var _magneticVariation : Number;
		private var _geoIdHeight : Number;
		private var _name : String; 
		private var _comment : String; // <cmt>
		private var _description : String; // <desc>
		private var _source : String; //<src>
		private var _link : String; // <url>
		private var _linkText : String; //<urlname>
		private var _linkType : String;
		private var _symbol : String; // <sym>
		private var _type : String; //<type>
		private var _fix : GpsFix; // <fix>
		private var _satelliteNum : Number; // <sat>
		private var _hdop : Number; // Horizontal dilution of precision.
		private var _vdop : Number; // Vertical dilution of precision.
		private var _pdop : Number; // Position dilution of precision.
		private var _ageOfGpsData : Number; //should be time
		private var _dgpsid : Number; // DGPS station ID

		/**
		 * 
		 * 
		 **/
		
		public function Waypoint(lat : Number, lon : Number)
		{
			this.latitude = lat;
			this.longitude = lon;
		}
		
		/*********************************************
		 * 	GETTERS AND SETTERS
		 **/
		 
		/* Latitude */		
		public function set latitude (value:Number) : void { _latitude = value; }
		public function get latitude () : Number { return _latitude; }
		
		/* Longitude */		
		public function set longitude (value:Number) : void { _longitude = value; }
		public function get longitude () : Number { return this._longitude; }

		/*  Elevation */ 
		public function set elevation (value:Number) : void { _elevation = value; }
		public function get elevation () : Number { return _elevation; }
		
		/* Time */	
		public function set time (value:Date) : void { _time = value; }
		public function get time () : Date { return _time; }
		
		/* Magnetic Variation */
		public function set magneticVariation (value:Number) : void { _magneticVariation = value; }
		public function get magneticVariation () : Number { return _magneticVariation; }
		
		/* Geoid height */
		public function set geoIdHeight (value:Number) : void { _geoIdHeight = value; }
		public function get geoIdHeight () : Number { return _geoIdHeight; }
		
		/* Name */
		public function set name (value:String) : void { _name = value; }
		public function get name () : String { return _name; }
		
		/* Comment */
		public function set comment (value:String) : void { _comment = value; }
		public function get comment () : String { return _comment; }
		
		/* Description */
		
		public function set description (value:String) : void { _description = value; }
		public function get description () : String { return _description; }
		
		/* Source */
		public function set source (value:String) : void { _source = value; }
		public function get source () : String { return _source; }
		
		/* URL */
		public function set link (value:String) : void { _link = value; }
		public function get link () : String { return _link; }
		
		/* URL Name */
		public function set linkText (value:String) : void { _linkText = value; }
		public function get linkText () : String { return _linkText; }

		/* Link Type */
		public function set linkType (value:String) : void { _linkType = value; }
		public function get linkType () : String { return _linkType; }
		
		/* Symbol */
		public function set symbol (value:String) : void { _symbol = value; }
		public function get symbol () : String { return _symbol; }
		
		/* Type */
		public function set type (value:String) : void { _type = type;}
		public function get type () : String { return _type; }
		
		/* GPX Fix */
		public function set fix (value:GpsFix) : void { _fix = value; }
		public function get fix () : GpsFix { /* TODO: See what to return here */ return _fix; }

		/* Satellite Number */
		public function set satelliteNum (value:Number) : void { _satelliteNum = value; }
		public function get satelliteNum () : Number { return _satelliteNum; }
		
		/* Horizontal Dilution of precision */
		public function set hdop (value:Number) : void { _hdop = value; }
		public function get hdop () : Number { return _hdop; }
		
		/* Vertical Dilution of precision */
		public function set vdop(value:Number) : void { _vdop = value; }
		public function get vdop () : Number { return _vdop; }
		
		/* Position Dilution of precision */
		public function set pdop (value:Number) : void { _pdop = value; }
		public function get pdop () : Number { return _pdop; }
		
		/* Age of GPS Data */
		public function set ageOfGpsData (value:Number) : void { _ageOfGpsData = value; }
		public function get ageOfGpsData () : Number { return _ageOfGpsData; }
		
		/* ID of DGPS station */
		public function set dgpsid (value:Number) : void { _dgpsid = value; }
		public function get dgpsid () : Number { return _dgpsid; }
		
		
		/**
		 * createWaypointFroXML takes an XML variable and createsa Waypoint Object
		 * 
		 **/
	
		public static function createWaypointFromXML(xml:XML) : Waypoint
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			if (xml.name() == "http://www.topografix.com/GPX/1/1::wpt" || xml.name() == 'http://www.topografix.com/GPX/1/1::trkpt' || xml.name() == 'http://www.topografix.com/GPX/1/1::rtept')
			{
				var lat : Number = xml.@lat;
				var lon : Number = xml.@lon;
				var waypoint : Waypoint = new Waypoint(lat, lon);
				waypoint.elevation = xml.ele;
				var strTime : String = xml.time;
				if( strTime != "" ) { waypoint.time = DateUtil.parseW3CDTF(strTime); }
				/*
				var year : Number = Number(strTime.substring(0,4));
				var month : Number = Number(strTime.substring(5,7));
				var day : Number = Number(strTime.substring(8,10));
				var hours : Number = Number(strTime.substring(11,13));
				var minutes : Number = Number(strTime.substring(14,16));
				var seconds : Number = Number(strTime.substring(17,19));
				if( strTime != "" )
				{
					waypoint.time = new Date();
					waypoint.time.setUTCFullYear(year, month, day);
					waypoint.time.setUTCHours(hours, minutes, seconds);
					
				}
				*/
				waypoint.magneticVariation = xml.magvar;
				waypoint.geoIdHeight = xml.geoidheight;
				waypoint.name = xml.name;
				waypoint.comment = xml.cmt;
				waypoint.description = xml.desc;
				waypoint.link = xml.link;
				waypoint.linkText = xml.link.text;
				waypoint.linkType = xml.link.type;
				waypoint.symbol = xml.sym;
				waypoint.type = xml.type;
				waypoint.fix = xml.fix as GpsFix;
				waypoint.satelliteNum = xml.sat;
				waypoint.hdop = xml.hdop;
				waypoint.vdop = xml.vdop;
				waypoint.pdop = xml.pdop;
				waypoint.ageOfGpsData = xml.ageofgpsdata;
				waypoint.dgpsid = xml.dgpsid;
				return waypoint;
			} else {
				return null;
			}
		}

		/**
		 * createXMLWaypoint
		 * 
		 **/
		 
		public function createXMLWaypoint(type:String = "wpt") : XML
		{
			var pt:XML;
			switch(type) {
				case "trkpt":
					pt = <trkpt></trkpt>;
					break;
				case "rtept":
					pt = <rtept></rtept>;
					break;
				default:
					pt = <wpt></wpt>;
			}
			
			
			pt.addNamespace("http://www.topografix.com/GPX/1/1");
			pt.@lat = this.latitude;
			pt.@lon = this.longitude;
			if ( this.elevation ) { pt.ele = this.elevation; }
			if ( this.time ) { pt.time = this.time; }
			if ( this.magneticVariation ) { pt.magvar = this.magneticVariation; }
			if ( this.geoIdHeight ) { pt.geoidheight = this.geoIdHeight; }
			if ( this.name ) { pt.name = this.name; }
			if ( this.comment ) { pt.cmt = this.comment; }
			if ( this.description ) { pt.desc = this.description; }
			if ( this.source ) { pt.src = this.source; }
			if ( this.link ) { pt.link = this.link; }
			if ( this.linkText ) { pt.link.text = this.linkText; }
			if ( this.linkType ) { pt.link.type = this.linkType; }
			if ( this.symbol ) { pt.sym = this.symbol; }
			if ( this.type ) { pt.type  = this.type; }
			if ( this.fix ) { pt.fix = this.fix; }
			if ( this.satelliteNum ) { pt.sat = this.satelliteNum; }
			if ( this.hdop ) { pt.hdop = this.hdop; }
			if ( this.vdop ) { pt.vdop = this.vdop; }
			if ( this.pdop ) { pt.pdop = this.pdop; }
			if ( this.ageOfGpsData ) { pt.ageofgpsdata = this.ageOfGpsData; }
			if ( this.dgpsid ) { pt.dgpsid = this.dgpsid; }
			return pt;
		}
		
		public static function getWaypoints(xmlList:XMLList) : Array
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			var arrTempWaypoints : Array = new Array();
			for( var i:Number = 0; i < xmlList.length(); i++ )
			{
				if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::wpt' ) {
					var wpt : Waypoint = createWaypointFromXML(xmlList[i]);
					arrTempWaypoints.push(wpt);
				}
			}
			
			return arrTempWaypoints;
		}
		
		/**
		 * 
		 * 
		 **/
		
		public static function getWaypointByName(str:String, gpx:GPX) : void
		{
			/*
			var arrWaypoints : Array = new Array();
			for( var i : Number = 0; i++; i < gpx.arrWaypoints.length )
			{
				if( gpx.arrWaypoints[i].name == 'str' )
				{
					return gpx.arrWaypoints[i] as Waypoint;
				} else {
					return new Waypoint(0,0,0,'test');
				}
			}
			*/
		}
	}
}
