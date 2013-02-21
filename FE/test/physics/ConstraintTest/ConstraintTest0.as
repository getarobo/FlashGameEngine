package com.fantage.module.FE.test.physics.ConstraintTest
{
	import com.fantage.module.FE.test.physics.engine.PhysicEngine;
	import com.fantage.module.FE.test.physics.engine.constraints.RodConstraint;
	import com.fantage.module.FE.test.physics.engine.particle.SimpleParticle;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class ConstraintTest0 extends Sprite
	{
		//engine
		private var _engine:PhysicEngine;
		//particle
		private var _particleList:Array = [];
		private var _forceList:Object = new Object;
		
		//flags
		private var _addedEL:Boolean = false;
		private var _updateRate:int = 5;
		private var _updateCount:int = 0;
		
		public function ConstraintTest0()
		{
			_engine = new PhysicEngine();
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage($e:Event):void{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage);
			
			createParticles();
			createExternalForces();
			createConstraints();
			
			start();
		}
		
		private function start():void{	
			if( !_addedEL){
				addEventListener( Event.ENTER_FRAME, onEnterFrame );
				_addedEL = true;
			}
		}
		
		private function stop():void{
			if( _addedEL ){
				removeEventListener( Event.ENTER_FRAME, onEnterFrame );
				_addedEL = false;
			}
		}
		
		private function onEnterFrame($e:Event):void{
			_updateCount++;
			_updateCount %= _updateRate; 
			if( ! _updateCount)
				_engine.simulation_step( _particleList, _forceList);
		}
		
		private function createParticles():void{
			var pt0:SimpleParticle = new SimpleParticle( new Point( 300, 300) );
			pt0.g_force = new Point(0, 0.8);
			_particleList.push( pt0 );
			addChild(pt0);
			
			var pt1:SimpleParticle = new SimpleParticle( new Point( 350, 300) );
			_particleList.push( pt1 );
			pt1.g_force = new Point( 0, 0.2);
			addChild(pt1);
			
		}
		
		private function createExternalForces():void{
		
		}
		
		private function createConstraints():void{
			var fList:Array = [];
			var rc:RodConstraint =  new RodConstraint( _particleList[0], _particleList[1], 50 );
			fList.push( rc );
			_forceList["constraint"] = fList; 
		}
	}
}