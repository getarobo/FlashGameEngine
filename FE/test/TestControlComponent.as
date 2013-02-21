package com.fantage.module.FE.test
{
	import com.fantage.module.FE.Component.ControlComponent;

	public class TestControlComponent extends ControlComponent
	{
		public function TestControlComponent()
		{
		}
		
		override public function onTick():void{
		
			trace("running Test : onTick() ");
		}
	}
}