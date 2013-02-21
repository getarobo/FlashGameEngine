package com.fantage.module.FE.project.rasteravatar_tool_2.controls
{
	import caurina.transitions.Tweener;
	
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.RasterAvatarTool.FrameInfo;
	import com.fantage.module.FE.project.RasterAvatarTool.MotionInfo;
	import com.fantage.module.FE.project.rasteravatar_tool_2.VAR;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import net.flashpunk.tweens.motion.Motion;

	public class ItemAniamtionControl extends MovieClip
	{
	
	
		//normal
		private var _idleN:TextField;
		private var _moveN:TextField;
		private var _wave:TextField;
		private var _cheer:TextField;
		private var _cry:TextField;
		private var _blink:TextField;
		private var _delayN:TextField;
		private var _msN:TextField;
		private var _createN:SimpleButton;
		//fult/futb
		private var _idleF:TextField;
		private var _moveF:TextField;
		private var _set0:TextField;
		private var _set1:TextField;
		private var _set2:TextField;
		private var _set3:TextField;
		private var _offset:TextField;
		private var _max:TextField;
		private var _delayF:TextField;
		private var _msF:TextField;
		private var _createF:SimpleButton;
		
		
		private var _config:TextField;
		
		private var _item:*;
		private var _type:String;
		
		private var _myself:iEntity;
		private var _hidden:Boolean = true;
		private var _created:Boolean = false;
		
		private var _fultInput:MovieClip;
		private var _normInput:MovieClip;
		
		public function ItemAniamtionControl()
		{
	/*		_idle = this["idle_"];
			_move = this["move_"];
			_wave = this["wave_"];
			_cheer = this["cheer_"];
			_cry = this["cry_"];
			_blink = this["blink_"];
			_delay = this["delay_"];
			_ms = this["ms_"];		
			_create = this["create_"];
			_config = this["config_"];
			
			_create.addEventListener(MouseEvent.CLICK, onClick);			*/
			_fultInput = this["fult_"];
			_normInput = this["norm_"];
			
			assignInputs();
			
		}
		
		private function assignInputs():void{
			//normal
			_idleN = _normInput["idle_"];
			_moveN = _normInput["move_"];
			_wave = _normInput["wave_"];
			_cheer = _normInput["cheer_"];
			_cry = _normInput["cry_"];
			_blink = _normInput["blink_"];
			_delayN = _normInput["delay_"];
			_msN = _normInput["ms_"];		
			_createN = _normInput["create_"];
	//		
			
			//FULT/FUTB
			_idleF = _fultInput["idle_"];
			_moveF = _fultInput["move_"];
			_set0 = _fultInput["set0_"];
			_set1 = _fultInput["set1_"];
			_set2 = _fultInput["set2_"];
			_set3 = _fultInput["set3_"];
			_offset = _fultInput["offset_"];
			_max = _fultInput["max_"];
			_delayF = _fultInput["delay_"];
			_msF = _fultInput["ms_"];
			_createF = _fultInput["create_"];
				
			_config = this["config_"];				
				
		}
		
		public function start():void{
			if( _myself == null ){
				_myself = FE.allocateEntity();
				
				var spatial:SpatialComponent = new SpatialComponent();
				spatial.position = new Point( FE.mainStage.stageWidth - 50, FE.mainStage.stageHeight/2 - 250);
				
				var render:MovieClipRenderComponent = new MovieClipRenderComponent();
				render.clip = this;
				render.scene = VAR.UI_SC;
				render.clip.tab_.addEventListener(MouseEvent.CLICK, onHide);
				render.clip.tab_.buttonMode = true;
				
				_myself.setMVC(spatial, render);
				_myself.init("AniControlEntity");
			}
		}
		public function resize():void{
			if( _hidden )
				hideDone();
			else
				showDone();
		}
		
		private function onHide($e:MouseEvent):void{
			if( _hidden){
				_hidden = false;
				if( _created )
					Tweener.addTween( this, {x:FE.mainStage.stageWidth - 810, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:showDone});
				else
					Tweener.addTween( this, {x:FE.mainStage.stageWidth - 350, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:showDone});
			}else{
				_hidden = true;
				Tweener.addTween( this, {x:FE.mainStage.stageWidth - 50, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:hideDone});
			}
		}
		
		private function showDone():void{
			if( _created ){
				_myself.getSpatial().position = new Point( FE.mainStage.stageWidth - 810,FE.mainStage.stageHeight/2 - 250 );
			}else{
				_myself.getSpatial().position = new Point( FE.mainStage.stageWidth - 350,FE.mainStage.stageHeight/2 - 250 );
			}
		
		}
		private function hideDone():void{
			_myself.getSpatial().position = new Point( FE.mainStage.stageWidth - 50,FE.mainStage.stageHeight/2 - 250 );
		}
		
		private function createDone():void{
			_myself.getSpatial().position = new Point( FE.mainStage.stageWidth - 810,FE.mainStage.stageHeight/2 - 250 );
		}
		
		
		
		
		public function init($item:*):void{
			if( _config.length > 0 ){
				_config.text = "";
				
				_hidden = true;
				hideDone();
			}
			
			_item = $item;
			_type = _item.userAsset.asset.type;
			if( _type == "FULT" || _type == "FUTB" ){
				_normInput.visble = false;
				_fultInput.visible = true;
				_createF.addEventListener( MouseEvent.CLICK, onFultClick);
			}else{
				_normInput.visble = true;
				_fultInput.visible = false;
				if( _type == "FULL" || _type == "FULP" || _type == "COST")
					_createN.addEventListener( MouseEvent.CLICK, onFullClick);
				else
					_createN.addEventListener( MouseEvent.CLICK, onNormClick);
			}
		}
		
		
		private function onNormClick($e:MouseEvent):void{
			trace("onCLick");
			var delay:int = int( _delayN.text );
			var ms:int = int( _msN.text );
			
			var idleMotion:MotionInfo = createMotionInfoN( "IDLE", delay, ms, _idleN );
			var moveMotion:MotionInfo = createMotionInfoN( "MOVE", delay, ms, _moveN );
			var waveMotion:MotionInfo = createMotionInfoN( "WAVE", delay, ms, _wave );
			var cheerMotion:MotionInfo = createMotionInfoN( "CHEER", delay, ms, _cheer );
			var cryMotion:MotionInfo = createMotionInfoN( "CRY", delay, ms, _cry );
			var blinkMotion:MotionInfo = createMotionInfoN( "BLINK", delay, ms, _blink );
			
			var name:String = "";
			if( _item )
				name = _item.userAsset.asset.name;
			
			var config:String = "<item name=\""+name+"\">\n";
			config += createMotionN(idleMotion);
			config += createMotionN(moveMotion);
			config += createMotionN(waveMotion);
			config += createMotionN(cheerMotion);
			config += createMotionN(cryMotion);
			config += createMotionN(blinkMotion);
			config += "</item>";
			
			_config.text = config;
			Tweener.addTween( this, {x:FE.mainStage.stageWidth - 810, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:createDone});
			
		}
		
		public function onFultClick($e:MouseEvent):void{
			var delay:int = int( _delayF.text );
			var ms:int = int( _msF.text );
			var offset:int = int( _offset.text );
			var max:int = int( _max.text );
			
			trace("[T2] onFultClick: createMotionInfoF - START");
			var idleMotion:MotionInfo = createMotionInfoN( "IDLE", delay, ms, _idleF );
			var moveMotion:MotionInfo = createMotionInfoN( "MOVE", delay, ms, _moveF );
			var set0Motion:MotionInfo = createMotionInfoF( "SET0", delay, ms, _set0, offset, max );
			var set1Motion:MotionInfo = createMotionInfoF( "SET1", delay, ms, _set1, offset, max );
			var set2Motion:MotionInfo = createMotionInfoF( "SET2", delay, ms, _set2, offset, max );
			var set3Motion:MotionInfo = createMotionInfoF( "SET3", delay, ms, _set3, offset, max );
			trace("[T2] onFultClick: createMotionInfoN - DONE");
			var name:String = "";
			if( _item )
				name = _item.userAsset.asset.name;
			
			trace("[T2] onFultClick: createMotionF - START");
			var config:String = "<set id=\""+name+"\">\n<motions>\n";
			config += createMotionF(idleMotion);
			config += createMotionF(moveMotion);
			config += createMotionF(set0Motion);
			config += createMotionF(set1Motion);
			config += createMotionF(set2Motion);
			config += createMotionF(set3Motion);
			config += "</motions>\n</set>\n";
			trace("[T2] onFultClick: createMotionF - DONE");
			_config.text = config;
			Tweener.addTween( this, {x:FE.mainStage.stageWidth - 810, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:createDone});
			
		}
		
		private function onFullClick($e:MouseEvent):void{
			var delay:int = int( _delayF.text );
			var ms:int = int( _msF.text );

			var idleMotion:MotionInfo = createMotionInfoFull( "IDLE", delay, ms, _idleN );
			var moveMotion:MotionInfo = createMotionInfoFull( "MOVE", delay, ms, _moveN );
			var waveMotion:MotionInfo = createMotionInfoFull( "WAVE", delay, ms, _wave );
		 	var cheerMotion:MotionInfo = createMotionInfoFull( "CHEER", delay, ms, _cheer );
		 	var cryMotion:MotionInfo = createMotionInfoFull( "CRY", delay, ms, _cry );
		 	var blinkMotion:MotionInfo = createMotionInfoFull( "BLINK", delay, ms, _blink );
			
			var name:String = "";
		 	if( _item )
				name = _item.userAsset.asset.name;
		 
			var config:String = "<set name=\""+name+"\">"+name.toUpperCase()+"</set>\n";
			config += "<set id=\""+name.toUpperCase()+"\">\n";
		 	config += "<motions>\n";
		 	config += createMotionFULL( idleMotion );
			config += createMotionFULL( moveMotion );
			config += createMotionFULL( waveMotion );
			config += createMotionFULL( cheerMotion );
			config += createMotionFULL( cryMotion );
			config += createMotionFULL( blinkMotion );
			config += "</motions>\n";
			config += "</set>";
			
			_config.text = config;		 
			Tweener.addTween( this, {x:FE.mainStage.stageWidth - 810, y:FE.mainStage.stageHeight/2 - 250, time:0.5, transition:"easeInOutCubic", onComplete:createDone});
			 
		}
		
		private function createMotionInfoFull( $name:String, $delay:int, $ms:int, $text:TextField):MotionInfo{
			if( $text.text.length == 0 )
				return new MotionInfo( $name, _type, []);
			var text:String = $text.text;
			text = text.split("\r").join("");
			var frame:Array = text.split(",");
			var frames:Array = [];
			trace("[T2] frame.length:", frame.length);
			for( var i:int = 0; i < frame.length;i++){
				if( frame[i] != "" && !isNaN( int(frame[i]) )){
						frames.push( new FrameInfo( $delay, $ms, _type, int( frame[i] ) ) );
				}
			}
			var motions:MotionInfo = new MotionInfo( $name, _type, frames);
			return motions;
		}
		
		
		private function createMotionInfoF($name:String, $delay:int, $ms:int, $text:TextField, $offset:int, $max:int):MotionInfo{
			if( $text.text.length == 0 )
				return new MotionInfo( $name, _type, []);
			var text:String = $text.text;
			text = text.split("\r").join("");
			var frame:Array = text.split(",");
			var frames:Array = [];
			trace("[T2] frame.length:", frame.length);
			for( var i:int = 0; i < frame.length;i++){
				if( frame[i] != "" && !isNaN( int(frame[i]) )){
					if( i == (frame.length -1) )
						frames.push( new FrameInfo( $delay, $ms, _type, int( frame[i] ), $offset, $max) );
					else
						frames.push( new FrameInfo( $delay, $ms, _type, int( frame[i] ) ) );
				}
 			}
			var motions:MotionInfo = new MotionInfo( $name, _type, frames);
			return motions;
		}
		
		private function createMotionFULL($motionInfo:MotionInfo){
			if( $motionInfo.frames.length == 0 )
				return "";

			var motion:String = "\t<motion name=\""+$motionInfo.name+"\" target=\""+$motionInfo.target+"\">\n";
			for each ( var frameInfo:FrameInfo in $motionInfo.frames ){
				motion += createFrameFULL( frameInfo );
			}
			motion += "\t</motion>\n";
			return motion;
		}
		private function createFrameFULL($frameInfo:FrameInfo):String{
			var frame:String = "\t\t<frame delay=\""+$frameInfo.delay+"\" ms=\""+$frameInfo.ms+"\">\n";
			frame += "\t\t\t<set name=\""+$frameInfo.name+"\" sprite=\""+$frameInfo.sprite+"\" />\n";
			frame += "\t\t</frame>\n";
			return frame;	
		}		
		private function createMotionF($motionInfo:MotionInfo):String{
			if( $motionInfo.frames.length == 0 )
				return "";
			var motion:String = "\t<motion name=\""+$motionInfo.name+"\" target=\""+$motionInfo.target+"\"";
			if( $motionInfo.name != "MOVE" && $motionInfo.name != "IDLE" )
				motion += " allowIntercept=\"false\"";
			motion += ">\n";
			
			for each ( var frameInfo:FrameInfo in $motionInfo.frames ){
				motion += createFrameF( frameInfo );
			}
			
			motion += "\t</motion>\n";
			return motion;
		}
		private function createFrameF($frameInfo:FrameInfo):String{
			var frame:String = "\t\t<frame delay=\""+$frameInfo.delay+"\" ms=\""+$frameInfo.ms+"\">\n";
			if( $frameInfo.offset < 0 )
				frame += "\t\t\t<set name=\""+$frameInfo.name+"\" sprite=\""+$frameInfo.sprite+"\" />\n";
			else
				frame += "\t\t\t<set name=\""+$frameInfo.name+"\" sprite=\""+$frameInfo.sprite+"\" frameoffsetincrease=\""+$frameInfo.offset+"\" totalframemax=\""+$frameInfo.max+"\"/>\n";
			frame +=     "\t\t</frame>\n";
			return frame;	
		}
		
		private function createMotionInfoN($name:String,$delay:int,$ms:int, $text:TextField):MotionInfo{
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
		
		private function createFrameN( $frameInfo:FrameInfo ):String{
			var frame:String = "\t\t<frame delay=\""+$frameInfo.delay+"\" ms=\""+$frameInfo.ms+"\">\n";
			frame +=              "\t\t\t<set name=\""+$frameInfo.name+"\" sprite=\""+$frameInfo.sprite+"\"/>\n";
			frame +=              "\t\t</frame>\n";
			return frame;		
		}
		
		private function createMotionN( $motionInfo:MotionInfo ):String{
			if( $motionInfo.frames.length == 0 )
				return "";
			var motion:String = "\t<motion name=\""+$motionInfo.name+"\" target=\""+$motionInfo.target+"\"";
			if( $motionInfo.repeat )
				motion += " repeat=\"true\"";
			if( $motionInfo.allowIntercept )
				motion += " allowIntercept=\"true\"";
			motion += ">\n";
			
			for each ( var frameInfo:FrameInfo in $motionInfo.frames ){
				motion += createFrameN( frameInfo );
			}
			
			motion += "\t</motion>\n";
			
			return motion;
		}
	}
}