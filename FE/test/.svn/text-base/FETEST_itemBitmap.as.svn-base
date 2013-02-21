package com.fantage.module.FE.test
{
	import com.fantage.module.FE.project.RasterAvatarTool.ItemBitmap;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class FETEST_itemBitmap extends MovieClip
	{
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		private var _itemBitmap:ItemBitmap;
		private var _mc:MovieClip;
		
		private var _timer:Timer;
		private var _col:int = 1;
		public function FETEST_itemBitmap()
		{
			_timer = new Timer(2000, 5 );
			_timer.addEventListener( TimerEvent.TIMER, onTimer);
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage($e:Event):void{
			_mc = this["mc"];
			_bitmapData = new BitmapData(100,100);
			_bitmapData.draw(_mc);
			
			_itemBitmap = new ItemBitmap(_bitmapData);
			_itemBitmap.x = 200;
			_itemBitmap.y = 200;
			_mc.scaleX = 2;
			trace("width:", _mc.width);
			addChild(_itemBitmap);
			_timer.start();
		}
		
		private function onTimer($e:TimerEvent):void{
			_col++;
			_itemBitmap.col = _col;
		}
	}
}