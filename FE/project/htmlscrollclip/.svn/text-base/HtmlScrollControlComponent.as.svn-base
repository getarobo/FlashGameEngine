package com.fantage.module.FE.project.htmlscrollclip
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.Scroll.ScrollBar;
	import com.fantage.module.FE.Util.Scroll.reference.HtmlScrollClip;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.sampler.stopSampling;
	
	public class HtmlScrollControlComponent extends ControlComponent
	{
		private var _index:int = 0;
		private var _min:Number=0;
		private var _max:Number=0;
		
		private var _addEL:Boolean = false;
		private var _mouseDown:Boolean = false;
		private var _offsetY:Number;

		public function HtmlScrollControlComponent()
		{
			super();
		}

		public function get index():int{
			return _index;
		}

		public function set index(value:int):void{
			_index = value;
		}
		
		public function relocate($at:Number):void{
			var p:Point = spatial.position;
			p.x -= $at;
			p.y = FE.mainStage.stageHeight/2 - 300;
			if( p.x < - 500 )
				removeThis();
			else if( p.x > FE.mainStage.stageWidth )
				removeThis();
			else{
				render.addFromScene();
				spatial.position = p;
			}
		}
		
		private function removeThis():void{
			render.removeFromScene();
		}
		
		
		private function addEL():void{
			if( !_addEL ){
				(render as MovieClipRenderComponent).clip.scrollBar.grip.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
				_addEL = true;
			}
		}
		
		private function removeEL():void{
			if( _addEL ){
				(render as MovieClipRenderComponent).clip.scrollBar.grip.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
				_addEL = false;
			}
		}
		
		private function onMouseDown($e:MouseEvent):void{
			var clip:HtmlScrollClip = HtmlScrollClip(render.clip);
			_offsetY = clip.scrollBar.mouseY - clip.scrollBar.grip.y;
			_mouseDown = true;

			trace("onMouseDOwn:",_offsetY);
		}
		
		private function onMouseUp($e:MouseEvent):void{
			$e.stopPropagation();
			_mouseDown = false;
		}
		
		override public function onTick():void{
			if( _mouseDown){
				var clip:HtmlScrollClip = HtmlScrollClip(render.clip);
				var max:Number = clip.scrollBar.max;
				var my:Number = clip.scrollBar.mouseY - _offsetY;
				if( my < 0 )
					clip.scrollBar.grip.y = 0;
				else if( my > max )
					clip.scrollBar.grip.y = max;
				else		
					clip.scrollBar.grip.y = my;				
				clip.updatePosition();
			}
		}
		
		override public function inited():void{
			addEL();
		}
		
		override public function destroyed():void{
			removeEL();
		}

	}
}