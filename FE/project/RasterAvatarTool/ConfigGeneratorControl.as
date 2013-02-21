package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	
	import flash.geom.Point;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;

	public class ConfigGeneratorControl
	{
		private var _count:int= 0;	
	
		public function ConfigGeneratorControl()
		{
		}
		
		
		public function createConfigGenerator($item:ItemInfo):void{
			var config:iEntity = FE.allocateEntity();
			var spatial:SpatialComponent = new SpatialComponent();
			spatial.position = new Point(FE.mainStage.stageWidth/2, FE.mainStage.stageHeight/2);
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = new EditConfig();
			render.scene = VAR.EDIT_SC;
			
			config.setMVC(spatial, render);
			config.init("Config"+_count);
			_count++;
		}
	}
}