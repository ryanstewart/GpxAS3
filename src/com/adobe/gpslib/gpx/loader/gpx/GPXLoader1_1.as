package com.adobe.gpslib.gpx.loader.gpx
{
	import com.adobe.gpslib.GPX;
	import com.adobe.gpslib.gpx.Route;
	import com.adobe.gpslib.gpx.Track;
	import com.adobe.gpslib.gpx.Waypoint;
	import com.adobe.gpslib.gpx.loader.RTELoaderFactory;
	import com.adobe.gpslib.gpx.loader.TRKLoaderFactory;
	import com.adobe.gpslib.gpx.loader.WPTLoaderFactory;
	import com.adobe.gpslib.gpx.loader.route.RTELoader1_1;
	import com.adobe.gpslib.gpx.loader.track.TRKLoader1_1;
	import com.adobe.gpslib.gpx.loader.waypoint.WPTLoader1_1;
	import com.adobe.utils.DateUtil;

	import flash.events.EventDispatcher;

	public class GPXLoader1_1 extends EventDispatcher
	{
		public function GPXLoader1_1()
		{
		}

		public function load(xml:XML) : GPX
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

		public static function toXMLString(gpx:GPX) : XML
		{
			var xml : XML = <gpx></gpx>;
			var ns : Namespace = new Namespace(null, "http://www.topografix.com/GPX/1/1");
			xml.addNamespace(ns);
			xml.@creator = gpx.creator;
			xml.@version = gpx.version;
			if ( gpx.name ) { xml.metadata.name = gpx.name; }
			if ( gpx.description ) {xml.metadata.desc = gpx.description; }
			if ( gpx.author ) { xml.metadata.author = gpx.author; }
			if ( gpx.email ) { xml.metadata.email = gpx.email; }
			if ( gpx.link ) { xml.metadata.link.@href = gpx.link; }
			if ( gpx.linkText ) { xml.metadata.link.text = gpx.linkText; }
			if ( gpx.linkType ) { xml.metadata.link.type = gpx.linkType; }
			if ( gpx.time ) { xml.metadata.time = gpx.time.fullYearUTC; }
			if ( gpx.keywords ) { xml.metadata.keywords = gpx.keywords; }

			if ( gpx.minLatitude || gpx.minLongitude || gpx.maxLatitude || gpx.maxLongitude ) {
				xml.metadata.bounds.@minlat;
				xml.metadata.bounds.@minlon;
				xml.metadata.bounds.@maxlat;
				xml.metadata.bounds.@maxlon;
			}

			for ( var k : Number = 0; k < gpx.arrWaypoints.length-1; k++ )
			{
				var wpt : Waypoint = gpx.arrWaypoints[k] as Waypoint;
				xml.appendChild(WPTLoader1_1.toXMLString(wpt,"wpt"));
			}
			for ( var i : Number = 0; i < gpx.arrTracks.length; i++ )
			{
				var trk : Track = gpx.arrTracks[i] as Track;
				xml.appendChild(TRKLoader1_1.toXMLString(trk));
			}
			for ( var j : Number = 0; j < gpx.arrRoutes.length; j++ )
			{
				var rte : Route = gpx.arrRoutes[j] as Route;
				xml.appendChild(RTELoader1_1.toXMLString(rte));
			}
			return xml;
		}
	}
}