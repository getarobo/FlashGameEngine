package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.RasterAvatarTool.ConfigGenerator;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class ItemClip extends MovieClip
	{
		private var _itemBitmap:ItemBitmap;
		private var _isMouseDown:Boolean = false;
		private var _mouseOffset:Point = new Point();
//		private var _configGen:ConfigGenerator;
		
		
		public function ItemClip($itemBitmapData:BitmapData, $config:ConfigGenerator= null)
		{
	//		_configGen = $config;
			_itemBitmap = new ItemBitmap( $itemBitmapData );
			this.addChild(_itemBitmap);
			addEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			addEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
			addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown);
			FE.mainStage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			FE.mainStage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp);
			buttonMode = true;
			//	this.mouseEnabled = false;
		}
		
		private function onMouseDown($e:MouseEvent):void{
			_isMouseDown = true;
			_mouseOffset.x = $e.localX;
			_mouseOffset.y = $e.localY;
		}
		private function onMouseUp($e:MouseEvent):void{
			_isMouseDown = false;
		}
		private function onMouseMove($e:MouseEvent):void{
			if( _isMouseDown ){
				var xx:int = int(parent.mouseX- _mouseOffset.x*scaleX) % scaleX;
				var yy:int = int(parent.mouseY- _mouseOffset.y*scaleY) % scaleY;

				x = int((int(parent.mouseX- _mouseOffset.x*scaleX) - xx ));
				y = int((int(parent.mouseY- _mouseOffset.y*scaleY) - yy ));
				
				trace("[IC] x:", x);
			}
			var xPos:int = int(x/scaleX);
			var yPos:int = int((y/scaleY)+25);
/*			_configGen.xPosText.text = ""+xPos;
			_configGen.yPosText.text = ""+yPos;
			
			_configGen.setX(xPos);
			_configGen.setY(yPos);*/
			
			//		VAR.CONFIG_MAKER.updatePosition(x,y);
		}
		
		public function changeRow($row:int):int{
			_itemBitmap.row = $row;
			return _itemBitmap.partNum;
		}
		
		public function changeCol($col:int):int{
			_itemBitmap.col = $col;	
			return _itemBitmap.partNum;
		}
		
		public function get itemBitmap():ItemBitmap{
			return _itemBitmap;
		}
		
		public function set itemBitmap(value:ItemBitmap):void{
			_itemBitmap = value;
		}
		
		private function onMouseOver($e:MouseEvent):void{
			FE.log("[IC] onMouseOver");
			graphics.clear();
			graphics.lineStyle(2, 0xFF0000);
			graphics.moveTo(0,0);
			graphics.lineTo(_itemBitmap.width ,0);
			graphics.lineTo( _itemBitmap.width , _itemBitmap.height);
			graphics.lineTo( 0,_itemBitmap.height);
			graphics.lineTo( 0,0);
			
		}
		
		private function onMouseOut($e:MouseEvent):void{
			FE.log("[IC] onMouseOut");
			graphics.clear();
		}
	}
}