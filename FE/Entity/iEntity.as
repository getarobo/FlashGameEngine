package com.fantage.module.FE.Entity
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.Component.RenderComponent;
	import com.fantage.module.FE.Component.SpatialComponent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public interface iEntity
	{
		function init($name:String = ""):void;
		function renew():void;
		function destroy():void;
		function getSpatial():*;
		function getRender():*
		function getControl():*;
		function setSpatial($sc:SpatialComponent, $name:String = ""):void;
		function setRender($rc:RenderComponent, $name:String = ""):void;
		function setControl($cc:ControlComponent, $name:String = ""):void;
		function setMVC( $sc:SpatialComponent, $rc:RenderComponent, $cc:ControlComponent = null ):void;
		function set name($name:String):void;
		function get name():String;
		function get eventDispatcher():EventDispatcher;
		function get alive():Boolean;

	}
}