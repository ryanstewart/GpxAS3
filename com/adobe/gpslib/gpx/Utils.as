package com.adobe.gpslib.gpx
{
	import com.adobe.gpslib.gpx.extensions.Extensions;
	import com.adobe.gpslib.gpx.extensions.speed.SpeedPoint;
	
	public class Utils
	{
		private static const TIME_NUMBER : Number = 0.000000277777778;
		private static const MI : Number = 1.15077945;
		private static const KM : Number = 1.85200;
		
		public static function getDistanceBetweenWaypoints(wpt1:Waypoint, wpt2:Waypoint, unit:String="mi") : Number
		{
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
			var trkLen : int = track.trackSegment.length;
			
			for( var i : Number = 0; i < trkLen; i++ )
			{
				if( i+1 != trkLen )
				{
					arrTemp.push(distance);
					distance = distance + getDistanceBetweenWaypoints(track.trackSegment[i], track.trackSegment[i+1], "mi");
				}
			}
			return arrTemp;	
		}
		
		public static function getRateOfSpeedBetweenWaypoints( wpt1:Waypoint, wpt2:Waypoint ) : Object
		{
			var obj : Object = new Object();
			var distance : Number = getDistanceBetweenWaypoints(wpt1, wpt2);
			var timeDifference : Number = (wpt2.time.time - wpt1.time.time) * TIME_NUMBER;
			var rate : Number = distance/timeDifference;
			obj.distance = distance;
			obj.rate = rate;
			
			return obj;
		}
		
		public static function addSpeedDistanceToTrack( trk:Track ) : Track
		{
			var trkLen : uint = trk.trackSegment.length;		
			for(var i:uint=1; i<trkLen; i++)
			{
				var obj : Object = getRateOfSpeedBetweenWaypoints( trk.trackSegment[i-1], trk.trackSegment[i] );
				var speedPt : SpeedPoint = new SpeedPoint( "mi", "hr", obj.rate, obj.distance );
				var ext : Extensions = new Extensions();
				ext.addItem(speedPt);
				trk.trackSegment[i].extensions = ext;
				if( i == 1 )
				{
					trk.trackSegment[0].extensions.addItem(new SpeedPoint("mi", "hr", 0, 0));
				}
			}
			return trk;
		}

	}
}