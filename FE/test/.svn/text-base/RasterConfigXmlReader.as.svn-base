package com.fantage.module.FE.test
{
	import com.fantage.module.Module;
	import com.fantage.module.rasteravatarconfig.RasterAvatarConfigEmbed;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;

	public class RasterConfigXmlReader extends MovieClip
	{
		
		private var loader:Loader;
		private var _config:RasterAvatarConfigEmbed;
		
		public function RasterConfigXmlReader()
		{
			loadRasterAvatarConfig();
		}
		
		private function loadRasterAvatarConfig():void{
			loader = new Loader();
			var url:URLRequest = new URLRequest("//fantage-2/www/r1/raster_backup/rac_backup_20120425_102955.swf");
			loader.addEventListener( Event.COMPLETE, onLoaded);
			loader.load( url );
		}
		
		private function onLoaded($e:Event):void{
			_config = (loader.content ) as RasterAvatarConfigEmbed;
			trace( _config.itemCustomEffect );
		}
	}
}