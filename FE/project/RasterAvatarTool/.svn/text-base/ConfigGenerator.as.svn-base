package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.rasteravatar.RasterAvatar;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;


	public class ConfigGenerator extends MovieClip
	{
		private var _xPosText:TextField;
		private var _yPosText:TextField;
		private var _colText:TextField;
		private var _rowText:TextField;
		private var _configText:TextField;
		
		private var _itemConfig:RasteravatarItemConfig;
		private var _itemBitmap:Bitmap;

		
		public function ConfigGenerator()
		{
			_xPosText = this["xPos_"];
			_yPosText = this["yPos_"];
			_colText = this["col_"];
			_rowText = this["row_"];
			_configText = this["config_"];
		}
		
		public function init($item:ItemInfo, $itemBitmap:Bitmap):void{
			//type
			_itemConfig = RasterAvatarConfiguration.getConfigByType($item.userAsset.asset.type);
			_itemConfig.name = $item.userAsset.asset.name;
			//partWith/partHeight
			_itemBitmap = $itemBitmap;
			_itemConfig.partHeight = _itemBitmap.height;
			_itemConfig.partWidth = _itemBitmap.width;
			
			_configText.text = _itemConfig.getString();
		}
		
/*		public function setPartNum($num:int):void{
			_itemConfig.partNum = $num;
			_configText.text = _itemConfig.getString();
		}*/
		
		public function setCol($col:int):void{
			_itemConfig.col = $col;
			_configText.text = _itemConfig.getString();

		}
		
		public function setRow($row:int):void{
			_itemConfig.row = $row;
			_configText.text = _itemConfig.getString();
		
		}
		
		
		public function setX($x:int):void{
			_itemConfig.xPos = $x;
			_configText.text = _itemConfig.getString();
		}
		
		public function setY($y:int):void{
			_itemConfig.yPos = $y;
			_configText.text = _itemConfig.getString();
		}

	
		
		
		public function get itemConfig():RasteravatarItemConfig{
			return _itemConfig;
		}

		public function set itemConfig(value:RasteravatarItemConfig):void{
			_itemConfig = value;
		}

		public function get configText():TextField{
			return _configText;
		}

		public function set configText(value:TextField):void{
			_configText = value;
		}

		public function get rowText():TextField{
			return _rowText;
		}

		public function set rowText(value:TextField):void{
			_rowText = value;
		}

		public function get colText():TextField{
			return _colText;
		}

		public function set colText(value:TextField):void{
			_colText = value;
		}

		public function get yPosText():TextField{
			return _yPosText;
		}

		public function set yPosText(value:TextField):void{
			_yPosText = value;
		}

		public function get xPosText():TextField{
			return _xPosText;
		}

		public function set xPosText(value:TextField):void{
			_xPosText = value;
		}

	}
}