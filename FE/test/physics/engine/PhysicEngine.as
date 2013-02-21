package com.fantage.module.FE.test.physics.engine
{
	import com.fantage.module.FE.test.physics.engine.constraints.IConstraint;
	import com.fantage.module.FE.test.physics.engine.forces.Force;
	import com.fantage.module.FE.test.physics.engine.particle.SimpleParticle;
	
	import flash.geom.Point;

	public class PhysicEngine
	{
		private var _dt:Number = 1;
		
		public function PhysicEngine()
		{
		}
		
		public function simulation_step( $particleList:Array, $forceList:Object, $type:String = "linear"):void{
			//linear sovler
			if( $type == "linear"){
				if( $forceList.hasOwnProperty("external") ){
					apply_external_force( $forceList["external"] );				
				}
				
				clear_force( $particleList );
				
				if( $forceList.hasOwnProperty("constraint") ){
					apply_constraint_force( $forceList["constraint"] );
				}
			}	
			
			
			euler_step( $particleList );
		}
		
		private function euler_step($pList:Array):void{
			var f:Point = new Point;
			for( var i:int = 0 ; i < $pList.length ; i++ ){
				if( $pList[i].pinned ){
					$pList[i].m_v = new Point();
				}else{
					f = $pList[i].m_force;
					$pList[i].m_v.x += f.x;
					$pList[i].m_v.y += f.y;
					
					$pList[i].m_p.x += $pList[i].m_v.x;
					$pList[i].m_p.y += $pList[i].m_v.y;
				}
				$pList[i].draw();
			}
			trace("[PE] -pList- 0:", $pList[0].m_p, "1:", $pList[1].m_p,"\n");
		}
		
		private function clear_force($ptList:Array):void{
			for each( var pt:SimpleParticle in $ptList ){
				pt.clear_force();
			}
		}
		
		private function apply_external_force( $forceList:Array):void{
			for each( var force:Force in $forceList ){
				force.apply_force();
			}
		}
		
		private function apply_constraint_force( $forceList:Array):void{
			for each( var constraint:IConstraint in $forceList ){
				constraint.apply_force();
			}
		}
		
		
		
	}
}