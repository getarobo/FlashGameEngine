package com.fantage.module.FE.lib
{
	import com.fantage.module.FE.FE;
	import com.junkbyte.console.Cc;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class SceneContainer extends Sprite
	{
		private var index:int = 0;
		
		public function SceneContainer($name:String = "SceneContainer", $interaction:Boolean = true )
		{
			if( FE.started && FE.mainClass ){
				
		//		width = FE.mainStage.stage.stageWidth;
		//		height = FE.mainStage.stage.stageHeight;
			//	width = 800;
			//	height = 520;
				x = 0;
				y = 0;
				name = $name;
				
				this.mouseEnabled = false;
				FE.mainClass.addChild(this);
				index = FE.mainClass.getChildIndex(this);
			//Cc.log("[SceneContainer] added Scene - index:", index);
				addToSceneManager();
				if( !$interaction ){
					this.mouseEnabled = false;
					this.mouseChildren = false;
				}
			}else{
				throw Error("You must start FE before adding SceneContainer");
			}
		}
		
		private function addToSceneManager():void{
			FE.sceneManager.addSceneContainer( this );
		}
		
		public function addClip( $mc:DisplayObject ):void{
			this.addChild($mc);
		}
		public function clearClips():void{
			while(numChildren)
				this.removeChildAt(0);
		}
		
		public function removeClip( $mc:DisplayObject ):void{
			if( this.contains( $mc ) )
				this.removeChild( $mc );
		}
		
		public function clearScene():void{
			while( this.numChildren ){
				this.removeChildAt(0);
			}
			FE.mainClass.removeChild(this);
		}
		
	}
}


