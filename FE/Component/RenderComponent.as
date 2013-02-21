package com.fantage.module.FE.Component
{
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.lib.SceneContainer;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class RenderComponent implements iComponent
	{
		protected var _initialized:Boolean = false;
		private var _name:String;
		private var _owner:iEntity;
		
		private var _clip:DisplayObject;
		private var _scene:SceneContainer;
		private var _alpha:Number = 1;
		private var _visible:Boolean = true;
		private var _positionOffset:Point = new Point();
		
		private var _mcAdded:Boolean = false;
		
		
		
		public function RenderComponent()
		{
		}
		
		public function get visible():Boolean{
			return _visible;
		}

		public function set visible(value:Boolean):void{
			_visible = value;
			_clip.visible = _visible;
		}

		public function get mcAdded():Boolean{
			return _mcAdded;
		}

		public function set mcAdded(value:Boolean):void{
			_mcAdded = value;
		}

		public function init():void{
			_initialized = true;
			if( _clip ){
				_clip.alpha = _alpha;
				if( _scene ){
					_mcAdded = true;
					_scene.addClip( _clip );
				}
			}
		}
		public function inited():void{
			
		}
		//init
		public function set displayObject($mc:DisplayObject):void{
			if( _clip ){
				if( _scene )
					_scene.removeClip( _clip );
				_clip = null;
			}
			_clip = $mc;
			_clip.alpha = _alpha;
			if( _initialized ){
				owner.getSpatial().applySpatialToRender();
				if( _scene ){
					_mcAdded = true;
					_scene.addClip( _clip );
				}
				
			}
			
		}
		public function removeFromScene():void{
			if( _scene ){
				if( _mcAdded && _clip){
					_scene.removeClip( _clip );
					_mcAdded = false;
				}
			}
		}
		
		public function addToScene():void{
			if( _scene ){
				if( !_mcAdded && _clip){
					_scene.addClip( _clip );
					_mcAdded = true;
				}
			}
		}
		
		
		public function get displayObject():DisplayObject{
			return _clip;
		}
		
		public function redraw():void{
		
		}
		
		public function set scene($sc:SceneContainer):void{
			removeFromScene();
			_scene = $sc;
			addToScene();
		}
		public function get scene():SceneContainer{
			return _scene;
		}
		
		public function set alpha($alpha:Number):void{
			_alpha = $alpha;
			if( _clip )
				_clip.alpha = _alpha;
		}
		public function get alpha():Number{
			return _alpha;
		}
		
		public function set positionOffset($p:Point):void{
			_positionOffset = $p;
		}
		public function get positionOffset():Point{
			return _positionOffset;
		}
		
		//functions
		public function changePosition($p:Point):void{
			if( _clip ){
				_clip.x = $p.x + _positionOffset.x;
				_clip.y = $p.y + _positionOffset.y;
			}
		}
		public function changeRotation($r:Number):void{
			if( _clip ){
				_clip.rotation = $r;
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//iComponent		
		public function destroy():void{
			if( _clip )
				if( _scene ){
					_scene.removeChild(_clip );
					_clip = null;
					_owner = null;
				}
			_mcAdded = false;
			
		}
		public function set owner($owner:iEntity):void{
			_owner = $owner;
		}
		public function get owner():iEntity{
			return _owner;
		}
		public function set name($name:String):void{
			
		}
		public function get name():String{
			return _name;
		}
		
	}
}