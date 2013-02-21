package com.fantage.module.FE.Component.Extended
{
	import com.fantage.module.FE.Component.RenderComponent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class BitmapRenderComponent extends RenderComponent
	{
		public function BitmapRenderComponent()
		{
		}
		
		public function set bitmap($bitmap:Bitmap):void{
			super.displayObject = $bitmap;
		}
		public function get bitmap():Bitmap{
			return super.displayObject as Bitmap;
		}
		
		public function set bitmapData($bd:BitmapData):void{
			super.displayObject = new Bitmap($bd);
		}
		public function get bitmapData():BitmapData{
			return (super.displayObject as Bitmap).bitmapData;
		}
	}
}