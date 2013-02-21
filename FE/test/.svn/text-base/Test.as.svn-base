package com.fantage.module.FE.test
{
	import flash.display.MovieClip;

	

	public class Test extends MovieClip
	{
		[Embed('//fantage-2/www/r1/rasteravatar/config/test/test1.xml')]		
		protected var neww : Class;
		[Embed('//fantage-2/www/r1/rasteravatar/config/test/test2.xml')]
		protected var old : Class;
		
		protected var _old:XML;
		protected var _new:XML;
		
		
		var obj:Object = new Object();
		
		public function Test()
		{
			_old = new XML(old.data);
			_new = new XML(neww.data);
			testXML(_old, _new)
		}
		
		
		private function mergeXML($xml1:XML, $xml2:XML):XML{
			for each ( var xml:XML in $xml2.children() ){
				$xml1.appendChild( xml );
				
			}
			trace( $xml1.toString() );
			return $xml1;
		}
		
		private function testXML($old:XML, $new:XML):void{
			for each ( var data:XML in $old.children() ){
				obj[data.attribute("name")] = true;
			}
			var count:int = 0 ;
			for each ( var da:XML in $new.children() ){
				if( obj[ da.attribute("name")] == null ){
		//			trace( da.attribute("name") );
					trace( da );
					count++;	
				}
			}
		
			trace(count );
		}
		
		

	}
}