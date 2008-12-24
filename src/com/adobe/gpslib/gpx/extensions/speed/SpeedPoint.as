package com.adobe.gpslib.gpx.extensions.speed
{
	public class SpeedPoint
	{
		public static const KILOMETERS : String = "KM";
		public static const MILES : String = "MI";
		public static const FEET : String = "FT";
		public static const METERS : String = "M";
			
		public static const HOURS : String = "HR";
		public static const MINUTES : String = "MIN";
		public static const SECONDS : String = "SEC";
			
		private var _distanceUnit : String;
		private var _timeUnit : String;
		private var _velocity : Number;
		private var _totalDistance : Number;

		private var _thisNamespace : String = "http://www.digitalbackcountry.com/SpeedPoint/1/0";
		
		public function SpeedPoint(du:String, tu:String, vel:Number, dis:Number=0)
		{
			_distanceUnit = du;
			_timeUnit = tu;
			_velocity = vel;
			_totalDistance = dis;
		}
		
		public function set distanceUnit (value:String) : void { _distanceUnit = value; }
		public function get distanceUnit () : String { return _distanceUnit; }
		
		public function set timeUnit (value:String) : void { _timeUnit = value; }
		public function get timeUnit () : String { return _timeUnit; }
		
		public function set velocity (value:Number) : void { _velocity = value; }
		public function get velocity () : Number {return _velocity; }
		
		public function set totalDistance (value:Number) : void { _totalDistance = value; }
		public function get totalDistance () : Number { return _totalDistance; }
		
	}
}