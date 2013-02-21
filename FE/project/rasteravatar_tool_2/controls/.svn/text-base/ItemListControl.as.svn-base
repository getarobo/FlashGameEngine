package com.fantage.module.FE.project.rasteravatar_tool_2.controls
{
	import caurina.transitions.Tweener;
	
	import com.fantage.client.entity.EntityFactory;
	import com.fantage.client.entity.UserAsset;
	import com.fantage.module.FE.Component.Extended.MovieClipRenderComponent;
	import com.fantage.module.FE.Component.MovieClipScrollControlComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.Scroll.ScrollClip;
	import com.fantage.module.FE.project.rasteravatar_tool_2.VAR;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	public class ItemListControl extends MovieClip
	{

		
		private var _searchText:TextField;
		private var _searchButton:SimpleButton;
		private var _contentScroll:ScrollClip;
		private var _hideButton:SimpleButton;
		private var _listScroll:MovieClip;
		private var _listClip:iEntity;
		private var _entityConverter:EntityFactory;
		private var _addedEL:Boolean = false;
		private var _hidden:Boolean = false;
		private var _assetList:Array = [];
		
		private var _myself:iEntity;
		
		public function ItemListControl()
		{
//			start();
		}
		
		public function start():void{
			_entityConverter = new EntityFactory();
			
			_searchText = this["searchInputs_"];
			_searchButton = this["submit_"];
			_hideButton = this["hide_"];
			createListScroll();
			addEL();
			if( _myself == null ){
				_myself = FE.allocateEntity();
				
				var spatial:SpatialComponent = new SpatialComponent();
				spatial.position = new Point(FE.mainStage.stageWidth/2, 0);
				
				var render:MovieClipRenderComponent = new MovieClipRenderComponent();
				render.clip = this;
				render.scene = VAR.FRONT_SC; 
				
				var control:MovieClipScrollControlComponent = new MovieClipScrollControlComponent();
				control.registerToProcessManager();
				
				_myself.setMVC( spatial, render, control);
				_myself.init("SearchTab");
			}
			_searchButton.visible = false;
		}
		
		public function init():void{
			_searchButton.visible = true;
		}
		
		public function resize():void{
			var p:Point = _myself.getSpatial().position;
			p.x = FE.mainStage.stageWidth/2 - 400;
			
			_myself.getSpatial().position = p;
		}
		
		private function createListScroll():void{
			var mc:MovieClip = new MovieClip();
			mc.graphics.beginFill(0xFF6633);
			mc.graphics.drawRect( 0, 0, 750, 800);
			mc.graphics.endFill();
			
			mc.graphics.beginFill(0xFFCC00);
			mc.graphics.drawRect(0,0,750,50);
			mc.graphics.endFill();
			
			mc.graphics.beginFill(0xFFCC00);
			mc.graphics.drawRect(0,750,750,50);
			mc.graphics.endFill();
			_contentScroll = new ScrollClip( mc, 750, 420);
			_contentScroll.x = 20;
			_contentScroll.y = 20;
			_contentScroll.name = "contentClip";
			addChild(_contentScroll);
			
		}
		
		private function addEL():void{
			if( !_addedEL){
				_searchButton.addEventListener( MouseEvent.CLICK, onSearch);
				_hideButton.addEventListener(MouseEvent.CLICK, onHide);
				_addedEL = true;
			}
		}
		private function removeEL():void{
			if( _addedEL){
				_searchButton.removeEventListener( MouseEvent.CLICK, onSearch);
				_hideButton.removeEventListener(MouseEvent.CLICK, onHide);
				_addedEL = false;
			}
		}
		
		private function showAndAddEL():void{
			var p:Point = _myself.getSpatial().position;
			p.y = 0;
			_myself.getSpatial().position = p;
			addEL();
		}
		
		private function hideAndAddEL():void{
			var p:Point = _myself.getSpatial().position;
			p.y = -590;
			_myself.getSpatial().position = p;
			addEL();
		}
		
		
		private function onHide($e:MouseEvent):void{
			if( _hidden ){
				_hidden = false;
				Tweener.addTween( this, {x:FE.mainStage.stageWidth/2-400, y:0, time:0.5, transition:"easeInOutCubic", onStart:removeEL, onComplete:showAndAddEL});
			}else{
				_hidden = true;
				Tweener.addTween( this, {x:FE.mainStage.stageWidth/2-400, y:-590, time:0.5, transition:"easeInOutCubic", onStart:removeEL, onComplete:hideAndAddEL});
			}
		}
		
		private function onSearch($e:MouseEvent):void{
			var input:String = _searchText.text;
			var list:Array = input.replace(/^\s+/,"").replace(/\s+$/,"").split(/\s+/);
			for each ( var path:String in list ){
				searchItemByPath( path );
			}
			createAssetList();
		}
		
		private function createAssetList():void{
			for each ( var item:ItemInfo in _assetList ){
				_contentScroll.addItem( item );
				item.addEventListener( MouseEvent.CLICK, onMouseClick );		
				item.buttonMode = true;
			}
		}
		
		private function onMouseClick($e:MouseEvent):void{
			var item:ItemInfo = $e.currentTarget as ItemInfo;
			trace("[T2] ILC: loadItem:", item.userAsset.asset.name, item.userAsset.asset.gender );
		//	VAR.ITEMMAP_CONTROL.init(item, item);
			VAR.DISPLAY_CONTROL.loadItem(item);
			_hidden = true;
			Tweener.addTween( this, {x:FE.mainStage.stageWidth/2-400, y:-590, time:0.5, transition:"easeInOutCubic", onStart:removeEL, onComplete:hideAndAddEL});
		}
		
		private function searchItemByPath( $path:String ):void{
			var path:Array = $path.split("/");
			if( path.length < 3 )
				return;
			var gender:String = path[1];
			var type:String = path[2];
			var name:String = path[3].split(".")[0];			
			var xml:XML = generateUserAsset(gender, type, $path, name);
			var userAsset:UserAsset = _entityConverter.parseUserAsset(getNode(xml));
			_assetList.push( new ItemInfo( userAsset)  );
		}
		
		private function generateUserAsset(gender:String, type:String, pathUrl:String, itemName:String):XML {
			var str:String	=	
				"<ust dt=\"inventoryCode=1\" id=\"37331141\" ivc=\"1\" qt=\"1\" ct=\"null\"> "+
				"<ast sdx=\"null\" des=\"Some brown braids to lighten up your day.\""+
				"sct=\"0\" snm=\"null\" tp=\""+ type+"\" rar=\"null\""+
				"url=\""+pathUrl+"\" id=\"2851\" gn=\""+gender+"\" lvl=\"2\""+
				"dtl=\"null\" dn=\"Braided Hair\" qt=\"100\" pr=\"550\" nm=\""+itemName+"\">"+
				"</ast>"+
				"</ust>";
			return new XML(str);
		}
		
		private  function getNode(xml:XML):XMLNode {
			var xmldoc:XMLDocument = new XMLDocument(); 
			xmldoc.parseXML(xml.toXMLString());
			var xmlNode:XMLNode = xmldoc.firstChild;
			return xmlNode;
		}
				
		
		//getter & setter
		public function get hideButton():SimpleButton{
			return _hideButton;
		}
		
		public function set hideButton(value:SimpleButton):void{
			_hideButton = value;
		}
		
		public function get searchText():TextField{
			return _searchText;
		}
		
		public function set searchText(value:TextField):void{
			_searchText = value;
		}
		
		public function get searchButton():SimpleButton{
			return _searchButton;
		}
		
		public function set searchButton(value:SimpleButton):void{
			_searchButton = value;
		}
		
		public function get contentScroll():ScrollClip{
			return _contentScroll;
		}
		
		public function set contentScroll(value:ScrollClip):void{
			_contentScroll = value;
		}
		
	}
}