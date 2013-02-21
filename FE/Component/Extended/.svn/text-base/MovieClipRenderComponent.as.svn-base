package com.fantage.module.FE.Component.Extended
{
	import com.fantage.module.FE.Component.RenderComponent;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	
	public class MovieClipRenderComponent extends RenderComponent
	{
		private var _hitBox:MovieClip = new MovieClip();	
		private var _hitBoxAdded:Boolean = false;
		
		public function MovieClipRenderComponent()
		{
			super();
		}
	
		public function drawHitBox():void{
			if( owner.getSpatial().hitSize.length > 0 ){
				var hit:Point = owner.getSpatial().hitSize;
				_hitBox.graphics.clear();
				_hitBox.graphics.beginFill( 0xFF0000, 0.3);
				_hitBox.graphics.drawRect( -hit.x/2, -hit.y/2, hit.x, hit.y);
				_hitBox.graphics.endFill();
				clip.addChildAt(_hitBox, clip.numChildren );
				_hitBoxAdded = true;
			}
		}
		public function redrawHitBox():void{
/*			if( _hitBoxAdded ){
				_hitBoxAdded = false;
				clip.removeChild( _hitBox);
			}
			drawHitBox();*/
		}
		
		override public function redraw():void{
	//		redrawHitBox();
		}
		
		public function set clip($clip:MovieClip):void{
			if( _hitBoxAdded ){
				_hitBoxAdded = false;
				clip.removeChild( _hitBox);
			}
			super.displayObject = $clip;
			if( _initialized)
				redrawHitBox();
			
		}
		public function get clip():MovieClip{
			return super.displayObject as MovieClip;
		}
		
		
	}
}