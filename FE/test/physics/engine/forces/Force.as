package com.fantage.module.FE.test.physics.engine.forces
{
	import com.fantage.module.FE.test.physics.engine.particle.SimpleParticle;
	
	import flash.geom.Point;

	public class Force
	{
		private var _type:String = "none";
		private var _pt:SimpleParticle;
		private var _force:Point;
		
		public function Force($pt:SimpleParticle, $force:Point, $type:String = "none")
		{
			_pt = $pt;
			_force = $force;
			_type = $type;
		}
		
		public function apply_force():void{
			_pt.m_force.x += _force.x;
			_pt.m_force.y += _force.y;
		}

		
		
		
		
		
		
		
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void{
			_type = value;
		}

		public function get force():Point{
			return _force;
		}
		public function set force(value:Point):void{
			_force = value;
		}

		public function get pt():SimpleParticle{
			return _pt;
		}
		public function set pt(value:SimpleParticle):void{
			_pt = value;
		}

	}
}