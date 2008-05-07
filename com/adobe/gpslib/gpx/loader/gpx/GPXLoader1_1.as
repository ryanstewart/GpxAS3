package com.adobe.gpslib.gpx.loader.gpx
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.Route;
	import com.adobe.gpslib.gpx.Track;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.RTELoaderFactory;
	import com.adobe.gpslib.gpx.loader.TRKLoaderFactory;
	import com.adobe.gpslib.gpx.loader.WPTLoaderFactory;
	import com.adobe.utils.DateUtil;
	
	public class GPXLoader1_1
	{
		public function GPXLoader1_1()
		{
		}

		public static function load(xml:XML):GPX
		{
			var gpx:GPX = new GPX();
			namespace gpxNS = "http://www.topografix.com/GPX/1/1";
			use namespace gpxNS;
			var xmlList : XMLList = xml.children();
			gpx.name = xml.metadata.name;
			gpx.description = xml.metadata.desc;
			gpx.author = xml.metadata.author;
			gpx.link = xml.metadata.link.@href;
			gpx.linkText = xml.metadata.link.text;
			gpx.linkType = xml.metadata.link.type;
			var strTime : String = xml.metadata.time;
			if( strTime != "" ) { gpx.time = DateUtil.parseW3CDTF(strTime); }
			gpx.keywords = xml.metadata.keywords;
			gpx.minLatitude = xml.metadata.bounds.@minlat;
			gpx.minLongitude = xml.metadata.bounds.@minlon;
			gpx.maxLatitude = xml.metadata.bounds.@maxlat;
			gpx.maxLongitude = xml.metadata.bounds.@maxlon;
			
			for( var i:Number = 0; i < xmlList.length(); i++ )
			{
				if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::wpt' ) {
					var wpt : Waypoint = WPTLoaderFactory.load(xmlList[i]);
					gpx.arrWaypoints.push(wpt);
				} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::trk' ) {
					var trk : Track = TRKLoaderFactory.load(xmlList[i]);
					gpx.arrTracks.push(trk);
				} else if( xmlList[i].name() == 'http://www.topografix.com/GPX/1/1::rte') {
					var rte : Route = RTELoaderFactory.load(xmlList[i]);
					gpx.arrRoutes.push(rte);
				}
			}
			
			return gpx;
				
		}
	}
}