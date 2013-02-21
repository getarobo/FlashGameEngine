package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.Util.Scroll.ScrollClip;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import net.flashpunk.tweens.motion.Motion;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;

	public class AniConfigGenerator extends MovieClip
	{
		private var _idle:TextField;
		private var _move:TextField;
		private var _wave:TextField;
		private var _cheer:TextField;
		private var _cry:TextField;
		private var _blink:TextField;
		private var _delay:TextField;
		private var _ms:TextField;
		private var _create:SimpleButton;
		
		private var _config:TextField;
		
		private var _item:ItemInfo;
		private var _type:String;
		
		public function AniConfigGenerator()
		{
			_idle = this["idle_"];
			_move = this["move_"];
			_wave = this["wave_"];
			_cheer = this["cheer_"];
			_cry = this["cry_"];
			_blink = this["blink_"];
			_delay = this["delay_"];
			_ms = this["ms_"];		
			_create = this["create_"];
			_config = this["config_"];
			
			_create.addEventListener(MouseEvent.CLICK, onClick);
			
			var s:String = "12f";
			trace( isNaN(int(s)) );
			
			
		}
		
		public function init($item:ItemInfo):void{
			_item = $item;
			_type = _item.userAsset.asset.type;
		}
		
		
		private function onClick($e:MouseEvent):void{
			trace("onCLick");
			var delay:int = int( _delay.text );
			var ms:int = int( _ms.text );
			
			
			var idleMotion:MotionInfo = createMotionInfo( "IDLE", delay, ms, _idle );
			
			var moveMotion:MotionInfo = createMotionInfo( "MOVE", delay, ms, _move );
			
			var waveMotion:MotionInfo = createMotionInfo( "WAVE", delay, ms, _wave );
			
			var cheerMotion:MotionInfo = createMotionInfo( "CHEER", delay, ms, _cheer );
			
			var cryMotion:MotionInfo = createMotionInfo( "CRY", delay, ms, _cry );
			
			var blinkMotion:MotionInfo = createMotionInfo( "BLINK", delay, ms, _blink );
			
			var name:String = "";
			if( _item )
				name = _item.userAsset.asset.name;
			
			var config:String = "<item name=\""+name+"\">\n";
			config += createMotion(idleMotion);
			config += createMotion(moveMotion);
			config += createMotion(waveMotion);
			config += createMotion(cheerMotion);
			config += createMotion(cryMotion);
			config += createMotion(blinkMotion);
			config += "</item>";
			
			_config.text = config;
			
		}
		
		
		private function createMotionInfo($name:String,$delay:int,$ms:int, $text:TextField):MotionInfo{
			if( $text.text.length == 0 )
				return new MotionInfo( $name, _type, [] );
			
			var text:String = $text.text;
			text = text.split("\r").join("");
			var frame:Array = text.split( "," );
			
			var frames:Array = [];
			for each ( var step:String in frame ){
				trace("int:",step,"num:", Number(step), "valid:", isNaN(Number(step)) );
				if( step != "" && !isNaN( int(step) ) ){
					frames.push( new FrameInfo($delay, $ms, _type, int(step) ) );
				}
			}
			trace("frames:", frames.length);
			var motions:MotionInfo = new MotionInfo( $name, _type, frames );
			return motions;
		}
		
		private function createFrame($frameInfo:FrameInfo):String{
			var frame:String = "\t\t<frame delay=\""+$frameInfo.delay+"\" ms=\""+$frameInfo.ms+"\">\n";
			frame +=              "\t\t\t<set name=\""+$frameInfo.name+"\" sprite=\""+$frameInfo.sprite+"\"/>\n";
			frame +=              "\t\t</frame>\n";
			return frame;		
		}
		
		private function createMotion( $motionInfo:MotionInfo):String{
			if( $motionInfo.frames.length == 0 )
				return "";
			
			var motion:String = "\t<motion name=\""+$motionInfo.name+"\" target=\""+$motionInfo.target+"\"";
			if( $motionInfo.repeat )
				motion += " repeat=\"true\"";
			if( $motionInfo.allowIntercept )
				motion += " allowIntercept=\"true\"";
			motion += ">\n";
			
			for each ( var frameInfo:FrameInfo in $motionInfo.frames ){
				motion += createFrame( frameInfo );
			}
			
			motion += "\t</motion>\n";
			
			return motion;
		}
		
		
		
		
	}
}