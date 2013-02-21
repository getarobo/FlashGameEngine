package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.FE;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import sejong.util.tools.StringTools;
	import sejong.util.tools.ToolsHelper;
	
	
	public class ItemBitmap extends Bitmap
	{
		private var _itemBitmapData:BitmapData;
		private var _partNum:int = 1;
		private var _partIndex:int = 0;
		private var _rect:Rectangle;
		private var _col:int = 1;
		private var _row:int = 1;
		private static const _$:ToolsHelper = ToolsHelper.instance();
		
		public function ItemBitmap($bitmapData:BitmapData)
		{
			this.itemBitmapData = $bitmapData;
			_rect = new Rectangle(0,0, bitmapData.width, bitmapData.height );
			

		}
		
		
		public function get row():int{
			return _row;
		}
		
		public function set row(value:int):void{
			_row = value;
			if( _row <= 0 )
				_row = 1;
			trace("[T2] ItemBitmap: Row:", value, "col:",_col,"row:",_row);
			partNum = _row*_col;
		}
		
		public function get col():int{
			return _col;
		}
		
		public function set col(value:int):void{
			_col = value;
			if( _col <= 0 )
				_col = 1;
			trace("[T2] ItemBitmap: Col:", value, "col:",_col,"row:",_row);

			partNum = _row*_col;
		}
		
		public function get partIndex():int{
			return _partIndex;
		}
		
		public function set partIndex(value:int):void{
			if( _partIndex != value ){
				_partIndex = value;
				var width:Number = _itemBitmapData.width / _col ;
				var height:Number = _itemBitmapData.height / _row ;
				_rect.width = width;
				_rect.x = width * int( _partIndex % _col );
				_rect.height = height;
				_rect.y = height * int( _partIndex / _col ) ;
				trace("[ItemBitmap] index:", _partIndex,"x:",int( _partIndex % _col ),"y:",int( _partIndex / _col )," rect:", _rect.toString() );
				var tempMap:BitmapData = new BitmapData(_rect.width, _rect.height);
				tempMap.copyPixels( _itemBitmapData, _rect, new Point(0, 0) );
				this.bitmapData = tempMap;
				
			}
			
		}
		
		public function get partNum():int{
			return _partNum;
		}
		
		public function get partWidth():Number{
			return _itemBitmapData.width / _col;
		}
		public function get partHeight():Number{
			return _itemBitmapData.height / _row;
		}
		
		public function set partNum(value:int):void{
			trace("[T2] partNum: partNum:", _partNum,"value:", value, "col:",_col,"row:",_row);

			if( _partNum != value ){
				
				_partNum = value;
				trace("[IBM] partNum:", _partNum);
				var width:Number = _itemBitmapData.width / _col ;
				var height:Number = _itemBitmapData.height / _row ;
				_rect.width = width;
				_rect.x = 0;
				_rect.height = height;
				_rect.y = 0;
				var tempMap:BitmapData = new BitmapData(_rect.width, _rect.height);
				tempMap.copyPixels( _itemBitmapData, _rect, new Point() );
				this.bitmapData = tempMap;
				//bitmapData.dispose();
				//bitmapData = tempMap;
				//bitmapData.copyPixels( _itemBitmapData, _rect, new Point(0,0) );
				trace(_$.str.format("%s","[T2] string tool test"));
//				StringTools.instance().format("%s","[T2] string");
				trace("[T2] partNum: old bitmapData width:", bitmapData.width, "height:", bitmapData.height);
		//		bitmapData = tempMap;
		//		bitmapData = null;
		//		trace("[T2] partNum: new bitmapData width:", bitmapData.width, "height:", bitmapData.height);
				_partIndex = 0;
				
			}
		}
		
		public function get itemBitmapData():BitmapData{
			return _itemBitmapData;
		}
		
		public function set itemBitmapData(value:BitmapData):void{
			_itemBitmapData = value;
			this.bitmapData = _itemBitmapData;
		}
		
	}
}