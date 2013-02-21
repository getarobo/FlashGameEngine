package com.fantage.module.FE.Manager
{
	import com.fantage.module.FE.FE;
	import com.junkbyte.console.Cc;

	public class ScoreManager
	{
		
		private var _types:Array;
		
		private var _scores:Object;
		private var _time:Object;
		private var _score:Number = 0;
		
		public function ScoreManager()
		{
			_scores = new Object();
			_time = new Object();
			_scores.score = 0;
		}
		
		public function get score():Number{
			return _score;
		}
		public function set score($s:Number):void{
			_score = $s;
			_scores.gameScore = _score;
			if( _score > 0 ){
				FE.bridge.gameSetScore( _score );
				gameUpdateUI();
				Cc.log( "[SCORE] score:", _score, FE.bridge);
			}
		}	
		public function init($properties:Array):void{
			_types = $properties;
			for each( var property:String in $properties){
				_scores[property] = 0;
			}
		//	gameUpdateUI();
		}
		
		public function gameUpdateUI():void{
			if( FE.bridge ){
				FE.bridge.gameUpdateUI( _scores );
			}else{
				throw new Error("[ScoreManager - gameUpdateUI] bridge is null");
			}				 
		}
		
							 
		public function shutDown():void{
			_scores = null;
		}
		
		public function setProperty($score:Number, $label:String = "gameScore"):void{
			if( $label == "gameTime"){
				_time.gameTime = $score;
				FE.bridge.gameUpdateUI( _time );
			}else
				_scores[$label] = $score;
			gameUpdateUI();
		}
		
		public function updateProperty($var:*, $label:String):void{
			var obj:Object = new Object();
			obj[$label] = $var;
			FE.bridge.gameUpdateUI( obj );
		}
		
		/*
		public function changeScore($score:Number, $label:String = "gameScore"):void{
			_scores[$label] += $score;
			gameUpdateUI();
		}*/
		
		public function getProperty($label:String):*{
			if( _scores.hasOwnProperty( $label ) ){
				return _scores[$label];
			}else{
				throw new Error("[Score Manager - getScore]"+ $label+", such property does not exist");
			}
			return -1;
		}
		
		public function updateFinalScore():void{ 
			if( _score > 0 ){
				var obj:Object = new Object();
				obj.gameScore = _score;
				FE.bridge.gameUpdateUI( obj );
				FE.bridge.gameSetScore( int(_score) );
				gameUpdateUI();
			}
		}
		
		public function calculateFinalScore():Number{
			return _score;
		}
	}
}