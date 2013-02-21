package com.fantage.module.FE.project.htmlscrollclip
{
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.FE;
	import com.fantage.module.FE.Util.Scroll.reference.HtmlScrollClip;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class ClipListControl
	{
		private var _xml:XML;
		private var _articleList:Array = [];
		private var _at:Number =0;
		private var _begin:int = 0;
		private var _end:int = 0;
		
		public function ClipListControl()
		{
		}
		
		public function init($xml:XML):void{
			_xml = $xml;
			createClipList( _xml );
			displayClipList();
			FE.mainStage.addEventListener( MouseEvent.MOUSE_WHEEL, onMouseWheel );
			
		}
		private function  onMouseWheel($e:MouseEvent):void{
			_at = $e.delta * -5;
			_at %= 500*_end;
			trace("[WHEEL] delat:", $e.delta, "atL:", _at);
			resize();			
		}
		
		
		private function createClipList($xml:XML):void{
			var htmlClip:HtmlScrollClip;
			for each( var xml:XML in $xml.list.children() ){
				htmlClip = new HtmlScrollClip( xml );
				_articleList.push( clipToEntity(htmlClip, _end) );
				_end++;
			}
			trace("[ClipListControl] article size:", _end);
		}
		
		private function clipToEntity( $htmlClip:HtmlScrollClip, $index:int ):iEntity{
			var clip:iEntity = FE.allocateEntity();
			var spatial:SpatialComponent = new SpatialComponent();
			var render:HtmlScrollRenderComponent = new HtmlScrollRenderComponent();
			render.clip = $htmlClip;
			render.scene = VAR.CONTENT_SC;
			var control:HtmlScrollControlComponent = new HtmlScrollControlComponent();
			control.index = $index;
			control.registerToProcessManager();
			clip.setMVC(spatial, render, control);
			return clip;
		}
		
		private function displayClipList():void{
			var clip:iEntity;
			for( var i:int = 0 ; i < _articleList.length ; i++ ){
				clip = _articleList[i];
				clip.getSpatial().position = new Point( i* 500, FE.mainStage.stageHeight/2 - 300);
				clip.init("clip"+i);
			}
		}
		
		public function resize():void{
			var clip:iEntity;
			for( var i:int = 0 ; i < _articleList.length ; i++ ){
				clip = _articleList[i];
				clip.getControl().relocate( _at );
			}
			//VAR.CONTENT_SC.scrollRect = new Rectangle(_at,0, FE.mainStage.stageWidth, FE.mainStage.stageHeight/2 + 300);
		}
		
		
		
	}
}