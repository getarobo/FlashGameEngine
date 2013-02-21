package com.fantage.module.FE.test.bitmap
{
	import com.fantage.module.FE.Component.Extended.BitmapRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.lib.SceneContainer;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	public class BitmapMaskTest extends Sprite
	{
		private var _scene:SceneContainer;
		
		public function BitmapMaskTest()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage($e:Event):void{
			FE.startup(this, "BitmapMaskTest" );
			createScene();
			createTestWorld();
		}
		
		private function createScene():void{
			_scene = new SceneContainer("BG_SC");
		}
		
		private function createTestWorld():void{
			var test:iEntity = FE.allocateEntity();
			
			var spatial:SpatialComponent = new SpatialComponent()l
			spatial.position = new Point();
			
			var render:BitmapRenderComponent = new BitmapRenderComponent();
			render.scene = _scene;
			
			var control:BitmapMaskTestControlComponent = 
		
		}
	}
}