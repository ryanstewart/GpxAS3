package com.adobe.gpslib.gpx.extensions
{
	import com.adobe.gpslib.gpx.extensions.speed.SpeedPoint;
	import com.adobe.gpslib.gpx.extensions.status.StatusPoint;

	import mx.collections.ArrayCollection;

	public class Extensions extends ArrayCollection
	{
		//private var _arrExtensions : Array = new Array();

		public static const STATUS_POINT : String = "StatusPoint";
		public static const SPEED_POINT : String = "SpeedPoint";

		public function Extensions()
		{
			super();
		}
		/*
		public function getExtensionsByType(value:String) : ArrayCollection
		{
			// Figure out a way to make this more dynamic.
			var len : uint = length;
			var arr : Array = new Array();
			var ac : ArrayCollection = new ArrayCollection(arr);
			switch(value)
			{
				case SPEED_POINT:
					for( var i : uint; i < len; i++ )
					{
						if( this[i] is SpeedPoint )
						{
							ac.addItem(this[i]);
						}
					}
					break;
				case STATUS_POINT:
					for( var j : uint; j < len; j++ )
					{
						if( this[j] is StatusPoint )
						{
							ac.addItem(this[j]);
						}
					}
					break;
			}

			return ac;
		}
		*/
		//public function set arrExtensions(value:Array) : void { _arrExtensions = value; }
		//public function get arrExtensions() : Array { return _arrExtensions; }

	}
}