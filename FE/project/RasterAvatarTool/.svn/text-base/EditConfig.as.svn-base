package com.fantage.module.FE.project.RasterAvatarTool
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import com.adobe.utils.StringUtil;
	import com.fantage.client.entity.EntityFactory;
	import com.fantage.module.FE.FE;
	import com.fantage.module.rasteravatar.RasterAvatarModuleEvent;
	import com.fantage.module.rasteravatar.config.InitConfig;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import com.fantage.module.FE.project.rasteravatar_tool_2.controls.ItemInfo;

	public class EditConfig extends MovieClip
	{
		
		private var _wave:SimpleButton;
		private var _cry:SimpleButton;
		private var _jump:SimpleButton;
		private var _move:SimpleButton;
		private var _loop:SimpleButton;
		
		private var _avatarHolder:MovieClip;
		private var _configGenHolder:ConfigGenerator;
		private var _animationGen:AniConfigGenerator;
		
		
		private var _entityConverter:EntityFactory;
		
		private var _boyAvatar:*;
		private var _girlAvatar:*;
		
		private var _avatarConfigModule:*;
		private var _avatarModule:*;
		private var _bulkLoader:BulkLoader;
		
		private var _itemText:TextField;
		private var _item:ItemInfo;
		
		private var _itemBitmap:Bitmap;
		private var _url:String;
		
		private var _itemClip:ItemClip;
		
		private var _plus:SimpleButton;
		private var _minus:SimpleButton;
		private var _currentScale:Number = 3;
		private var _scaleText:TextField;
		
		public function EditConfig($item:ItemInfo)
		{
			_wave = this["wave_"];
			_cry = this["cry_"];
			_jump = this["jump_"];
			_move = this["move_"];
			_loop = this["loop_"];
			_itemText = this["avatarHolder_"].itemName_;
			
			_avatarHolder = this["avatarHolder_"];
			_configGenHolder = this["configGenHolder_"];
			_animationGen = this["animationGen_"];
			
			_plus = this["plus_"];
			_minus = this["minus_"];
			_scaleText = this["scale_"];
			
			_plus.addEventListener(MouseEvent.CLICK, onIncreaseScale);
			_minus.addEventListener( MouseEvent.CLICK, onDecreaseScale);
			
			
			
			_avatarModule = VAR.AvatarModule;
			_avatarConfigModule = VAR.AvatarConfigModule;
			_item = $item;
						
			
			InitConfig.i.smoothing = false;
			
		//	createAnimationGenerator();
			
			
			loadAvatar();
			
			

		}
		
		private function createAnimationGenerator():void{
/*			if( _item.userAsset.asset.type == "FULT")
				_animationGen = new com.fantage.module.FE.project.RasterAvatarTool.AniConfigGeneratorFULT();
			else
				_animationGen = new com.fantage.module.FE.project.RasterAvatarTool.AniConfigGenerator();*/
			_animationGen.x = 550;
			_animationGen.y = 0;
			addChild( _animationGen );
		}
		
		private function onIncreaseScale($e:MouseEvent):void{
			_currentScale += 1;
			if( _currentScale > 5 )
				_currentScale = 5;
			_scaleText.text = ""+_currentScale;
			
			if( _boyAvatar ){
				_boyAvatar.scaleX = _currentScale;
				_boyAvatar.scaleY = _currentScale;
				_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;
			}
			if( _girlAvatar ){
				_girlAvatar.scaleX = _currentScale;
				_girlAvatar.scaleY = _currentScale;
				_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;
			}
			
			_itemClip.x = 0;
			_itemClip.y = 0;
		}
		
		private function onDecreaseScale($e:MouseEvent):void{
			_currentScale -= 1;
			if( _currentScale < 1 )
				_currentScale = 1;
			_scaleText.text = ""+_currentScale;
			
			if( _boyAvatar ){
				_boyAvatar.scaleX = _currentScale;
				_boyAvatar.scaleY = _currentScale;
				_boyAvatar.x = 0;
				_boyAvatar.y = 0;
				_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;
			}
			if( _girlAvatar ){
				_girlAvatar.scaleX = _currentScale;
				_girlAvatar.scaleY = _currentScale;
				_itemClip.scaleX = _currentScale;
				_itemClip.scaleY = _currentScale;
				_girlAvatar.x = 0;
				_girlAvatar.y = 0;
			}
			
			_itemClip.x = 0;
			_itemClip.y = 0;
		}
		
		
		private function loadAvatar():void{
			_entityConverter = new EntityFactory();
			var initialAvatars:Array = _entityConverter.parseListUser(getNode(_userlist1));
			for each ( var user in initialAvatars ){
				var loadingAvatar = VAR.AvatarModule.addAvatar( user );
				loadingAvatar.addEventListener( RasterAvatarModuleEvent.AVATAR_LOADED, onAvatarLoaded, false, 0, true);
				trace("[EC] user:", user );
				loadingAvatar.start();
				if( _item.userAsset.asset.gender == "uni"){
					if( _girlAvatar && user.gender == "female"){
						_girlAvatar = loadingAvatar.avatar;
						_girlAvatar.isSelf = true;
						_girlAvatar.scaleX = 1;
						_girlAvatar.scaleY = 1;
					}else if( _boyAvatar ){
						_boyAvatar = loadingAvatar.avatar;
						_boyAvatar.isSelf = true;
						_boyAvatar.scaleX = 1;
						_boyAvatar.scaleY = 1;
					}
				}else if( _item.userAsset.asset.gender == "female" ){
					if( _girlAvatar && user.gender == "female"){
						_girlAvatar = loadingAvatar.avatar;
						_girlAvatar.isSelf = true;
						_girlAvatar.scaleX = 1;
						_girlAvatar.scaleY = 1;
					}
				}else if( _item.userAsset.asset.gender == "male" ){
					if( _boyAvatar && user.gender == "male"){
						_boyAvatar = loadingAvatar.avatar;
						_boyAvatar.isSelf = true;
						_boyAvatar.scaleX = 1;
						_boyAvatar.scaleY = 1;
					}
				}
			}
			
			_itemText.text = _item.userAsset.asset.name;
			loadItemBitmap();
		
		}
		
		private function onAvatarLoaded(e:RasterAvatarModuleEvent):void{
			FE.log("[ConfigGen] loadedAvatar");
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
			trace("[EC] - onAvatar - girl:", _girlAvatar, "boy:", _boyAvatar);
			if(_boyAvatar && _item.userAsset.asset.gender == "male" ){
				_boyAvatar.x = 0;
				_boyAvatar.y  = 0;
				_avatarHolder.addChildAt( _boyAvatar,1 );
				
			}else if(_girlAvatar && _item.userAsset.asset.gender == "female"){
				_girlAvatar.x = 0;
				_girlAvatar.y  = 0;
				_avatarHolder.addChildAt( _girlAvatar,1);
				
			}else if( _boyAvatar && _girlAvatar && _item.userAsset.asset.gender == "uni" ){
				_boyAvatar.x = -125;
				_boyAvatar.y  = 0;
				_avatarHolder.addChildAt( _boyAvatar,1 );
				
				_girlAvatar.x = 125;
				_girlAvatar.y  = 0;
				_avatarHolder.addChildAt( _girlAvatar,1);
			}
		}
		
		public function loadItemBitmap():void{
			_bulkLoader = BulkLoader.getLoader();
			_bulkLoader.addEventListener( BulkProgressEvent.COMPLETE, onBulkLoadComplete );
			_url= "/r1/"+_item.userAsset.asset.gender+"/"+_item.userAsset.asset.type+"/"+_item.userAsset.asset.name+".png";
			_url = StringUtil.trim(_url);
			if( _bulkLoader.hasItem( _url ) ){
				_bulkLoader.remove( _url );
			}
			_bulkLoader.add( _url );
			_bulkLoader.start();
		}
		
		private function onBulkLoadComplete($e:BulkProgressEvent):void{
			if( _url ){
				_itemBitmap = _bulkLoader.getBitmap( _url );
				_itemClip = new ItemClip( _itemBitmap.bitmapData, _configGenHolder );
				_avatarHolder.addChildAt( _itemClip, _avatarHolder.numChildren-1 );
				_configGenHolder.colText.addEventListener( KeyboardEvent.KEY_DOWN, onColEnter);
				_configGenHolder.rowText.addEventListener( KeyboardEvent.KEY_DOWN, onRowEnter);
				_configGenHolder.init( _item, _itemBitmap);
				_animationGen.init( _item );
				
				_scaleText.text = ""+_currentScale;
				
				if( _boyAvatar ){
					_boyAvatar.scaleX = _currentScale;
					_boyAvatar.scaleY = _currentScale;
					_itemClip.scaleX = _currentScale;
					_itemClip.scaleY = _currentScale;
				}
				if( _girlAvatar ){
					_girlAvatar.scaleX = _currentScale;
					_girlAvatar.scaleY = _currentScale;
					_itemClip.scaleX = _currentScale;
					_itemClip.scaleY = _currentScale;
				}
				
				_itemClip.x = 0;
				_itemClip.y = 0;
				
				
				
			}
		}
		
		private function onColEnter($e:KeyboardEvent):void{
			if( $e.keyCode == Keyboard.ENTER ){
				var partNum:int = _itemClip.changeCol(int( _configGenHolder.colText.text ));
				_configGenHolder.setCol( int( _configGenHolder.colText.text ) );
			} 
		}
		
		private function onRowEnter($e:KeyboardEvent):void{
			if( $e.keyCode == Keyboard.ENTER ){
				var partNum:int = _itemClip.changeRow(int( _configGenHolder.rowText.text ));
				_configGenHolder.setRow(int( _configGenHolder.rowText.text ) );
			} 
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
	}
}