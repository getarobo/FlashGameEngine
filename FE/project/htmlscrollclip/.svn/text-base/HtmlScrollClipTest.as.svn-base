package com.fantage.module.FE.project.htmlscrollclip
{
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.lib.SceneContainer;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLDocument;

	public class HtmlScrollClipTest extends Sprite
	{
		
		private var _clipListControl:ClipListControl;
		private var _bgControl:BgControl;
		
		public function HtmlScrollClipTest()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		private function onAddedToStage($e:Event):void{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			createWorld();
	}
		
		private function createWorld():void{
			initFE();
			createScenes();
			createControls();
			loadXML();
		}
		
		private function initFE():void{
			FE.startup(this, "HtmlScroll");
			FE.processManager.start();
			addSounds("a","b","c");

		}
		
		private function addSounds($a,$b,$c):void{
			trace("scheduleTask:", $a,$b,$c); 
		}
		
		private function onReSize($:Event):void{
			_bgControl.resize();
			_clipListControl.resize();
		}
		
		private function createScenes():void{
			VAR.BG_SC = new SceneContainer("BG_SC");
			VAR.CONTENT_SC = new SceneContainer("CONTENT_SC");
			VAR.FRONT_SC = new SceneContainer("FRONT_SC");
		}
		
		private function createControls():void{
			_bgControl = new BgControl();
			_bgControl.init();
			_clipListControl = new ClipListControl();
		}
		
		private function loadXML():void{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, onXmlLoaded);
			var request:URLRequest = new URLRequest("assets/articles.xml");
			loader.load( request );
		}
		
		private function onXmlLoaded($e:Event):void{
			var loader:URLLoader=URLLoader($e.target);
			XML.ignoreWhitespace = true;
			var result:XML=new XML(loader.data);
			_clipListControl.init(result);
			FE.mainStage.addEventListener( Event.RESIZE, onReSize);
		}
	}
}