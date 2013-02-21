package com.fantage.module.FE.Util.Sound
{
	import com.fantage.module.FE.Util.SoundManagerSA;
	//	import com.junkbyte.console.Cc;
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class SoundCategorySA
	{
		private var _category:String = "";
		private var _manager:SoundManagerSA;
		private var _channel:SoundChannel;
		private var _transform:SoundTransform;
		private var _volume:Number = 1;
		private var _muted:Boolean = false;
		
		public function SoundCategorySA($category:String, $volume:Number, $soundManager:SoundManagerSA)
		{
			_transform = new SoundTransform($volume);
			_volume = $volume;
			_category = $category;
			_manager = $soundManager;
		}
		
		public function get transform():SoundTransform{
			return _transform;
		}
		
		public function get categoryName():String{
			return _category;
		}
		public function set categoryName($cg:String):void{
			_category = $cg;
		}
		public function get muted():Boolean{
			return _muted;
		}
		public function set muted($muted:Boolean):void{
			_muted = $muted;
			if( _muted ){
				_transform.volume = 0;;
			}else{
				this.volume = _volume;
			}
		}
		
		public function print():void{
			//		Cc.log("[SoundCategory] name:",_category, "volume:", _volume, "muted:", _muted);
		}
		
		
		
		public function get volume():Number{
			return _volume;
		}
		public function set volume($v:Number):void{
			_volume = $v;
			_transform.volume = _volume;
		}
		
		
	}
}