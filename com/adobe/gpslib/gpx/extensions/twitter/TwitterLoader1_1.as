package com.adobe.gpslib.gpx.extensions.twitter
{
	public class TwitterLoader1_1
	{
		public function TwitterLoader1_1()
		{
		}
		
		public static function load (xml:XML) : TwitterPoint
		{
			return null;	
		}
		
		public static function toXMLString(tp:TwitterPoint) : XML
		{
			var xml : XML = <twitterpoint></twitterpoint>;
			xml.addNamespace(tp.thisNamespace);
			if ( tp.createdAt ) { xml.created_at = tp.createdAt; }
			if ( tp.id ) { xml.id = tp.id; }
			if ( tp.text ) { xml.text = tp.text; }
			if ( tp.source ) { xml.source = tp.source; }
			if ( tp.truncated ) { xml.truncated = tp.truncated; }
			if ( tp.inReplyToStatusId ) { xml.in_reply_to_status_id = tp.inReplyToStatusId; }
			if ( tp.inReplyToUserId ) { xml.in_reply_to_user_id = tp.inReplyToUserId; }
			if ( tp.favorited ) { xml.favorited = tp.favorited; }
			if ( tp.userId ) { xml.user.id = tp.userId; }
			if ( tp.userName ) { xml.user.name = tp.userName; }
			if ( tp.userScreenName ) { xml.user.screen_name = tp.userScreenName; }
			if ( tp.userLocation ) { xml.user.location = tp.userLocation; }
			return xml;
		}

	}
}