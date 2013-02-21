package com.fantage.module.FE.Entity
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.Component.RenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	import com.fantage.module.FE.FE;
	
	import flash.events.EventDispatcher;

	public class Entity implements iEntity
	{
		private var _name:String = "";
		private var _spatial:SpatialComponent;
		private var _render:RenderComponent;
		private var _control:ControlComponent;
		
		protected var _eventDispatcher:EventDispatcher = new EventDispatcher();

		private var _alive:Boolean = true;
		
		public function entity()
		{
		}
		
		public function get alive():Boolean{
			return _alive;
		}

		public function get eventDispatcher():EventDispatcher{
			return _eventDispatcher;
		}

		public function init($name:String= ""):void{
			_name = $name;
			if( _spatial ){
				_spatial.owner = this;
				_spatial.init();
			}
			if( _render ){
				_render.owner = this;
				_render.init();
			}
			if( _control ){
				_control.owner = this;
				_control.init();
				_control.inited();
			}
		}
		
		public function renew():void{
			_spatial = null;
			_render = null;
			_control = null;
		}
		
		public function destroy():void{
			if( _control ){
				_control.destroy();
			}
			if( _spatial ){
				_spatial.destroy();
			}
			if( _render ){
				_render.destroy();
			}
			trace("[FE] destroy entity:", _name);			
			_alive = false;
			FE.destroyEntity( this );
		}
		
		public function getSpatial():*{
			return _spatial;
		}
		
		public function getRender():*{
			return _render;
		}
		
		public function getControl():*{
			return _control;
		}
		
		public function setSpatial($sc:SpatialComponent, $name:String = ""):void{
			if( $sc == null ) 
				return;
			if( _spatial != null ){
				_spatial.destroy();
				_spatial = null;
			}
			_spatial = $sc;
			_spatial.name = $name;
		}
		
		public function setRender($rc:RenderComponent, $name:String = ""):void{
			if( $rc == null ) 
				return;
			if( _render != null ){
				_render.destroy();
				_render = null;
			}
			_render = $rc;
			_render.name = $name;
		}
		
		public function setControl($cc:ControlComponent, $name:String = ""):void{
			if( $cc == null ) 
				return;
			if( _control != null ){
				_control.destroy();
				_control = null;
			}
			_control = $cc;
			_control.name = $name;
		}
		
		public function setMVC( $sc:SpatialComponent, $rc:RenderComponent, $cc:ControlComponent = null):void{
			setSpatial( $sc );
			setRender( $rc );
			if( $cc ){
				setControl( $cc );
			}
		}
		
		public function set name($name:String):void{
			_name = $name;
		}
		
		public function get name():String{
			return _name;
		}
		
	}
}