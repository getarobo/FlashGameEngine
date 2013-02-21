package com.fantage.module.FE.test.Box2D.bike
{
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Dynamics.b2World;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import net.flashpunk.utils.Input;
	
	public class Drawer extends Sprite
	{
		private var _world:b2World;
		
		//keyboard
		private var _isDown:Boolean = false;
		private var _isUp:Boolean = false;
		private var _isLeft:Boolean = false;
		private var _isRight:Boolean = false;
		
		
		//parts
		public var _fixtureDef:b2FixtureDef = new b2FixtureDef();

		private var _bikeBody:b2Body;
		private var _axle1:b2Body;
		private var _axle2:b2Body;
		private var _spring1:b2PrismaticJoint;
		private var _spring2:b2PrismaticJoint;
		private var _frontWheel:b2Body;
		private var _rearWheel:b2Body;
		public var _frontMotor:b2RevoluteJointDef = new b2RevoluteJointDef();
		public var _rearMotor:b2RevoluteJointDef = new b2RevoluteJointDef();
		public var _rearMotor_added:b2RevoluteJoint;
		public var _frontMotor_added:b2RevoluteJoint;
		private var _screen:Sprite;
		public function Drawer($screen:Sprite = null)
		{
			_screen = $screen;
			_world=new b2World(new b2Vec2(0,-10),true);
			drawDebug();

			addGround();
			drawBike();
		}
		
		private function addGround():void{
			
			var body:b2Body;
			var bodyDef:b2BodyDef = new b2BodyDef();
			var boxDef:b2PolygonShape = new b2PolygonShape();
			var fixtureDef:b2FixtureDef = new b2FixtureDef();

			bodyDef = new b2BodyDef();
			bodyDef.position.Set(  10, 0.5);
			
			boxDef.SetAsBox(50, 0.5);
			fixtureDef.shape = boxDef;
			fixtureDef.friction = 1;
			fixtureDef.density = 1; 
			
			body = _world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
/*			boxDef.SetAsOrientedBox(1, 2, new b2Vec2(-50, 0.5), 0);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);
			
			boxDef.SetAsOrientedBox(1, 2, new b2Vec2(50, 0.5), 0);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);			
			boxDef.SetAsOrientedBox(3, 0.5, new b2Vec2(5, 1.5), Math.PI/4);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);			
			boxDef.SetAsOrientedBox(3, 0.5, new b2Vec2(3.5, 1), Math.PI/8);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);			
			boxDef.SetAsOrientedBox(3, 0.5, new b2Vec2(9, 1.5), -Math.PI/4);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);			
			boxDef.SetAsOrientedBox(3, 0.5, new b2Vec2(10.5, 1), -Math.PI/8);
			fixtureDef.shape = boxDef;
			body.CreateFixture(fixtureDef);			*/
		}
		
		
		
		private function drawBike():void{
			trace("draw bike");
			// add bike body
			var body:b2Body;
			var bodyDef:b2BodyDef = new b2BodyDef();
			var boxDef:b2PolygonShape = new b2PolygonShape();
			
			//position
			bodyDef.position.Set( 250/30 + 10, 200/30);
			bodyDef.type = b2Body.b2_dynamicBody;
			
			//body
			_bikeBody = _world.CreateBody(bodyDef);
			
			//fixtures
			_fixtureDef.density = 2;
			_fixtureDef.friction = 0.5;
			_fixtureDef.restitution = 0.2;
			_fixtureDef.filter.groupIndex = -1;
			
			
			//draw
			boxDef.SetAsBox( 1.5,0.3);
			_fixtureDef.shape = boxDef;
			_bikeBody.CreateFixture(_fixtureDef);
			
			boxDef.SetAsOrientedBox(0.4, 0.15, new b2Vec2(-1, -0.3), Math.PI/3);
			_fixtureDef.shape = boxDef;
			_bikeBody.CreateFixture( _fixtureDef );
			
			boxDef.SetAsOrientedBox(0.4, 0.15, new b2Vec2(1, -0.3), -Math.PI/3);
			_fixtureDef.shape = boxDef;
			_bikeBody.CreateFixture( _fixtureDef );
			
			//add axles

			_fixtureDef.density = 1;
			
			
			var revoluteJointDef   : b2RevoluteJointDef;
			var prismaticJointDef   : b2PrismaticJointDef;

			
			_axle1 = _world.CreateBody(bodyDef);
			
			boxDef.SetAsOrientedBox(0.4, 0.1, new b2Vec2(-1 - 0.6*Math.cos(Math.PI/3), -0.3 - 0.6*Math.sin(Math.PI/3)), Math.PI/3);
			_fixtureDef.shape = boxDef;
			_axle1.CreateFixture(_fixtureDef);
			
			prismaticJointDef = new b2PrismaticJointDef();
			prismaticJointDef.Initialize( _bikeBody, _axle1, _axle1.GetWorldCenter(), new b2Vec2(Math.cos(Math.PI/3), Math.sin(Math.PI/3)));
			prismaticJointDef.lowerTranslation = -0.3;
			prismaticJointDef.upperTranslation = 0.5;
			prismaticJointDef.enableLimit = true;
			prismaticJointDef.enableMotor = true;
			
			_spring1 = _world.CreateJoint(prismaticJointDef) as b2PrismaticJoint;
			
			_axle2 = _world.CreateBody(bodyDef);
			boxDef.SetAsOrientedBox(0.4, 0.1, new b2Vec2(1 + 0.6*Math.cos(-Math.PI/3), -0.3 + 0.6*Math.sin(-Math.PI/3)), -Math.PI/3);
			_fixtureDef.shape = boxDef;
			_axle2.CreateFixture(_fixtureDef);
			prismaticJointDef.Initialize(_bikeBody, _axle2, _axle2.GetWorldCenter(), new b2Vec2(-Math.cos(Math.PI/3), Math.sin(Math.PI/3)));
			
			_spring2 = _world.CreateJoint(prismaticJointDef) as b2PrismaticJoint;
			
			//add wheels
			var circleDef:b2CircleShape = new b2CircleShape(0.7);
			_fixtureDef.density = 0.1;
			_fixtureDef.friction = 5;
			_fixtureDef.restitution = 0.2;
			_fixtureDef.shape = circleDef;
			
			//front
			bodyDef.allowSleep = false;
			bodyDef.position.Set(_axle1.GetWorldCenter().x - 0.3*Math.cos(Math.PI/3), _axle1.GetWorldCenter().y - 0.3*Math.sin(Math.PI/3));
			_frontWheel = _world.CreateBody( bodyDef);
			_frontWheel.CreateFixture(_fixtureDef);
			
			_frontMotor.enableMotor = true;
			_frontMotor.maxMotorTorque = 10;
			_frontMotor.Initialize( _bikeBody, _frontWheel, _frontWheel.GetWorldCenter());
			_frontMotor_added = _world.CreateJoint( _frontMotor ) as b2RevoluteJoint;
			
			//rear
			bodyDef.allowSleep = false;
			bodyDef.position.Set(_axle2.GetWorldCenter().x + 0.3*Math.cos(-Math.PI/3), _axle2.GetWorldCenter().y + 0.3*Math.sin(-Math.PI/3));

			_rearWheel = _world.CreateBody( bodyDef );
			_rearWheel.CreateFixture(_fixtureDef );
			
			_rearMotor.enableMotor = true;
			_rearMotor.maxMotorTorque = 10;
			_rearMotor.Initialize( _bikeBody, _rearWheel, _rearWheel.GetWorldCenter());
			_rearMotor_added = _world.CreateJoint( _rearMotor ) as b2RevoluteJoint;
			
			
			
			
			addEventListener(Event.ENTER_FRAME, update);
			_screen.addEventListener(KeyboardEvent.KEY_DOWN, key_down);
		}
		
		public function key_down(event:KeyboardEvent):void {
			switch (event.keyCode) {
				case Keyboard.DOWN : //40
					_isDown = true;
					break;
				case Keyboard.UP : //38
					_isUp = true;
					break; 
				case Keyboard.LEFT : //37
					_isLeft = true;
					break;
				case Keyboard.RIGHT : //39
					_isRight = true;
					break;
			}
		}
		
		public function update(e : Event):void {
			_world.Step(1/30,10,10);// was world.Step(1/30, 10);
			// this is new!
			_world.ClearForces() 
			// this is new!!
			_world.DrawDebugData();
		}
		private function drawDebug():void{
			trace("draw debug");
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			var debugSprite:Sprite = new Sprite();
			_screen.addChild(debugSprite);
			dbgDraw.SetSprite(debugSprite); // was dbgDraw.m_sprite=m_sprite;
			dbgDraw.SetDrawScale(30); // was dbgDraw.m_drawScale=30;
			//dbgDraw.SetAlpha(1); // was dbgDraw.m_alpha=1;
			dbgDraw.SetFillAlpha(0.5); // was dbgDraw.m_fillAlpha=0.5;
			dbgDraw.SetLineThickness(1); // was dbgDraw.m_lineThickness=1;
			dbgDraw.SetFlags(b2DebugDraw.e_shapeBit); // was dbgDraw.m_drawFlags=b2DebugDraw.e_shapeBit;
			_world.SetDebugDraw(dbgDraw);
		}
		


	}
}