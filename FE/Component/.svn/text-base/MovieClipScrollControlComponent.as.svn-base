package com.fantage.module.FE.Component
{
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.Scroll.ScrollBar;
	import com.fantage.module.FE.Util.Scroll.ScrollClip;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class MovieClipScrollControlComponent extends ControlComponent
	{
		
		
		private var _contentClip:ScrollClip;
		private var _clipWidth:Number;
		private var _clipHeight:Number;
		
		private var _horizontalBar:ScrollBar;
		
		private var _addedEL:Boolean = false;
		private var _mouseDown:Boolean = false;
		private var _offsetY:Number = 0;
		
		public function MovieClipScrollControlComponent()
		{
		}
		
		
		override public function inited():void{
			if( _contentClip == null ){
				_contentClip = MovieClipRenderComponent(render).clip.contentScroll;
			}
			addEL();
		}
		
		override public function destroyed():void{
			removeEL();
		}
		
		
		
		
		private function addEL():void{
			if( !_addedEL ){
				_contentClip.horizontalBar.grip.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
				_addedEL = true;
			}
		}
		
		private function removeEL():void{
			if( _addedEL ){
				_contentClip.horizontalBar.grip.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
				_addedEL = false;
			}
		}
		
		private function onMouseDown($e:MouseEvent):void{
			_offsetY = _contentClip.horizontalBar.mouseY - _contentClip.horizontalBar.grip.y;
			_mouseDown = true;
			$e.stopPropagation();
		}
		
		private function onMouseUp($e:MouseEvent):void{
			_mouseDown = false;
			
		}
		
		override public function onTick():void{
			if( _mouseDown){
				var max:Number = _contentClip.horizontalBar.max;
				var my:Number = _contentClip.horizontalBar.mouseY - _offsetY;
				if( my < 0 )
					_contentClip.horizontalBar.grip.y = 0;
				else if( my > max )
					_contentClip.horizontalBar.grip.y = max;
				else		
					_contentClip.horizontalBar.grip.y = my;				
				_contentClip.updatePosition();
			}
		
		}
		
		public function resize():void{
		
		}
		
		
	}
}