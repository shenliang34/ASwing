package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import org.aswing.AsWingManager;
	import org.aswing.Container;
	import org.aswing.JButton;
	import org.aswing.JFrame;
	
	[SWF(width="600",height="600")]
	public class Main extends Sprite
	{
		private var frame:JFrame;
		private var mainContainer:Container;
		public function Main()
		{
			LoadSWF.instance.loadSwf("9scale.swf");
			LoadSWF.instance.addEventListener(Event.COMPLETE,onComplete);
			
//			AsWingManager.initAsStandard(this);
//			
//			frame = new JFrame(this,"as");
//			
//			var btn:JButton = new JButton("点我");
//			addChild(btn);
//			
//			mainContainer = frame.getContentPane();
//			mainContainer.append(btn);
//			frame.pack();
//			frame.show();
			var chatPane:ChatPane = new ChatPane();
			addChild(chatPane);
		}
		
		private var scaleBp:Scale9Bitmap;
		private var startW:Number;
		private var add:Boolean;
		
		protected function onComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			LoadSWF.instance.removeEventListener(Event.COMPLETE,onComplete);
			scaleBp = new Scale9Bitmap(LoadSWF.SCORE_BD,new Rectangle(20,20,30,20));
			addChild(scaleBp);
			startW = scaleBp.width;
			add = true;
			
			var timer:Timer = new Timer(20,0);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
			center();
			
//			var time1:Number = getTimer();
//			var arr:Array = [];
//			for (var i:int = 0; i < 1000000; i++) 
//			{
//				arr.push(i);
//			}
//			var time2:Number = getTimer();
//			trace(time2 - time1);
		}
		
		protected function onTimer(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			
			if(scaleBp.width > 300)
			{
				add = false;
			}
			else if(scaleBp.width < startW)
			{
				add = true;
			}
			
			if(add)
			{
				scaleBp.width = scaleBp.width + 2;
				scaleBp.height = scaleBp.height + 2;
			}
			else
			{
				scaleBp.width = scaleBp.width - 2;
				scaleBp.height = scaleBp.height - 2;
			}
			
			center();
		}
		
		private function center():void
		{
			// TODO Auto Generated method stub
			scaleBp.x = stage.stageWidth - scaleBp.width >> 1;
			scaleBp.y = stage.stageHeight - scaleBp.height >> 1;
		}
		
		protected function onLoadComplete(event:Event):void
		{
			// TODO Auto-generated method stub
		}
		
		private function initUI():void
		{
			// TODO Auto Generated method stub
		}
	}
}