package com.fantage.module.FE.project.rasteravatar_tool_2.components
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.RasterAvatarTool.ItemBitmap;
	import com.fantage.module.FE.project.rasteravatar_tool_2.VAR;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class ItemClipControlComponent extends ControlComponent
	{
		private var _addedEL:Boolean = false;
		private var _isMouseDown:Boolean = false;
		private var _mouseOffset:Point = new Point();
		private var _avatarOffsetY:int = 0;
		private var _currentScale:int = 4;
		
		private var _col:int = 1;
		private var _row:int = 1;
		
		private var _itemBitmap:ItemBitmap;
		
		//private var _bitmapData:BitmapData;
		public function ItemClipControlComponent()
		{
			super();
		}
		
	

		public function get bitmapData():BitmapData{
			return _itemBitmap.bitmapData;
		}

		public function set bitmapData(value:BitmapData):void{
			_itemBitmap = new ItemBitmap(value);
		}

		public function start():void{
			addEL();
		}
		public function stop():void{
			removeEL();
		}
		
		private function addEL():void{
			if( !_addedEL ){
				(render as MovieClipRenderComponent).clip.addEventListener( MouseEvent.MOUSE_OVER, onMouseOver);
				(render as MovieClipRenderComponent).clip.addEventListener( MouseEvent.MOUSE_OUT, onMouseOut);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove);
				(render as MovieClipRenderComponent).clip.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp);
				_addedEL = true;
			}
		}
		private function removeEL():void{
			if( _addedEL ){
				(render as MovieClipRenderComponent).clip.removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver);
				(render as MovieClipRenderComponent).clip.removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove);
				(render as MovieClipRenderComponent).clip.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
				FE.mainStage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp);
				_addedEL = false;
			}
		}
		
		override public function destroyed():void{
			removeEL();
		}
		
		private function onMouseOver($e:MouseEvent):void{
			var mc:MovieClip = (render as MovieClipRenderComponent).clip;
			mc.graphics.clear();
			mc.graphics.lineStyle(2, 0xFF0000);
			mc.graphics.moveTo(0,0);
			mc.graphics.lineTo(bitmapData.width ,0);
			mc.graphics.lineTo( bitmapData.width , bitmapData.height);
			mc.graphics.lineTo( 0,bitmapData.height);
			mc.graphics.lineTo( 0,0);
		}
		private function onMouseOut($e:MouseEvent):void{
			var mc:MovieClip = (render as MovieClipRenderComponent).clip;
			mc.graphics.clear();
		}
		private function onMouseMove($e:MouseEvent):void{
			var mc:MovieClip = (render as MovieClipRenderComponent).clip;
			if( _isMouseDown ){
		//		trace("[T2] ICCC: onMouseMove:", spatial.position);
				var posX:Number = (FE.mainStage.mouseX - _mouseOffset.x*mc.scaleX);
				var posY:Number = (FE.mainStage.mouseY - _mouseOffset.y*mc.scaleY);
				
				var xx:int = Math.floor( posX / mc.scaleX ) * mc.scaleX;
				var yy:int = Math.floor( posY / mc.scaleY ) * mc.scaleY;
		/*		
				var x
				Math.round(
				var xx:int = int(FE.mainStage.mouseX- _mouseOffset.x*mc.scaleX) % mc.scaleX;
				var yy:int = int(FE.mainStage.mouseY- _mouseOffset.y*mc.scaleY) % mc.scaleY;
				var x:int = int((int(FE.mainStage.mouseX- _mouseOffset.x*mc.scaleX) - xx ));
				var y = int((int(FE.mainStage.mouseY- _mouseOffset.y*mc.scaleY) - yy ));
		*/
		//		trace("[T2] ICCC: xx:", xx,VAR.ITEM_SC.x,"yy:",yy, VAR.ITEM_SC.y,"\n");

				spatial.position = new Point(xx - VAR.ITEM_SC.x-2,yy- VAR.ITEM_SC.y);
				VAR.ITEMMAP_CONTROL.setX( (xx - VAR.ITEM_SC.x-2)/mc.scaleX );
				VAR.ITEMMAP_CONTROL.setY( (yy- VAR.ITEM_SC.y)/mc.scaleY +25 -(_avatarOffsetY/_currentScale) );
			}
			
	/*		var xPos:int = int(mc.x/mc.scaleX);
			var yPos:int = int((mc.y/mc.scaleY)+7);*/
		}
		
		override public function inited():void{
			super.inited();
		//	_itemBitmap = new ItemBitmap( bitmapData );
			if( _itemBitmap )
				(render as MovieClipRenderComponent).clip.addChild( _itemBitmap );
		}
		
		private function onMouseDown($e:MouseEvent):void{
			_isMouseDown = true;
			_mouseOffset.x = $e.localX;
			_mouseOffset.y = $e.localY;
		}
		private function onMouseUp($e:MouseEvent):void{
			_isMouseDown = false;
		}
		
		public function get row():int{
			return _row;
		}
		
		public function set row(value:int):void{
			trace("[T2] ICCC: row:", _row);
			_row = value;
			_itemBitmap.row = _row;
			//((render as MovieClipRenderComponent).clip.getChildAt(0) as ItemBitmap).row = _row;
		}
		
		public function setX($x:int):void{
			var x:int = $x * _currentScale;
			var p:Point = spatial.position;
			p.x = x;
			spatial.position = p;
		}
		
		public function setY($y:int):void{
			var y:int = ( $y + ( _avatarOffsetY/_currentScale) - 25 ) * _currentScale;
			var p:Point = spatial.position;
			p.y = y;
			spatial.position = p;
		}
		
		
		
		public function get col():int{
			return _col;
		}
		
		public function set col(value:int):void{
			trace("[T2] ICCC: col:", _col);
			_col = value;
			_itemBitmap.col = _col;
			//((render as MovieClipRenderComponent).clip.getChildAt(0) as ItemBitmap).col = _col;
		}
		public function get avatarOffsetY():Number{
			return _avatarOffsetY;
		}
		
		public function set avatarOffsetY(value:Number):void{
			_avatarOffsetY = value;
		}
	}
}