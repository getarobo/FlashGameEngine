package com.fantage.module.FE.Component
{
	import com.fantage.module.FE.Entity.iEntity;

	public interface iComponent
	{
		function destroy():void;
		function set name($name:String):void;
		function get name():String;
		function set owner($owner:iEntity):void;
		function get owner():iEntity;
		function init():void;
		function inited():void;
	}
}