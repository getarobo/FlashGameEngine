package com.fantage.module.FE.project.RasterAvatarTool
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.Module;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;

	public class ConfigTabManager
	{
		private var _tab:MovieClip;
		private var _avatarConfigModule:*;
		private var _avatarModule:*;
		private var _bulkLoader:BulkLoader;
		
		private var _tabList:Array = [];
		private var _count:int= 0;	
		private var _currentTab:int = 0;

		
		public function ConfigTabManager()
		{
			createTab();
		}
		
		private function createTab():void{
			var tab:iEntity = FE.allocateEntity();
			var spatial:SpatialComponent = new SpatialComponent();
			spatial.position = new Point(0,0);
			
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			_tab = new MovieClip();
			render.clip = _tab;
			render.scene = VAR.EDIT_SC;
			
			tab.setMVC( spatial, render );
			tab.init("ConfigTabEntity");
			
			loadRasterAvatar();
		}

		
		private function loadRasterAvatar():void{
			FE.log("[ConfigTabManager] start");
			_bulkLoader = new BulkLoader("MODULE_LOADER");
			
			_bulkLoader.add("../../rasteravatarconfig.swf" , {id:"RASTER_AVATAR_CONFIG"}).addEventListener(Event.COMPLETE, onRequiredLoaded1, false, 0, true); 
			_bulkLoader.start();
		}
		
		private function onRequiredLoaded1($e:Event):void{
			FE.log("[ConfigTabManager] loaded1");
			_avatarConfigModule = Module( _bulkLoader.getMovieClip("RASTER_AVATAR_CONFIG"));
			VAR.AvatarConfigModule = _avatarConfigModule;
			_avatarConfigModule.start();
			
			_bulkLoader.add("../../rasteravatarmodule.swf", {id:"RASTER_AVATAR_MODULE"}).addEventListener(Event.COMPLETE, onRequiredLoaded2, false, 0, true);
			_bulkLoader.start();
		}
		
		private function onRequiredLoaded2($e:Event):void{
			FE.log("[ConfigTabManager] loaded2");
			_avatarModule = Module(_bulkLoader.getMovieClip("RASTER_AVATAR_MODULE"));
			VAR.AvatarModule = _avatarModule;
			_avatarModule.start();
		}
		
		public function addConfigTab($item:ItemInfo):void{
			if( _count > 0 )
				_tabList[_currentTab].getRender().removeFromScene();
			FE.log("[ConfigTabManager - addConfigTab]");
			var config:iEntity = FE.allocateEntity();
			var spatial:SpatialComponent = new SpatialComponent();
			spatial.position = new Point(FE.mainStage.stageWidth/2, FE.mainStage.stageHeight/2);
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = new EditConfig($item);
			render.scene = VAR.EDIT_SC;

			config.setMVC(spatial, render);
			config.init("Config"+_count);
			_tabList.push( config);
			_currentTab = _count;
			_count++;
		}
		
		
		public function previousTab():void{
			var to:int = (_currentTab-1 +_count) %_count;
			FE.log("[CTM] previousTab:", to);
			_tabList[_currentTab].getRender().removeFromScene();
			_tabList[to].getRender().addFromScene();
			_currentTab = to;
			
		}
		
		public function nextTab():void{
			var to:int = (_currentTab+1) %_count;
			FE.log("[CTM] nextTab:", to);
			_tabList[_currentTab].getRender().removeFromScene();
			_tabList[to].getRender().addFromScene();
			_currentTab = to;
		}
		
		
		
		
		
	}
}