package com.fantage.module.FE.Util.Scroll
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class ScrollBar extends MovieClip
	{
		private var _contentWidth:Number = 1;
		private var _contentHeight:Number = 1;
		
		private var _trackWidth:Number = 10;
		private var _trackHeight:Number = 400;
		private var _round:Number = 10
			;
		
		private var _horizontal:Boolean = true;
		
		private var _grip:Sprite;
		private var _gripHeight:Number;
		
		public function ScrollBar($w:Number, $h:Number, $cw:Number, $ch:Number, $horizontal:Boolean = true)
		{
			_horizontal = $horizontal;
			
			//constant
			_trackHeight = $h;
			
			//dynamic
		//	_trackWidth = $w;
			_contentWidth = $cw;
			_contentHeight = $ch;
			
			renderBG();
			renderBar();
		}
		
		public function resize($contentHeight:Number):void{
			_contentHeight = $contentHeight;
			trace("bar:", _contentHeight);
			
			var barRatio:Number = _trackHeight/_contentHeight;
			if( barRatio > 1 )
				barRatio = 1;
			_gripHeight = barRatio*_trackHeight;
			
			
			_grip.graphics.clear();			
			_grip.graphics.beginFill(0x333333);
			_grip.graphics.drawRect(0,0,_trackWidth,_gripHeight );
			_grip.graphics.endFill();
			_grip.x = 0;
			_grip.y = 0;
		}
		
		
		public function gripAt():Number{
			return _grip.y / (_trackHeight - _gripHeight);
		}
		
		
		public function get gripHeight():Number{
			return _gripHeight;
		}

		public function set gripHeight(value:Number):void{
			_gripHeight = value;
		}

		public function get grip():Sprite{
			return _grip;
		}

		public function set grip(value:Sprite):void{
			_grip = value;
		}
		
		public function get max():Number{
			return _trackHeight - _gripHeight;
		}

		private function renderBG():void{
			graphics.beginFill(0xFFCC00);
	//		trace("tw:",_trackWidth,"th:", _trackHeight, "round:", _round );
	//		graphics.lineStyle(1,0xFFCC00);
			graphics.drawRect(0,0,_trackWidth,_trackHeight );
			graphics.endFill();
		}
		
		private function renderBar():void{
			var barRatio:Number = _trackHeight/_contentHeight;
			if( barRatio > 1 )
				barRatio = 1;
			_gripHeight = barRatio*_trackHeight;
			
			_grip = new Sprite();
			_grip.graphics.beginFill(0x333333);
			_grip.graphics.drawRect(0,0,_trackWidth,_gripHeight );
			_grip.graphics.endFill();
			_grip.x = 0;
			_grip.y = 0;
			_grip.buttonMode = true;
			addChild(_grip);
		}
		
		
		
		
		
		
		
		
	}
}