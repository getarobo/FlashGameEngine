package com.fantage.module.FE.project.rasteravatar_tool_2.components
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.Component.Extended.BitmapRenderComponent;
	import com.fantage.module.FE.FE;
	
	import flash.events.MouseEvent;
	
	public class ItemClip2ControlComponent extends ControlComponent
	{
		private var _scale:Number;
		private var _addedEL:Boolean = false;
		
		public function ItemClip2ControlComponent()
		{
			super();
		}
		
		override public function inited():void{
			(render as BitmapRenderComponent).bitmap.scaleX = _scale;
			(render as BitmapRenderComponent).bitmap.scaleY = _scale;
		}

		private function addEL():void{
			if( !_addedEL ){
				(render as BitmapRenderComponent).bitmap.addEventListener( MouseEvent.MOUSE_OVER, onMouseOver);
				(render as BitmapRenderComponent).bitmap.addEventListener( MouseEvent.MOUSE_OUT, onMouseOut);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove);
				(render as BitmapRenderComponent).bitmap.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp);
				_addedEL = true;
			}
		}
		private function removeEL():void{
			if( _addedEL ){
				(render as BitmapRenderComponent).bitmap.removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver);
				(render as BitmapRenderComponent).bitmap.removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove);
				(render as BitmapRenderComponent).bitmap.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp);
				_addedEL = false;
			}
		}
		
		
		
		public function get scale():Number{
			return _scale;
		}

		public function set scale(value:Number):void{
			_scale = value;
		}

	}
}