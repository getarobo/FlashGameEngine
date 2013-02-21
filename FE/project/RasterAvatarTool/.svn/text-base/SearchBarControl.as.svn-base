package com.fantage.module.FE.project.RasterAvatarTool
{
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.MovieClipScrollControlComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.Scroll.MovieClipScrollBar;
	import com.fantage.module.FE.Util.Scroll.ScrollClip;
	import com.fantage.tool.RasterAvatarFlash.SearchTool;
	
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class SearchBarControl
	{
		private var _searchTab:SearchTab;
		private var _tab:iEntity;
		
		public function SearchBarControl()
		{
			createSearchTab();
		}
		private function createSearchTab():void{
			_tab = FE.allocateEntity();
			
			var spatial:SpatialComponent = new SpatialComponent();
			spatial.position = new Point(FE.mainStage.stageWidth/2, 300);
			
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = new com.fantage.module.FE.project.RasterAvatarTool.SearchTab();
			render.scene = VAR.FRONT_SC; 
			
			var control:MovieClipScrollControlComponent = new MovieClipScrollControlComponent();
			control.registerToProcessManager();
			
			_tab.setMVC( spatial, render, control);
			_tab.init("SearchTab");
		}
		
		public function resize():void{
			var p:Point = _tab.getSpatial().position;
			p.x = FE.mainStage.stageWidth/2;
			
			_tab.getSpatial().position = p;
		}
	}
}