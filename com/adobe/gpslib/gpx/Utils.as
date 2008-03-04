package com.adobe.gpslib.gpx
{
	public class Utils
	{
		public static function getDistanceBetweenWaypoints(wpt1:Waypoint, wpt2:Waypoint, unit:String="mi") : Number
		{
			const MI : Number = 1.15077945;
			const KM : Number = 1.85200;
			var adjustment : Number = 0;
			if( unit == "mi" ) { adjustment = MI; }
			if( unit == "km" ) { adjustment = KM; }
			// Distance=ACOS(SIN(lat1/180*PI)*SIN(lat2/180*PI)+ COS(lat1/180*PI)*COS(lat2/180*PI)*COS(lon1/180*PI-lon2/180*PI))*180*60/PI)
			var distance : Number;
			distance = Math.acos(Math.sin(wpt1.latitude/180*Math.PI)*Math.sin(wpt2.latitude/180*Math.PI)+Math.cos(wpt1.latitude/180*Math.PI)*Math.cos(wpt2.latitude/180*Math.PI)*Math.cos(wpt1.longitude/180*Math.PI-wpt2.longitude/180*Math.PI))*180*60/Math.PI;
			return distance * adjustment;
		}
		
		public static function getTrackDistance( track:Track ) : Number
		{
			var distance : Number = 0;
			for( var i : Number = 0; i < track.trackSegment.length; i++ )
			{
				if( i+1 != track.trackSegment.length )
				{
					distance = distance + getDistanceBetweenWaypoints(track.trackSegment[i], track.trackSegment[i+1], "mi");
				}
			}
			return distance;
		}
		
		public static function getTrackDistanceAsArray( track:Track ) : Array
		{
			var distance : Number = 0;
			var arrTemp : Array = new Array();
			for( var i : Number = 0; i < track.trackSegment.length; i++ )
			{
				if( i+1 != track.trackSegment.length )
				{
					arrTemp.push(distance);
					distance = distance + getDistanceBetweenWaypoints(track.trackSegment[i], track.trackSegment[i+1], "mi");
				}
			}
			return arrTemp;	
		}
		
		public static function getRateOfSpeedBetweenWaypoints( wpt1:Waypoint, wpt2:Waypoint ) : Number
		{
			var distance : Number = getDistanceBetweenWaypoints(wpt1, wpt2);
			var timeDifference : Number = (wpt2.time.time - wpt1.time.time) * 0.000000277777778;
			var rate : Number = distance/timeDifference;
			return rate;
		}

	}
}