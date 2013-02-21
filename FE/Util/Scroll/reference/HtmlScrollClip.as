package com.fantage.module.FE.Util.Scroll.reference
{
	import com.fantage.module.FE.Util.Scroll.ScrollBar;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;

	public class HtmlScrollClip extends MovieClip
	{
		private var _textField:TextField;
		private var _scrollBar:ScrollBar;
		
		public function HtmlScrollClip( $xml:XML )
		{
			this.mouseEnabled = false;
			
			_textField = new TextField();
			_textField.width = 400;
			_textField.height = 600;
			_textField.multiline = true;
			_textField.background= true;
			_textField.wordWrap =  true;
			_textField.backgroundColor = 0x6633CC;
			_textField.x = 0;
			
			addChild( _textField );
			_textField.htmlText = $xml.html;
			trace("height:", _textField.height, _textField.maxScrollH, _textField.textHeight );
		
			_scrollBar = new ScrollBar(400,600, 400, _textField.textHeight);
			_scrollBar.buttonMode = true;
			_scrollBar.x = 400;
			addChild( _scrollBar );
		}

		public function updatePosition():void{
		//	trace("scrollH =", _scrollBar.gripAt() * _textField.textHeight);
			_textField.scrollV = Math.round( (_textField.maxScrollV-1)* _scrollBar.gripAt()) + 1;
			trace("scrollH =",int(_scrollBar.gripAt() * _textField.textHeight - _textField.height),_textField.scrollH );
		}
		
		
		public function get scrollBar():ScrollBar{
			return _scrollBar;
		}

		public function set scrollBar(value:ScrollBar):void{
			_scrollBar = value;
		}

		public function get textField():TextField{
			return _textField;
		}

		public function set textField(value:TextField):void{
			_textField = value;
		}

	}
}