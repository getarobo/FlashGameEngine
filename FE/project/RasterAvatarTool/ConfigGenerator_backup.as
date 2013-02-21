package com.fantage.module.FE.project.RasterAvatarTool
{
	import br.com.stimuli.loading.*;
	
	import com.fantage.client.entity.EntityFactory;
	import com.fantage.module.FE.FE;
	import com.fantage.module.Module;
	import com.fantage.module.rasteravatar.RasterAvatarModuleEvent;
	import com.fantage.module.rasteravatar.RasterAvatar;
	import com.fantage.module.ModuleManager;
	import com.fantage.client.entity.UserAsset;
	import com.fantage.client.UserSettings;

	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;

	public class ConfigGenerator_backup extends MovieClip
	{
		
		private var _wave:SimpleButton;
		private var _cry:SimpleButton;
		private var _jump:SimpleButton;
		private var _move:SimpleButton;
		private var _loop:SimpleButton;
		
		private var _avatarHolder:MovieClip;
		private var _configGenHolder:MovieClip;
		
		private var _entityConverter:EntityFactory;
		
		private var _boyAvatar:*;
		private var _girlAvatar:*;
		
		
		private var _avatarConfigModule:*;
		private var _avatarModule:*;
		private var _bulkLoader:BulkLoader;
		private var _rand:int;

		private var _item:ItemInfo;
		
		public function ConfigGenerator_backup($item:ItemInfo)
		{
			FE.log("[ConfigGen] ftw");
			_wave = this["wave_"];
			_cry = this["cry_"];
			_jump = this["jump_"];
			_move = this["move_"];
			_loop = this["loop_"];
			
			_avatarHolder = this["avatarHolder_"];
			_configGenHolder = this["configGenHolder_"];
			
			_entityConverter = new EntityFactory();
			
			_item = $item;
		}

	

		private function addAvatar():void{
			FE.log("[ConfigGen] addavatar");
			
			var initialAvatars:Array = _entityConverter.parseListUser(getNode(_userlist1));
			for each ( var user in initialAvatars ){
					var loadingAvatar = _avatarModule.addAvatar( user );
					loadingAvatar.addEventListener( RasterAvatarModuleEvent.AVATAR_LOADED, onLoadedAvatar, false, 0, true);
					loadingAvatar.start();
					if( _item.userAsset.asset.gender == "uni"){
						if( user.gender == "female"){
							_girlAvatar = loadingAvatar.avatar;
							_girlAvatar.isSelf = true;
							_girlAvatar.scaleX = 1.5;
							_girlAvatar.scaleY = 1.5;
						}else{
							_boyAvatar = loadingAvatar.avatar;
							_boyAvatar.isSelf = true;
							_boyAvatar.scaleX = 1.5;
							_boyAvatar.scaleY = 1.5;
						}
					}else if( _item.userAsset.asset.gender == "female" ){
						if( user.gender == "female"){
							_girlAvatar = loadingAvatar.avatar;
							_girlAvatar.isSelf = true;
							_girlAvatar.scaleX = 1.5;
							_girlAvatar.scaleY = 1.5;
						}
					}else if( _item.userAsset.asset.gender == "male" ){
						if( user.gender == "male"){
							_boyAvatar = loadingAvatar.avatar;
							_boyAvatar.isSelf = true;
							_boyAvatar.scaleX = 1.5;
							_boyAvatar.scaleY = 1.5;
						}
					}
				}
		}
		protected function onLoadedAvatar(e:RasterAvatarModuleEvent):void {
			FE.log("[ConfigGen] loadedAvatar");
			e.currentTarget.removeEventListener(RasterAvatarModuleEvent.AVATAR_LOADED, onLoadedAvatar);
			e.avatar.setStanding();
			
			trace("onLoadedAvatar", e.avatar.user.id, e.avatar.user.gender);
			if(e.avatar.user.gender == "female") {
				_girlAvatar = e.avatar;
			}
			
			if(e.avatar.user.gender == "male") {
				_boyAvatar = e.avatar;
			}
			
			if( _item.userAsset.asset.gender == "male" ){
				_boyAvatar.x = 0;
				_boyAvatar.y  = 0;
				dressBoy();
				_avatarHolder.addChild( _boyAvatar );
			}else if(_item.userAsset.asset.gender = "female"){
				_girlAvatar.x = 0;
				_girlAvatar.y  = 0;
				dressGirl();
				_avatarHolder.addChild( _girlAvatar );
			}else if( _item.userAsset.asset.gender = "uni" ){
				_boyAvatar.x = -125;
				_boyAvatar.y  = 0;
				dressBoy();
				_avatarHolder.addChild( _boyAvatar );
				
				_girlAvatar.x = 125;
				_girlAvatar.y  = 0;
				dressGirl();
				_avatarHolder.addChild( _girlAvatar );
			}
		}
		
		private function dressBoy():void{
			_boyAvatar.addUserAsset( _item.userAsset );
			_avatarHolder.itemName_.text = _item.userAsset.asset.name;
		}
		
		private function dressGirl():void{
			trace("girlAvatar:", _girlAvatar, "item:", _item, "userAsset:", _item.userAsset);
			FE.log(" girlAvatar:", _girlAvatar, "item:", _item, "userAsset:", _item.userAsset);
			_girlAvatar.addUserAsset( _item.userAsset );
			_avatarHolder.itemName_.text = _item.userAsset.asset.name;
		}
		
		
		private  function getNode(xml:XML):XMLNode {
			var xmldoc:XMLDocument = new XMLDocument(); 
			xmldoc.parseXML(xml.toXMLString());
			var xmlNode:XMLNode = xmldoc.firstChild;
			return xmlNode;
		}
		
		private var _userlist1:XML = 		
			<usr>
				<usr epc="0" rot="null" idfbn="null" petnm="null" idfn="null" petlv="0" petda="N/A/D" ipm="false" hoftsv="0" hc="null" irbt="false" rd="N/A/D" fb="0" id="Boy" gn="male" lvl="0" cm="null" petpy="0.0" stpc="0" bm="null" petpx="0.0">
					<ava gn="male" id="0" st="0" y="0" eye="0" x="0" nm="null">
					</ava>
					<idci idfyn="null" idbp="0" idfp="0" idfbkn="null"></idci>
				</usr>
				<usr epc="0" rot="all" idfbn="IFW035_KareokeStar" petnm="" idfn="Preview_ChicksSkinImpl" petlv="0" petda="N/A/D" ipm="true" hoftsv="0" hc="null" irbt="false" rd="8/25/2010" fb="97140963" id="robot2" gn="female" lvl="0" cm="GUARDIAN_CHAT" petpy="0.0" stpc="0" bm="null" petpx="0.0">
					<ava gn="female" id="1053" st="0" y="315" eye="2" x="663" nm="robot2.avatar">
					</ava>
					<idci idfyn="Preview_ChicksSkinImpl" idbp="0" idfp="0"	idfbkn="IFW035_KareokeStar"></idci>
				</usr>
			</usr>;
		
		public function get avatarConfigModule():*{
			return _avatarConfigModule;
		}
		
		public function set avatarConfigModule(value:*):void{
			_avatarConfigModule = value;
		}
		
		public function get avatarModule():*{
			return _avatarModule;
		}
		
		public function set avatarModule(value:*):void{
			_avatarModule = value;
		}
		
		public function get bulkLoader():BulkLoader{
			return _bulkLoader;
		}
		
		public function set bulkLoader(value:BulkLoader):void{
			_bulkLoader = value;
		}
		
		
	}
}