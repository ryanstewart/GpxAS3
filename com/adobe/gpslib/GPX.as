package com.adobe.gpslib
{
	import com.adobe.gpslib.gpx.Route;
	import com.adobe.gpslib.gpx.Track;
	import com.adobe.gpslib.gpx.Waypoint;

	[Bindable]
	public class GPX
	{		
		private var _creator : String;
		private var _version : String;
		private var _name : String;
		private var _description: String;
		private var _author : String;
		private var _email : String;
		private var _copyright: String;
		private var _link : String;
		private var _linkText : String;
		private var _linkType : String;
		private var _time : Date; // should be time
		private var _keywords : String;
		private var _minLatitude : Number;
		private var _minLongitude : Number;
		private var _maxLatitude : Number;
		private var _maxLongitude : Number;
		private var _arrWaypoints : Array = new Array();
		private var _arrTracks : Array = new Array();
		private var _arrRoutes : Array = new Array();
		
		public function GPX()
		{
			
		}
		
		public function newGpxFromXml(xml:XML) : GPX
		{
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			
			var xmlList : XMLList = xml.children();
			if( xml.name() == 'http://www.topografix.com/GPX/1/1::gpx' )
			{
				this.name = xml.metadata.name;
				this.description = xml.metadata.desc;
				this.author = xml.metadata.author;
				this.link = xml.metadata.link.@href;
				this.linkText = xml.metadata.link.text;
				this.linkType = xml.metadata.link.type;
				// Dealing with Time
				var strTime : String = xml.metadata.time;
				var year : Number = Number(strTime.substring(0,4));
				var month : Number = Number(strTime.substring(5,7));
				var day : Number = Number(strTime.substring(8,10));
				var hours : Number = Number(strTime.substring(11,13));
				var minutes : Number = Number(strTime.substring(14,16));
				var seconds : Number = Number(strTime.substring(17,19));
				if( strTime != "" )
				{
					this.time = new Date();
					this.time.setUTCFullYear(year, month, day);
					this.time.setUTCHours(hours, minutes, seconds);
				}
				// End of Time Logic
				this.keywords = xml.metadata.keywords;
				this.minLatitude = xml.metadata.bounds.@minlat;
				this.minLongitude = xml.metadata.bounds.@minlon;
				this.maxLatitude = xml.metadata.bounds.@maxlat;
				this.maxLongitude = xml.metadata.bounds.@maxlon;
				
				for( var i:Number = 0; i < xmlList.length(); i++ )
				{
					if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::wpt' ) {
						var wpt : Waypoint = Waypoint.createWaypointFromXML(xmlList[i]);
						this.arrWaypoints.push(wpt);
					} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::trk' ) {
						var trk : Track = Track.createTrackFromXML(xmlList[i]);
						this.arrTracks.push(trk);
					} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::rte') {
						var rte : Route = Route.createRouteFromXML(xmlList[i]);
						this.arrRoutes.push(rte);
					}
				}				
			}else if ( xml.name() == 'http://www.topografix.com/GPX/1/0::gpx' ) {
				trace(xml.name);
			}
			return this;	
		}
		
		public function createXmlGpx() : XML
		{
			var gpx : XML = <gpx></gpx>;
			
			gpx.addNamespace("http://www.topografix.com/GPX/1/1");
			gpx.@creator = this.creator;
			gpx.@version = this.version;
			if ( this.name ) { gpx.metadata.name = this.name; }
			if ( this.description ) {gpx.metadata.desc = this.description; }
			if ( this.author ) { gpx.metadata.author = this.author; }
			if ( this.email ) { gpx.metadata.email = this.email; }
			if ( this.link ) { gpx.metadata.link.@href = this.link; }
			if ( this.linkText ) { gpx.metadata.link.text = this.linkText; }
			if ( this.linkType ) { gpx.metadata.link.type = this.linkType; }
			if ( this.time ) { gpx.metadata.time = this.time.fullYearUTC; }
			if ( this.keywords ) { gpx.metadata.keywords = this.keywords; }
			
			if ( this.minLatitude || this.minLongitude || this.maxLatitude || this.maxLongitude ) { 
				gpx.metadata.bounds.@minlat;
				gpx.metadata.bounds.@minlon;
				gpx.metadata.bounds.@maxlat;
				gpx.metadata.bounds.@maxlon;
			}
			
			for ( var k : Number = 0; k < this.arrWaypoints.length-1; k++ )
			{
				var wpt : Waypoint = this.arrWaypoints[k] as Waypoint;
				gpx.appendChild(wpt.createXMLWaypoint());
			}
			for ( var i : Number = 0; i < this.arrTracks.length-1; i++ )
			{
				var trk : Track = this.arrTracks[i] as Track;				
				gpx.appendChild(trk.createXmlTrack());
			}
			for ( var j : Number = 0; j < this.arrRoutes.length-1; j++ )
			{			
				var rte : Route = this.arrRoutes[j] as Route;
				gpx.appendChild(rte.createXmlRoute());
			}
			return gpx;
		}
		
		/******
		 * Getters and Setters
		 *****/
		 
		public function set creator (value:String) : void { _creator = value; }
		public function get creator () : String { return _creator; }
		
		public function set version (value:String) : void { _version = value; }
		public function get version () : String { return _version; }
		
		public function set name (value:String) : void { _name = value; }
		public function get name () : String { return _name; }
		
		public function set description (value:String) : void { _description = value; }
		public function get description () : String { return _description; }
		
		public function set author (value:String) : void { _author = value; }
		public function get author () : String { return _author; }
		
		public function set email (value:String) : void { _email = value; }
		public function get email () : String { return _email; }
		
		public function set link (value:String) : void { _link = value; }
		public function get link () : String { return _link; }
		
		public function set linkText (value:String) : void { _linkText = value; }
		public function get linkText () : String { return _linkText; }
		
		public function set linkType (value : String) : void { _linkType = value; }
		public function get linkType () : String { return _linkType; }
		
		public function set time (value:Date) : void { _time = value; }
		public function get time () : Date { return _time; }
		
		public function set keywords (value:String) : void { _keywords = value; }
		public function get keywords () : String { return _keywords; }
		
		public function set minLatitude (value:Number) : void { _minLatitude = value; }
		public function get minLatitude () : Number { return _minLatitude;	}
		
		public function set minLongitude (value:Number) : void { _minLongitude = value; }
		public function get minLongitude () : Number { return _minLongitude; }
		
		public function set maxLatitude (value:Number) : void { _maxLatitude = value; }
		public function get maxLatitude () : Number { return _maxLatitude; }
		
		public function set maxLongitude (value:Number) : void { _maxLongitude = value; }
		public function get maxLongitude () : Number { return _maxLongitude; }
		
		public function set arrWaypoints( value:Array ) : void { _arrWaypoints = value; }
		public function get arrWaypoints () : Array { return _arrWaypoints }
		
		public function set arrTracks( value:Array ) : void { _arrTracks = value; }
		public function get arrTracks() : Array { return _arrTracks; }
		
		public function set arrRoutes( value:Array ) : void { _arrRoutes = value; }
		public function get arrRoutes() : Array { return _arrRoutes; }
	}
}