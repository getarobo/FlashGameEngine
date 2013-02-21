package com.fantage.module.FE.Util.Scroll
{
	import com.fantage.client.entity.Asset;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class ScrollClip extends MovieClip
	{
		private var _contentClip:MovieClip;
		private var _clipWidth:Number;
		private var _clipHeight:Number;
		
		private var _horizontalBar:ScrollBar;
		private var _varticalBar:ScrollBar;
		
		private var _containerWidth:Number;
		private var _containerHeight:Number;
	
		private var _itemCount:int = 0;
		private var _itemList:Object = new Object();
		
		private var _maxHeight:Number;
		private var _currentHeight:Number;
		
		public function ScrollClip( $content:MovieClip, $width:Number, $height:Number )
		{
			_contentClip = $content;

			_containerWidth = $width;
			_containerHeight = $height;		
			
			
			_clipWidth = _contentClip.width;
			_clipHeight = _contentClip.height;
			
			_contentClip.x = 0;
			_contentClip.y = 0;			
			
			addChild(_contentClip );
			craeateHorizontalScroll()
			
			_maxHeight = _clipHeight - 100;
			
			updatePosition();
		}
		
		public function addItem( $itemInfo:ItemInfo):void{
			if( _itemList.hasOwnProperty( $itemInfo.userAsset.asset.name) ){
				return;
			}else{
				$itemInfo.x = 0;
				_currentHeight = 55 + _itemCount*25;
				$itemInfo.y = 55 + _itemCount*25;
				$itemInfo.num.text = ""+(_itemCount+1);
				_contentClip.addChild( $itemInfo );
				_itemList[$itemInfo.userAsset.asset.name] = $itemInfo;
				_itemCount++;
			}
			
			if( _currentHeight + 25 > _maxHeight ){
				doubleContentSize();
			}
		
		}
		
		private function doubleContentSize():void{
			trace("double size");
			
			_contentClip.graphics.clear();
			_contentClip.graphics.beginFill(0xFF6633);
			_contentClip.graphics.drawRect( 0, 0, 750, _clipHeight*2);
			_contentClip.graphics.endFill();
			
			_contentClip.graphics.beginFill(0x99FF00);
			_contentClip.graphics.drawRect(0,0,750,50);
			_contentClip.graphics.endFill();
			
			_contentClip.graphics.beginFill(0x99FF00);
			_contentClip.graphics.drawRect(0,_clipHeight*2-50,750,50);
			_contentClip.graphics.endFill();
			
			_clipWidth = _contentClip.width;
			_clipHeight =  _clipHeight*2;
			
			_maxHeight = _clipHeight-100;	

			_horizontalBar.resize(_clipHeight);
		}
		
		
		
		
		
		
		
		
		
		
		public function get horizontalBar():ScrollBar{
			return _horizontalBar;
		}

		public function set horizontalBar(value:ScrollBar):void{
			_horizontalBar = value;
		}

		public function get clipHeight():Number{
			return _clipHeight;
		}

		public function set clipHeight(value:Number):void{
			_clipHeight = value;
		}

		public function get clipWidth():Number{
			return _clipWidth;
		}

		public function set clipWidth(value:Number):void{
			_clipWidth = value;
		}

		public function initialize():void{
			_contentClip.x = 0 ;
			_contentClip.y = 0 ;
			this.addChild( _contentClip );
		//craeateHorizontalScroll();
		}
				
		//SETTER & GETTER		
		private function craeateHorizontalScroll():void{
			_horizontalBar = new ScrollBar(_containerWidth, _containerHeight, _clipWidth, _clipHeight);
			_horizontalBar.x = _clipWidth;
			_horizontalBar.y = 0;
			addChild( _horizontalBar );
		}
		
		private function createVerticleScroll():void{
		
		}
		
		private function addELHroizontal():void{
/*			_horizontalBar.grip.addEventListener( MouseEvent.MOUSE_DOWN );
			FE.mainStage.addEventListener( MouseEvent.MOUSE_UP );*/
		}
		
		public function updatePosition():void{
			var yy:Number = - (_contentClip.height - _clipHeight)* _horizontalBar.gripAt() ;
			var rect:Rectangle = new Rectangle( 0, yy, _containerWidth, _containerHeight );
			_contentClip.scrollRect = rect;
			
			
//			trace("scrollH =",int(_horizontalBar.gripAt() * _textField.textHeight - _textField.height),_textField.scrollH );

		
		}
		
		
				
		

	}
}