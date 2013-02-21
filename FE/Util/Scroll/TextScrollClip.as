package com.fantage.module.FE.Util.Scroll
{
	
	import flash.display.MovieClip;
	import flash.text.TextField;

	public class TextScrollClip extends MovieClip
	{
		private var _textField:TextField;
		private var _scrollBar:ScrollBar;
		
		public function TextScrollClip($width:Number, $height:Number,$content:String)
		{
			_textField = new TextField();
			_textField.width = $width;
			_textField.height = $height;
			_textField.multiline = true;
			_textField.background = true;
			_textField.backgroundColor = 0x6633CC;
			_textField.wordWrap = true;
			_textField.x = 0;
			_textField.y = 0;
			
			_textField.text = $content;
			addChild( _textField );
						
			_scrollBar = new ScrollBar( $width, $height, $width, _textField.textHeight );
			_scrollBar.x = $width;
			addChild( _scrollBar );
		}
		
		public function updatePosition():void{
			_textField.scrollV = Math.round( (_textField.maxScrollV-1)* _scrollBar.gripAt()) + 1;
			trace("scrollH =",int(_scrollBar.gripAt() * _textField.textHeight - _textField.height),_textField.scrollH );
		}
		
		
	}
}