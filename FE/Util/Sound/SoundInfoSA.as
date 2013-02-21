package com.fantage.module.FE.Util.Sound
{
	//	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.SoundManagerSA;
	//	import com.junkbyte.console.Cc;
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundInfoSA
	{
		private var _soundName:String;
		private var _sound:Sound;
		private var _category:SoundCategorySA;
		private var _manager:SoundManagerSA;
		private var _channel:SoundChannel;
		private var _loopCount:int = 0;
		private var _isPlaying:Boolean = false;
		
		
		public function SoundInfoSA($sound:Sound, $soundName:String, $category:SoundCategorySA, $manager:SoundManagerSA)
		{
			_sound = $sound;
			_soundName = $soundName;
			_category = $category;
			_manager = $manager;
		}
		
		public function cleanUp():void{
			if( _channel && _channel.hasEventListener(Event.SOUND_COMPLETE) )
				_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			
		}
		
		public function play($loopCount:int):SoundChannel{
			//		Cc.log( "[SoundInfo] play -", _soundName,_sound,"for", $loopCount);
			if( $loopCount == 0 )
				_loopCount = int.MAX_VALUE;
			else
				_loopCount = $loopCount;
			if( _category == null || _category.transform == null ) return null;
			_channel = _sound.play( 0, _loopCount, _category.transform );
			_channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			_isPlaying = true;
			return _channel;
		}
		
		private function onSoundComplete($e:Event):void{
			//		Cc.log("[SoundInfo] loop -", _soundName,":", _loopCount);
			_loopCount= 0;
			if( _manager )//&& FE.started)
				_manager.removeFromPlatingSounds( _soundName );
			
			_isPlaying = false;
		}
		
		public function stop():void{
			if( _isPlaying )
				_channel.stop();
		}
		
		public function print():void{
			//		Cc.log("[SoundInfo] name:",_soundName, "category:", _category.categoryName);
		}
		
		
		
		
		public function set soundName($soundName:String):void{
			_soundName = $soundName;
		}
		public function get soundName():String{
			return _soundName;
		}
		
		public function set sound($sound:Sound):void{
			_sound = $sound;
		}
		public function get sound():Sound{
			return _sound;
		}
		
		public function set category($category:SoundCategorySA):void{
			_category = $category;
		}
		
		public function get categroy():SoundCategorySA{
			return _category;
		}
	}
}