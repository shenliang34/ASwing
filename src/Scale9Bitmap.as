package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class Scale9Bitmap extends Sprite
	{
		private var _rect:Rectangle;
		private var _score:BitmapData;
		private var _scoreW:Number;
		private var _scoreH:Number;
		
		private var _leftUpBitmap:Bitmap;//左上
		private var _upCenterBitmap:Bitmap;//上中
		private var _rightUpBitmap:Bitmap;//右上
		private var _leftCenterBitmap:Bitmap;//左中
		private var _centerBitmap:Bitmap;//中
		private var _rightCenterBitmap:Bitmap;//右中
		private var _leftDownBitmap:Bitmap;//左下
		private var _centerDownBitmap:Bitmap;//中下
		private var _rightDownBitmap:Bitmap;//右下
		
		private var _width:Number;
		private var _hegith:Number;
		public function Scale9Bitmap(score:BitmapData,rect:Rectangle)
		{
			super();
			
			this._width = score.width;
			this._hegith = score.height;
			
			this._score = score;
			this._rect = rect;
			
			_scoreW = score.width;
			_scoreH = score.height;
			
			initBp();
		}
		
		private function initBp():void
		{
			// TODO Auto Generated method stub
			
			_leftUpBitmap = getBitmap(0,0,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_leftUpBitmap);
			
			_upCenterBitmap = getBitmap(_rect.x,0,_rect.width,_rect.y);
			addChild(_upCenterBitmap);
			
			_rightUpBitmap = getBitmap(_rect.right,0,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_rightUpBitmap);
			
			_leftCenterBitmap = getBitmap(0,_rect.y,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_leftCenterBitmap);
			
			_centerBitmap = getBitmap(_rect.x,_rect.y,_rect.width,_rect.y);
			addChild(_centerBitmap);
			
			_rightCenterBitmap = getBitmap(_rect.right,_rect.y,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_rightCenterBitmap);
			
			_leftDownBitmap = getBitmap(0,_rect.bottom,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_leftDownBitmap);
			
			_centerDownBitmap = getBitmap(_rect.x,_rect.bottom,_rect.width,_rect.y);
			addChild(_centerDownBitmap);
			
			_rightDownBitmap = getBitmap(_rect.right,_rect.bottom,_scoreW - _rect.width >> 1,_rect.y);
			addChild(_rightDownBitmap);
			
		}
		
		private function getBitmap(vx:Number,vy:Number,w:Number,h:Number):Bitmap
		{
			var bd:BitmapData = new BitmapData(w,h);
			bd.copyPixels(_score,new Rectangle(vx,vy,w,h),new Point());
			var bp:Bitmap = new Bitmap(bd);
			bp.x = vx;
			bp.y = vy;
			return bp;
		}
		
		public function resize(width:Number,height:Number):void
		{
			_width = width;
			_hegith = height;
			
			draw();
		}
		
		private function draw():void
		{
			// TODO Auto Generated method stub
			_upCenterBitmap.width = _width - (_rect.x * 2);
			_centerDownBitmap.width = _width - (_rect.x * 2);
			
			_leftCenterBitmap.height = _hegith - (_rect.y * 2);
			_rightCenterBitmap.height = _hegith - (_rect.y * 2);
			
			_centerBitmap.width = _width - (_rect.x * 2);
			_centerBitmap.height = _hegith - (_rect.y * 2);
			
			_rightUpBitmap.x = _width - _rect.x;
			_rightCenterBitmap.x =  _width - _rect.x;
			_rightDownBitmap.x =  _width - _rect.x;
			
			_leftDownBitmap.y = _hegith - _rect.y;
			_centerDownBitmap.y = _hegith - _rect.y;
			_rightDownBitmap.y = _hegith - _rect.y;
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
			draw();
		}
		
		override public function set height(value:Number):void
		{
			_hegith = value;
			
			draw();
		}
		
		override public function get height():Number
		{
			// TODO Auto Generated method stub
			return _hegith;
		}
		
		override public function get width():Number
		{
			// TODO Auto Generated method stub
			return _width;
		}
		
	}
}