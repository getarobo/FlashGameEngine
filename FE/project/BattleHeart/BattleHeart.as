package com.fantage.module.FE.project.BattleHeart
{
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.lib.SceneContainer;
	import com.fantage.module.FE.project.BattleHeart.controls.GameControl;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class BattleHeart extends Sprite
	{
		//controls
		private var _gameControl:GameControl;
		
		
		
		public function BattleHeart()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage($e:Event):void{
			createWorld();
		}
		
		private function createWorld():void{
			createFE();
			createScenes();
			createControls();
		}
		
		private function createFE():void{
			FE.startup( this, "BattleHeart");
			addSounds();
		}
		
		private function addSounds():void{
			
		}
		
		private function createScenes():void{
			VAR.BG_SCENE = new SceneContainer("BG_SC");
			VAR.PLAYER_SCENE = new SceneContainer("BG_SC");
			VAR.GAME_SCENE = new SceneContainer("BG_SC");
			VAR.PLAYER_UI_SCENE = new SceneContainer("BG_SC");
			VAR.MAIN_UI_SCENE = new SceneContainer("BG_SC");
			VAR.TOP_SCENE = new SceneContainer("BG_SC");
		}
		
		private function createControls():void{
			_gameControl = new GameControl();
		}
		
		
		
	}
}