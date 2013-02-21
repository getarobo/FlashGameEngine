package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.lib.SceneContainer;
	
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class RasterAvatarToolMain extends MovieClip
	{
		public function RasterAvatarToolMain()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
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
			FE.mainStage.addEventListener( Event.RESIZE, onReSize);
		}
		private function onReSize($e:Event):void{
			VAR.SearchBar_Control.resize();
		}
		
		private function initFE():void{
			FE.startup( this, "tool");
			FE.processManager.start();
		}
		
		private function createScenes():void{
			VAR.BG_SC = new SceneContainer("BG_SC");
			VAR.EDIT_SC = new SceneContainer("EDIT_SC");
			VAR.SEARCH_SC = new SceneContainer("SEARCH_SC");
			VAR.FRONT_SC = new SceneContainer("FRONT_SC");
		}
		
		private function createControls():void{
			VAR.Config_Control = new ConfigTabManager();
			VAR.SearchBar_Control = new SearchBarControl();
		}
		
		
	}
}