package com.adobe.gpslib.gpx
{
	import com.adobe.gpslib.gpx.extensions.Extensions;
	import com.adobe.gpslib.gpx.extensions.speed.SpeedPoint;
		
	public class Utils
	{
		private static const TIME_NUMBER : Number = 0.000000277777778;
		private static const MI : Number = 1.15077945;
		private static const KM : Number = 1.85200;
		
		private static const EARTH_RADIUS_MILES:Number = 3961.3;
		private static const EARTH_RADIUS_KM:Number = 6378.1;
		
		public static function getDistanceBetweenWaypoints(wpt1:Waypoint, wpt2:Waypoint, unit:String="mi") : Number
		{
			/***
			 *  Haversine Formula (from R.W. Sinnott, "Virtues of the Haversine", Sky and Telescope, vol. 68, no. 2, 1984, p. 159):

				dlon = lon2 - lon1
				dlat = lat2 - lat1
				a = (sin(dlat/2))^2 + cos(lat1) * cos(lat2) * (sin(dlon/2))^2
				c = 2 * atan2( sqrt(a), sqrt(1-a) )
				d = R * c (where R is the radius of the Earth)
				
				Formula from: http://andrew.hedges.name/experiments/haversine/ 
			*/ 

			var adjustment : Number = 0;
			var R:Number;
			var distance:Number;
			var a:Number;
			var c:Number;
			
			if( unit == "mi" ) { R = EARTH_RADIUS_MILES; }
			if( unit == "km" ) { R = EARTH_RADIUS_KM; }
		
			var dlon:Number = degreesToRadians(wpt2.longitude) - degreesToRadians(wpt1.longitude);
			var dlat:Number = degreesToRadians(wpt2.latitude) - degreesToRadians(wpt1.latitude);
			
			// Begin Haversine Forumla
			a = Math.pow(Math.sin(dlat/2),2) + (Math.cos(wpt1.latitude) * Math.cos(wpt2.latitude) * Math.pow(Math.sin(dlon/2),2));
			c = 2* Math.atan2( Math.sqrt(Math.abs(a)),Math.sqrt(Math.abs(1-a)) );
			distance = R * c;
			
			return distance;
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
		
		private static function degreesToRadians(value:Number):Number
		{
			var radians:Number = value * Math.PI/180;
			return radians;
		}

	}
}