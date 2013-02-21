package com.fantage.module.FE.project.htmlscrollclip
{
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class BgControl
	{
		private var _bg:iEntity;
		private var _at:Number = 0;
		public function BgControl()
		{
		}
		
		public function init():void{
			createBG();
		}
		
		private function createBG():void{
			_bg = FE.allocateEntity();
			var spatial:SpatialComponent = new SpatialComponent();
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = new MovieClip();
			render.scene = VAR.BG_SC;
			render.clip.graphics.beginFill(0xCCCCCC);
			render.clip.graphics.drawRect(0,FE.mainStage.stageHeight/2 - 300, FE.mainStage.stageWidth, 600 );
			render.clip.graphics.endFill();
			_bg.setMVC( spatial, render );
			_bg.init("BGEntity");
		}
				
		private function drawBG():void{
				var mc:MovieClip = _bg.getRender().clip;
				mc.graphics.clear();
				mc.graphics.beginFill(0xCCCCCC);
				mc.graphics.drawRect(0,FE.mainStage.stageHeight/2 - 300, FE.mainStage.stageWidth, 600 );
				mc.graphics.endFill();
		}
		
		public function resize():void{
			drawBG();
		}
		
	}
}