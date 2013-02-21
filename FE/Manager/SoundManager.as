package com.fantage.module.FE.Manager
{
//	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Manager.Sound.SoundCategory;
	import com.fantage.module.FE.Manager.Sound.SoundInfo;
//	import com.junkbyte.console.Cc;
	
	import flash.media.Sound;
	import flash.utils.Dictionary;

	public class SoundManager
	{
		private var _categoryList:Dictionary; 
		private var _playingSounds:Dictionary;
		private var _soundList:Object;
		
		private var _muted:Boolean = false;
		
		public function SoundManager()
		{
			_categoryList = new Dictionary(true);
			_soundList = new Object();
			_playingSounds = new Dictionary(true);
		}
		
		public function get soundEnabled():Boolean{
			return !_muted;
		}
		
		public function mute($channel:String = "sfx"):void{
			_muted = true;
			getChannel($channel).volume = 0;
			for each ( var si:SoundInfo in _playingSounds){
				si.volume = 0;
			}
		}
		
		public function unmute($channel:String = "sfx"):void{
			_muted = false;
			getChannel($channel).volume = 1;
			for each ( var si:SoundInfo in _playingSounds){
				si.volume = 1;
			}
		}
		
		
		
		public function shutDown():void{
			stopAll();
			for( var k:Object in _categoryList )
				_categoryList[k] = null;
			for( var j:Object in _playingSounds ){
				if( _playingSounds[j] != null )
					_playingSounds[j].cleanUp();
				_playingSounds[j] = null;
			}
			_categoryList = null;
			_playingSounds = null;
			_soundList = null;
		}
		
		public function registerSound( $sound:Sound, $soundName:String, $category:* = null):SoundInfo{
			var soundInfo:SoundInfo;
			if( _soundList[$soundName] == null){
				if( $category == null){
		//			Cc.log("[SM] null  category:", $category);
					soundInfo = new SoundInfo( $sound, $soundName, getChannel("sfx"), this );
				}else if( $category is String ){
		//			Cc.log("[SM] string category:", $category);
					soundInfo = new SoundInfo( $sound, $soundName, getChannel($category), this );
				}else{
		//			Cc.log("[SM] not string category:", $category);
					soundInfo = new SoundInfo( $sound, $soundName, $category, this );
				}
				_soundList[$soundName] = soundInfo;
				trace("[SM] sound registered -",$soundName,$sound,_soundList[$soundName]);
				return soundInfo;
			}else{
				trace("[SM] sound name already exist");
			}
			return soundInfo;
		} 

		public function play( $sound:*,$loopCount:int = 1, $soundName:String = "", $category:String = "sfx", $volume:Number =1 ):void{
			//if( _muted ) return;
			var soundInfo:SoundInfo;
			if( $sound is Sound ){
				soundInfo = registerSound( $sound, $soundName, getChannel($category,$volume) );
				_playingSounds[$soundName] = soundInfo;
				soundInfo.play($loopCount);
			}else if( $sound is String ){
				soundInfo = _soundList[$sound];
				_playingSounds[$sound as String] = soundInfo;
				if( soundInfo )
					soundInfo.play($loopCount);
			}
		}
		
		public function removeFromPlatingSounds($soundName:String){
			if( _playingSounds )
				_playingSounds[$soundName] = null;
		}
		
		public function getChannel( $category:String, $volume:Number = 1 ):SoundCategory{
			return $category in _categoryList ? _categoryList[$category] : _categoryList[$category] = new SoundCategory($category,$volume, this);
		}
		
		public function stopAll():void{
			for each ( var si:SoundInfo in _playingSounds ){
				if( si )
					si.stop();
			}
			for( var key:Object in _playingSounds ){
				_playingSounds[key] = null;
			}
		}
		
		public function stop($soundName:String):void{
			if( _playingSounds[$soundName] )
				_playingSounds[$soundName].stop();
		}
		
		
		
		public function stopCategory($category:String):void{
			
		}
		
		public function printSoundList():void{
			for each( var si:SoundInfo in _soundList ){
				si.print();
			}
		}
		
		public function printCategoryList():void{
			for each( var cate:SoundCategory in _categoryList){
				cate.print();
			}
		}
		
	}
}