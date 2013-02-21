package com.fantage.module.FE.project.rasteravatar_tool_2.controls
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import com.adobe.utils.StringUtil;
	import com.fantage.client.entity.EntityFactory;
	import com.fantage.module.FE.Component.Extended.BitmapRenderComponent;
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.project.RasterAvatarTool.ItemBitmap;
	import com.fantage.module.FE.project.RasterAvatarTool.ItemClip;
	import com.fantage.module.FE.project.rasteravatar_tool_2.VAR;
	import com.fantage.module.FE.project.rasteravatar_tool_2.components.ItemClipControlComponent;
	import com.fantage.module.Module;
	import com.fantage.module.rasteravatar.RasterAvatarModuleEvent;
	import com.fantage.module.rasteravatar.config.InitConfig;
	import com.fantage.tool.RasterAvatarFlash.ItemClip;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;

	public class DisplayControl
	{
		//RasterAvatarModule
		private var _avatarConfigModule:*;
		private var _avatarModule:*;
		private var _bulkLoader:BulkLoader;
		
		//AvatarLoader
		private var _entityConverter:EntityFactory;
		
		//Avatar
		private var _boyAvatar:*;
		private var _girlAvatar:*;
		private var _boy:iEntity;
		private var _girl:iEntity
		private var _avatarOffsetY:int = 0;
		
		//AvatarConfig
		private var _userlist1:XML = 		
			<usr>
				<usr epc="0" rot="null" idfbn="null" petnm="null" idfn="null" petlv="0" petda="N/A/D" ipm="false" hoftsv="0" hc="null" irbt="false" rd="N/A/D" fb="0" id="Boy" gn="male" lvl="0" cm="null" petpy="0.0" stpc="0" bm="null" petpx="0.0">
					<ava gn="male" id="0" st="0" y="0" eye="0" x="0" nm="null">
					</ava>
					<idci idfyn="null" idbp="0" idfp="0" idfbkn="null">
					</idci>
				</usr>
				<usr epc="0" rot="all" idfbn="IFW035_KareokeStar" petnm="" idfn="Preview_ChicksSkinImpl" petlv="0" petda="N/A/D" ipm="true" hoftsv="0" hc="null" irbt="false" rd="8/25/2010" fb="97140963" id="robot2" gn="female" lvl="0" cm="GUARDIAN_CHAT" petpy="0.0" stpc="0" bm="null" petpx="0.0">
					<ava gn="female" id="1053" st="0" y="315" eye="2" x="663" nm="robot2.avatar">
					</ava>
					<idci idfyn="Preview_ChicksSkinImpl" idbp="0" idfp="0"	idfbkn="IFW035_KareokeStar">
					</idci>
				</usr>
			</usr>;
		
		//Item
		private var _currentItem:*;
		private var _url:String;
		private var _itemClip:ItemClip;
		private var _currentScale:Number = 4;
		private var _item:iEntity;
		
		public function DisplayControl()
		{
			VAR.AVATAR_SC.x = FE.mainStage.stageWidth/2;
			VAR.AVATAR_SC.y = FE.mainStage.stageHeight/2;
			VAR.ITEM_SC.x = FE.mainStage.stageWidth/2;
			VAR.ITEM_SC.y = FE.mainStage.stageHeight/2;
			InitConfig.i.smoothing = false;
			loadRasterAvatar();
		}
		
		public function resize():void{
			VAR.AVATAR_SC.x = FE.mainStage.stageWidth/2;
			VAR.AVATAR_SC.y = FE.mainStage.stageHeight/2;
			VAR.ITEM_SC.x = FE.mainStage.stageWidth/2;
			VAR.ITEM_SC.y = FE.mainStage.stageHeight/2;
		}
		
		private function loadRasterAvatar():void{
			trace("[T2]DC: loadRasterAvatar");
			_bulkLoader = new BulkLoader("MODULE_LOADER");
			_bulkLoader.add("../../../rasteravatarconfig.swf", {id:"RASTER_AVATAR_CONFIG"}).addEventListener( Event.COMPLETE, onRequiredLoaded1, false, 0, true);
			_bulkLoader.start();
		}
		
		private function onRequiredLoaded1($e:Event):void{
			trace("[T2]DC: onRequiredLoaded1");
			_avatarConfigModule = Module( _bulkLoader.getMovieClip("RASTER_AVATAR_CONFIG") );
			_avatarConfigModule.start();
	//		VAR.AvatarConfigModule = _avatarConfigModule;

			_bulkLoader.add("../../../rasteravatarmodule.swf", {id:"RASTER_AVATAR_MODULE"}).addEventListener(Event.COMPLETE, onRequiredLoaded2, false, 0, true);
			_bulkLoader.start();
		}
		
		private function onRequiredLoaded2($e:Event):void{
			trace("[T2]DC: onRequiredLoaded2");
			_avatarModule = Module(_bulkLoader.getMovieClip("RASTER_AVATAR_MODULE"));
	//		VAR.AvatarModule = _avatarModule;
			_avatarModule.start();
			loadAvatar();
		}
		
		private function loadAvatar():void{
			trace("[T2]DC: loadAvatar");

			_entityConverter = new EntityFactory();
			var initialAvatars:Array = _entityConverter.parseListUser(getNode(_userlist1));
			for each ( var user in initialAvatars ){
				var loadingAvatar = _avatarModule.addAvatar( user );
				loadingAvatar.addEventListener( RasterAvatarModuleEvent.AVATAR_LOADED, onAvatarLoaded, false, 0, true);
				loadingAvatar.start();
			}
		}
		private  function getNode(xml:XML):XMLNode {
			var xmldoc:XMLDocument = new XMLDocument(); 
			xmldoc.parseXML(xml.toXMLString());
			var xmlNode:XMLNode = xmldoc.firstChild;
			return xmlNode;
		}
		
		private function onAvatarLoaded(e:RasterAvatarModuleEvent):void{
			trace("[T2]DC: onAvatarLoaded");
			e.currentTarget.removeEventListener(RasterAvatarModuleEvent.AVATAR_LOADED, onAvatarLoaded);
			e.avatar.setStanding();
			if(e.avatar.user.gender == "female") {
				if( _girlAvatar == null ){
					trace("[EC] girl:", _girlAvatar,"to:", e.avatar);
					_girlAvatar = e.avatar;
				}
			}
			if(e.avatar.user.gender == "male") {
				if( _boyAvatar == null ){
					trace("[EC] boy:", _boyAvatar,"to:", e.avatar);
					_boyAvatar = e.avatar;
				}
			}
			if( _boyAvatar && _girlAvatar ){
				createBoyAndGirl();
			}
		}
		
		private function createBoyAndGirl():void{
			trace("[T2]DC: createBoyAndGirl");
			_boy = FE.allocateEntity();
			
			var spatial:SpatialComponent = new SpatialComponent();
			//spatial.position = new Point( FE.mainStage.stageWidth/2 - _boyAvatar.width/2, FE.mainStage.stageHeight/2 +200);
			spatial.position = new Point();
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			render.clip = _boyAvatar;
			render.scene = VAR.AVATAR_SC;
						
			_boy.setMVC(spatial, render);
			_boy.init("BoyEntity");
			
			_boy.getRender().removeFromScene();
			
			trace("[T2] DC: boy:", spatial.position);

			_girl = FE.allocateEntity();
			
			spatial = new SpatialComponent();
	//		spatial.position = new Point( FE.mainStage.stageWidth/2 - _girlAvatar.width/2, FE.mainStage.stageHeight/2 +200);
			spatial.position = new Point();

			render = new MovieClipRenderComponent();
			render.clip = _girlAvatar;
			render.scene = VAR.AVATAR_SC;
			
			_girl.setMVC(spatial, render);
			_girl.init("giralEntity");
			
			_girl.getRender().removeFromScene();
			trace("[T2] DC: girl:",spatial.position); 


			
		}
		
		public function loadItem($item:*):void{
			if( _item ){
				_item.destroy();
				_item = null;
				_boy.getRender().removeFromScene();
				_girl.getRender().removeFromScene();
			}
			trace("[T2] DC:loadItem");
			_currentItem = $item;
			//_bulkLoader = BulkLoader.getLoader();
			_bulkLoader.addEventListener( BulkProgressEvent.COMPLETE, onItemLoadComplete);
			_url = "/r1/"+_currentItem.userAsset.asset.gender+"/"+_currentItem.userAsset.asset.type+"/"+_currentItem.userAsset.asset.name+".png";
			_url = StringUtil.trim(_url);
			if( _bulkLoader.hasItem( _url ) ){
				_bulkLoader.remove( _url );
			}
			_bulkLoader.add( _url );
			_bulkLoader.start();
		}
		
		private function onItemLoadComplete($e:BulkProgressEvent):void{
			
			trace("[T2] DC:onItemLoadComplete");
			$e.currentTarget.removeEventListener(BulkProgressEvent.COMPLETE, onItemLoadComplete);
			var itemBitmap:Bitmap = _bulkLoader.getBitmap(_url);
			
			//Init Config
			VAR.ITEMMAP_CONTROL.init(_currentItem,itemBitmap); 
			VAR.ITEMANIMATION_CONTROL.init( _currentItem );

			
	//		_itemClip = new ItemClip( itemBitmap.bitmapData);
			if( _currentItem.userAsset.asset.gender == "male" ){
				_boyAvatar.scaleX = _currentScale;
				_boyAvatar.scaleY = _currentScale;
				_boyAvatar.isSelf = true;
/*				_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;*/
				_avatarOffsetY = _boyAvatar.height * _currentScale / 2;
				trace("[T2] -DC- avatarOffsetY:", _avatarOffsetY);
				_boy.getSpatial().position = new Point( 0,_avatarOffsetY ); 
				_boy.getRender().addToScene();
			}else{// if(_currentItem.userAsset.asset.gender == "female"){
				_girlAvatar.scaleX = _currentScale;
				_girlAvatar.scaleY = _currentScale;
				_girlAvatar.isSelf = true;
	/*			_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;*/
				_avatarOffsetY = _girlAvatar.height * _currentScale / 2;
				trace("[T2] -DC- avatarOffsetY:", _avatarOffsetY);
				_girl.getSpatial().position = new Point( 0,_avatarOffsetY );
				_girl.getRender().addToScene();
			}
			createItemEntity(itemBitmap);

		}
		
		private function createItemEntity($itemBitmap:Bitmap):void{
			trace("[T2] DC:createItemEntity");

			_item = FE.allocateEntity();
			
			var spatial:SpatialComponent = new SpatialComponent();
	//		spatial.position = new Point( FE.mainStage.stageWidth/2 - _girlAvatar.width/2, FE.mainStage.stageHeight/2 +200);
			spatial.position = new Point(0,0);
			
		/*	var render:BitmapRenderComponent = new BitmapRenderComponent();
			render.bitmapData = $itemBitmap.bitmapData;
			render.scene = VAR.ITEM_SC;
		*/
			
			
			
			var render:MovieClipRenderComponent = new MovieClipRenderComponent();
			var mc:MovieClip = new MovieClip();
			mc.width = $itemBitmap.width;
			mc.height = $itemBitmap.height;
			$itemBitmap.x = 0;
			$itemBitmap.y = 0;
	//		mc.addChild(new ItemBitmap($itemBitmap.bitmapData));
			mc.scaleX = _currentScale;
			mc.scaleY = _currentScale;
			render.clip = mc;
			render.scene = VAR.ITEM_SC;
			
			var control:ItemClipControlComponent = new ItemClipControlComponent();
			control.bitmapData = $itemBitmap.bitmapData;
			control.avatarOffsetY = _avatarOffsetY;
					
			_item.setMVC( spatial, render, control);
			_item.init("ItemEntity");
			
			control.start();
			trace("[T2] DC: item:", spatial.position);
		}
		
		public function setCol($col:int):void{
			(_item.getControl() as ItemClipControlComponent).col = $col;
		}
		public function setRow($row:int):void{
			(_item.getControl() as ItemClipControlComponent).row = $row;
		}
		
		
		public function setX($x:int):void{
			(_item.getControl() as ItemClipControlComponent).setX($x);
		}
		public function setY($y:int):void{
			(_item.getControl() as ItemClipControlComponent).setY($y);

		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}