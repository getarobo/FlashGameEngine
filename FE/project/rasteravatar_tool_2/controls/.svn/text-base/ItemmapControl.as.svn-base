package com.fantage.module.FE.project.rasteravatar_tool_2.controls
{
	import caurina.transitions.Tweener;
	
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.MovieClipScrollControlComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.RasterAvatarTool.RasterAvatarConfiguration;
	import com.fantage.module.FE.project.RasterAvatarTool.RasteravatarItemConfig;
	import com.fantage.module.FE.project.rasteravatar_tool_2.VAR;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.ui.Keyboard;

	public class ItemmapControl extends MovieClip
	{
		private var _xPosText:TextField;
		private var _yPosText:TextField;
		private var _colText:TextField;
		private var _rowText:TextField;
		private var _configText:TextField;
		
		private var _itemConfig:RasteravatarItemConfig;
		private var _itemBitmap:Bitmap;
		
		private var _myself:iEntity;
		private var _hidden:Boolean = true;
		
		
		
		
		
		
		
		public function ItemmapControl()
		{
			trace("ITEMMAPCONTROL");
			_xPosText = this["xPos_"];
			_yPosText = this["yPos_"];
			_colText = this["col_"];
			_rowText = this["row_"];
			_configText = this["config_"];
		}
		
		
		public function start():void{
			
			if( _myself == null ){
				_myself = FE.allocateEntity();
				
				var spatial:SpatialComponent = new SpatialComponent();
				spatial.position = new Point(-350, FE.mainStage.stageHeight/2-250);
				
				var render:MovieClipRenderComponent = new MovieClipRenderComponent();
				render.clip = this;
				render.scene = VAR.UI_SC; 
				
				render.clip.tab_.addEventListener(MouseEvent.CLICK, onHide);
				render.clip.tab_.buttonMode = true;
				
				_myself.setMVC( spatial, render);
				_myself.init("SearchTab");
				
				_xPosText.addEventListener( KeyboardEvent.KEY_DOWN, onPosX );
				_yPosText.addEventListener( KeyboardEvent.KEY_DOWN, onPosY );
				_colText.addEventListener( KeyboardEvent.KEY_DOWN, onColEnter);
				_rowText.addEventListener( KeyboardEvent.KEY_DOWN, onRowEnter);
				
				_xPosText.addEventListener( Event.CHANGE, onPosX );
				_yPosText.addEventListener( Event.CHANGE, onPosY );
				_colText.addEventListener( Event.CHANGE, onColEnter);
				_rowText.addEventListener( Event.CHANGE, onRowEnter);
			}	
		}
		
		private function onChange($e:Event):void{
			trace("CHNAGE DESTECTED");
		}
		
		private function onPosX($e:Event):void{
			if( _xPosText.text == "-"){
				VAR.DISPLAY_CONTROL.setX(int( _xPosText.text ));
			}else{
				VAR.DISPLAY_CONTROL.setX(int( _xPosText.text ));
				setX( int( _xPosText.text ) );
			}
		}
		private function onPosY($e:Event):void{
			if( _yPosText.text == "-"){
				VAR.DISPLAY_CONTROL.setY(int( _yPosText.text ));
			}else{
				VAR.DISPLAY_CONTROL.setY(int( _yPosText.text ));
				setY( int( _yPosText.text ) );
			}
		}
		
		private function onColEnter($e:Event):void{
			VAR.DISPLAY_CONTROL.setCol( int(_colText.text) );
			setCol( int( _colText.text) );
		}
		private function onRowEnter($e:Event):void{
			VAR.DISPLAY_CONTROL.setRow( int(_rowText.text) );
			setRow( int( _rowText.text ) );
		}
		
		public function resize():void{
			if( _hidden ){
				hideDone();
			}else{
				showDone();
			}
		}
	
		private function onHide($e:MouseEvent):void{
			if( _hidden){
				_hidden = false;
				Tweener.addTween( this, {x:0, y:FE.mainStage.stageHeight/2-250, time:0.5, transition:"easeInOutCubic", onComplete:showDone});
			}else{
				_hidden = true;
				Tweener.addTween( this, {x:-350, y:FE.mainStage.stageHeight/2-250, time:0.5, transition:"easeInOutCubic", onComplete:hideDone});
			}
		}
		private function hideDone():void{
			_myself.getSpatial().position = new Point( -350, FE.mainStage.stageHeight/2-250);
		}
		private function showDone():void{
			_myself.getSpatial().position = new Point( 0, FE.mainStage.stageHeight/2-250);
		}
		
		
		public function init($item:*, $itemBitmap:Bitmap):void{
			//type
			_itemConfig = RasterAvatarConfiguration.getConfigByType($item.userAsset.asset.type);
			_itemConfig.name = $item.userAsset.asset.name;
			//partWith/partHeight
			_itemBitmap = $itemBitmap;
			_itemConfig.partHeight = _itemBitmap.height;
			_itemConfig.partWidth = _itemBitmap.width;
			
			_configText.text = _itemConfig.getString();
			
			if( _hidden ){
				_hidden = false;
				Tweener.addTween( this, {x:0, y:FE.mainStage.stageHeight/2-250, time:0.5, transition:"easeInOutCubic", onComplete:showDone});
			}
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
			_xPosText.text = ""+$x;
			_itemConfig.xPos = $x;
			_configText.text = _itemConfig.getString();
		}
		
		public function setY($y:int):void{
			_itemConfig.yPos = $y;
			_yPosText.text = ""+ $y;
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