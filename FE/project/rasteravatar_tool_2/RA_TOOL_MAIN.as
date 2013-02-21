package com.fantage.module.FE.project.rasteravatar_tool_2
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.lib.SceneContainer;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.DisplayControl;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemAniamtionControl;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemmapControl;
	import com.fantage.module.world.room.photobooths.Sea;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class RA_TOOL_MAIN extends MovieClip
	{
		private var _bulkLoader:BulkLoader;
		
		//controls
		private var _displayControl:DisplayControl;
		private var _itemListControl:*;
		private var _itemmapControl:*;
		private var _itemAniControl:*;
		
		//general
		private var _loader:Loader;
		private var _progress:iEntity;
		private var _scaleBar:iEntity;
		private var _configProgressText:TextField;
		private var _searchProgressText:TextField;
		private var _aniProgressText:TextField;
		
		public function RA_TOOL_MAIN()
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage($e:Event):void{
			trace("[T2] onAddedToStage");
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			createWorld();
		}
		
		private function createWorld():void{
			trace("[T2] createWorld");
			initFE();
			createScenes();
			createProgressBar();
	//		createScaleBar();
			createControls();
			loadControls();
			FE.mainStage.addEventListener(Event.RESIZE, onResize);
		}
		
		private function onResize($e:Event):void{
			if( _itemListControl)
				_itemListControl.resize();
			if( _itemmapControl )
				_itemmapControl.resize();
			if( _itemAniControl )
				_itemAniControl.resize();
			if( _displayControl )
				_displayControl.resize();
			resize();
			
		}
		
		private function initFE():void{
			FE.startup(this, "tool2");
			FE.processManager.start();
			
		}
		
		private function createProgressBar():void{
			_progress = FE.allocateEntity();
			
			var spatial:SpatialComponent = new SpatialComponent();
			spatial.position = new Point( FE.mainStage.stageWidth/2, FE.mainStage.stageHeight );
			
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = new  com.fantage.module.FE.project.rasteravatar_tool_2.LoadProgress();
			render.scene = VAR.FRONT_SC;
			
			_searchProgressText = render.clip.searchProgress_;
			_searchProgressText.text = "inited";
			_aniProgressText = render.clip.aniProgress_;
			_aniProgressText.text = "inited";
			_configProgressText = render.clip.configProgress_;
			_configProgressText.text = "inited";
			
			_progress.setMVC( spatial, render);
			_progress.init("ProgressEntity");
		}
		
		
		
		private function resize():void{
			_progress.getSpatial().position = new Point( FE.mainStage.stageWidth/2, FE.mainStage.stageHeight );
		}
		
		private function createScenes():void{
			VAR.BG_SC = new SceneContainer("BG_SC");
			VAR.AVATAR_SC = new SceneContainer("AVATAR_SC");
			VAR.ITEM_SC = new SceneContainer("ITEM_SC");
			VAR.UI_SC = new SceneContainer("UI_SC");
			VAR.LOADER_SC = new SceneContainer("LOADER_SC");
			VAR.FRONT_SC = new SceneContainer("FRONT_SC");
		}
		
		private function createControls():void{
			VAR.DISPLAY_CONTROL = new DisplayControl();
//		 	VAR.ITEM_LIST_CONTROL = new ItemListControl();		
			//VAR.ITEMMAP_CONTROL = new ItemmapControl();i
			//R.ITEMANIMATION_CONTROL = new ItemAniamtionControl();
		}
		
		
		//LOAD
		
		//search
		private function loadControls():void{
			trace("[T2] loadControls - start");
			_loader = new Loader();
			var request:URLRequest = new URLRequest("Search.swf");
			setupProgressSearch( _loader.contentLoaderInfo);
			_loader.load( request );
			trace("[T2] loadControls - done");
		}
		private function setupProgressSearch($dispatcher:IEventDispatcher):void{
			$dispatcher.addEventListener(Event.COMPLETE, onSearchLoadComplete);
			$dispatcher.addEventListener(ProgressEvent.PROGRESS, onSearchProgress);
		}
		private function onSearchProgress($e:ProgressEvent):void{
			_searchProgressText.text = ""+($e.bytesLoaded/$e.bytesTotal*100)+"/100";
		}
		private function onSearchLoadComplete($e:Event):void{
			_searchProgressText.text = "complete";
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onSearchProgress);
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onSearchLoadComplete);
			_itemListControl = _loader.content;
			VAR.ITEM_LIST_CONTROL = _itemListControl;
			_itemListControl.start();
			_itemListControl.resize();
			trace("[T2] onSearchLoadComplete - done");
			var request:URLRequest = new URLRequest("Config.swf");
			setupProgressConfig( _loader.contentLoaderInfo);
			_loader.load( request );
		}
		
		//config
		private function setupProgressConfig($dispatcher:IEventDispatcher):void{
			$dispatcher.addEventListener(Event.COMPLETE, onConfigLoadComplete);
			$dispatcher.addEventListener(ProgressEvent.PROGRESS, onConfigProgress);
		}
		private function onConfigProgress($e:ProgressEvent):void{
			_configProgressText.text = ""+($e.bytesLoaded/$e.bytesTotal*100)+"/100";
		}
		private function onConfigLoadComplete($e:Event):void{
			_configProgressText.text = "complete";
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onConfigProgress);
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onConfigLoadComplete);
			_itemmapControl = _loader.content;
			VAR.ITEMMAP_CONTROL = _itemmapControl;
			_itemmapControl.start();
			_itemmapControl.resize();
			trace("[T2] onConfigLoadComplete - done");
			
			var request:URLRequest = new URLRequest("Animation.swf");
			setupProgressAnimation(_loader.contentLoaderInfo);
			_loader.load( request);
		}
		
		//animation
		private function setupProgressAnimation($dispatcher:IEventDispatcher):void{
			$dispatcher.addEventListener(Event.COMPLETE, onAnimationLoadComplete);
			$dispatcher.addEventListener(ProgressEvent.PROGRESS, onAnimationProgress);
		}
		private function onAnimationProgress($e:ProgressEvent):void{
			_aniProgressText.text = ""+($e.bytesLoaded/$e.bytesTotal*100)+"/100";
		}
		private function onAnimationLoadComplete($e:Event):void{
			_aniProgressText.text = "complete";
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onAnimationProgress);
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onAnimationLoadComplete);
			_itemAniControl = _loader.content;
			VAR.ITEMANIMATION_CONTROL = _itemAniControl;
			_itemAniControl.start();
			_itemAniControl.resize();
			trace("[T2] onAnimationLoadComplete - done");
			
			VAR.ITEM_LIST_CONTROL.init();
		}
		
	}
}