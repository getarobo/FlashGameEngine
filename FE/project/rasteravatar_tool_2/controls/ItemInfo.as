package com.fantage.module.FE.project.rasteravatar_tool_2.controls
{
	import com.fantage.client.entity.UserAsset;
	
	import flash.display.MovieClip;
	import flash.text.TextField;

	public class ItemInfo extends MovieClip
	{
		
		private var _desc:TextField;
		private var _num:TextField;
		private var _userAsset:UserAsset;
		
		public function ItemInfo($userAsset:UserAsset)
		{
			drawBox();
			
			
			
			_userAsset = $userAsset;
			_desc.text = _userAsset.asset.name;
		}
		

		public function get num():TextField{
			return _num;
		}

		private function drawBox():void{
			graphics.beginFill( 0x66FF33);
			graphics.drawRect(0,0,750, 20);
			graphics.endFill();
			
			_num = new TextField();
			_num.x = 10;
			_num.y = 0;
			addChild(_num);
			_desc = new TextField();
			_desc.width = 650;
			_desc.selectable = false;
			_desc.x = 58;
			_desc.y = 0;
			addChild(_desc);
		}
		
		
		public function get userAsset():UserAsset{
			return _userAsset;
		}

		public function set userAsset(value:UserAsset):void{
			_userAsset = value;
		}

	}
	
}