package com.fantage.module.FE.test.Box2D.bike
{
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	
	import com.fantage.module.FE.FE;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class BikeMain extends Sprite
	{
		private var _screen:Sprite;
		private var _drawer:Drawer;
		
		
		public function BikeMain()
		{
			FE.startup(this,"BikeTest");
			
			_screen = new Sprite();
			
			_screen.graphics.beginFill(0x000000);
			_screen.graphics.drawRect(0,0,800,520);
			_screen.graphics.endFill();
			
			_drawer = new Drawer(_screen);
			_screen.scaleY = -1;
			_screen.x = 0;
			_screen.y = 520;

			addChild( _screen );

		}

	}
}