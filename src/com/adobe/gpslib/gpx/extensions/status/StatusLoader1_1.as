package com.adobe.gpslib.gpx.extensions.status
{
	public class StatusLoader1_1
	{
		public function StatusLoader1_1()
		{
		}

		public static function load (xml:XML) : StatusPoint
		{
			return null;
		}

		public static function toXMLString(sp:StatusPoint) : XML
		{
			var xml : XML = <statuspoint></statuspoint>;
			xml.addNamespace(sp.thisNamespace);
			if ( sp.createdAt ) { xml.created_at = sp.createdAt; }
			if ( sp.id ) { xml.id = sp.id; }
			if ( sp.text ) { xml.text = sp.text; }
			if ( sp.source ) { xml.source = sp.source; }
			if ( sp.userId ) { xml.user.id = sp.userId; }
			if ( sp.userName ) { xml.user.name = sp.userName; }
			return xml;
		}

	}
}