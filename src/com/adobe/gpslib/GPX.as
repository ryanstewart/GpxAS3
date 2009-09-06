/*
Copyright (c) 2009 Ryan Stewart
http://blog.digitalbackcountry.com

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

package com.adobe.gpslib
{
	import com.adobe.gpslib.gpx.events.ParseEvent;
	import com.adobe.gpslib.gpx.loader.GPXLoaderFactory;
	
	import flash.events.EventDispatcher;

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
		
		public static function load(gpx_xml:XML) : GPX
		{
			var gpxLoader : GPXLoaderFactory = new GPXLoaderFactory();
			return gpxLoader.loadGPX(gpx_xml);
		}
		
		
		//Depricated
		public static function newGpxFromXml(xml:XML) : GPX
		{
			return load(xml);
		}
		
		public static function toXMLString(gpx:GPX) : XML
		{
			return GPXLoaderFactory.toXMLString(gpx);
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