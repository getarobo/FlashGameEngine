package com.fantage.module.FE.test.physics.engine.constraints
{
	import com.fantage.module.FE.test.physics.engine.particle.*;
	
	import flash.geom.Point;

	public class RodConstraint implements IConstraint
	{
		private var _pt0:SimpleParticle;
		private var _pt1:SimpleParticle;
		private var _dist:Number;
		private var _type:String = "Rod";
		
		
		public function RodConstraint($pt0:SimpleParticle, $pt1:SimpleParticle, $dist:Number)
		{
			_pt0 = $pt0;
			_pt1 = $pt1;
			_dist = $dist;
		}
		
		public function apply_force():void{
			var v0:Point = _pt0.m_v.clone();
			var v1:Point = _pt1.m_v.clone();
			
			var p0:Point = _pt0.m_p.clone();
			var p1:Point = _pt1.m_p.clone();
			
			var f0:Point = _pt0.m_force.clone();
			var f1:Point = _pt1.m_force.clone();
			
			
			var lagrande0:Number = ( -dot(v0,v0) - dot(p0,f0) ) / dot(p0,p0);
			var lagrande1:Number = ( -dot(v1,v1) - dot(p1,f1) ) / dot(p1,p1);
			
			
			trace("[PE] -RC,af,lagrande- p0:", p0, "p1", p1, "lag0:", lagrande0, "lag1:", lagrande1);

			var px0:Number = p0.x * lagrande0;
			var py0:Number = p0.y * lagrande0;
			
			var px1:Number = p1.x * lagrande1;
			var py1:Number = p1.y * lagrande1;
			
			trace("[PE] - paticle px0:",px0,"py0:",py0,"px1:",px1,"py1:",py1);
			
			_pt0.rc_force.x += px0;
			_pt0.rc_force.y += py0;
			
			_pt1.rc_force.x += px1;
			_pt1.rc_force.y += py1;
			
	/*		
			_pt0.rc_force.x += p0.x;
			_pt0.rc_force.y += p0.y;
			
			_pt1.rc_force.x += p1.x;
			_pt1.rc_force.y += p1.y;*/
			
		}
		
		public function get type():String{
			return _type;
		}
		
		public function draw():void{
			
		}
		
		private function dot($vec0:Point, $vec1:Point):Number{
			var num:Number = $vec0.x*$vec1.x + $vec0.y*$vec1.y;
	//		("[PE] -vec0:", $vec0, "vec1:", $vec1,"dot:",  num);
	/*		if( num == 0 )
				num = 0.000001*/
			return (num);
		}
		
	}
}