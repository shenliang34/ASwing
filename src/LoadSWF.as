package
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;

	public class LoadSWF extends EventDispatcher
	{
		private static var _instance:LoadSWF;
		
		public static var SCORE_BD:BitmapData;
		public function LoadSWF()
		{
			
		}
		
		public static function get instance():LoadSWF
		{
			return _instance ||= new LoadSWF();
		}
		
		
		public function loadSwf(url:String):void
		{
			var loader:Loader = new Loader();
			loader.load(new URLRequest("resource/" + url));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
		}
		
		protected function onLoadComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			var loaderInfo:LoaderInfo = event.currentTarget as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE,onLoadComplete);
			var domain:ApplicationDomain = loaderInfo.applicationDomain;
			
			SCORE_BD = new (domain.getDefinition("SCORE_BD"));
//			Resoure.init(domain);
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}