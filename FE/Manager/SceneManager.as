package com.fantage.module.FE.Manager
{
	import com.fantage.module.FE.lib.SceneContainer;

	public class SceneManager
	{
		private var _sceneList:Array = [];
		
		public function SceneManager()
		{
		}
		
		public function addSceneContainer($sc:SceneContainer):void{
			_sceneList.push($sc);
		}
		
		public function shutDown():void{
			for each( var scene:SceneContainer in _sceneList ){
				scene.clearScene();
				scene = null;
			}
			_sceneList = null;
		}
	}
}