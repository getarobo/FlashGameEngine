package com.fantage.module.FE.Component
{
	import com.fantage.module.FE.FE;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;

	public class BitmapMaskTestControlComponent extends ControlComponent
	{
		private var _update:Boolean = false;
		private var _addedEL:Boolean = false;
		private var _lightBitmap:Bitmap;
		private var _bitmapData:BitmapData = new BitmapData(800,520,true,0x000000);
		private var _lightMc:MovieClip;
		private var _rect:Rectangle = new Rectangle(0,0,800,520);
		private var _
		
		public function BitmapMaskTestControlComponent()
		{
		}
		
		public function set lightMc($mc:MovieClip):void{
			_lightMc = $mc;
			
		}
		
		public function start():void{
			_update = true;
		}
		public function stop():void{
			_update = false;
		}
		
		override public function onTick():void{
			_bitmapData.fillRect(_rect,0x000000);
			_lightMc.x = FE.mainStage.mouseX;
			_lightMc.y = FE.mainStage.mouseY;			
			_bitmapData.copyPixels(_lightBitmap, 
		}
		
		
		
	}
}