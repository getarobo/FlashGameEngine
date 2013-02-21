package com.fantage.module.FE.test.physics.engine.particle
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class SimpleParticle extends MovieClip
	{
		//position
		private var _m_p:Point = new Point();
		//velocity
		private var _m_v:Point = new Point();
		//rod constraint force
		private var _rc_force:Point = new Point();
		//rod constraint dist
		private var _dist:Number = 0;
		//gravity forece
		private var _g_force:Point = new Point();
		//external force
		private var _ext_force:Point = new Point();

		//mass
		private var _mass:Number = 1;
		//pinned
		private var _pinned:Boolean = false;
		
		
		private var _mc:DisplayObject;
		private var _drawn:Boolean = false;
		
		public function SimpleParticle($pos:Point = null )
		{
			m_p = $pos;
		}
		
		public function get drawn():Boolean{
			return _drawn;
		}

		public function set drawn(value:Boolean):void{
			_drawn = value;
			trace("[PE] -SimpleParticle,drawn-");
		}

		private function set mc($mc:DisplayObject):void{
			_mc = $mc;
			drawn = true;
			_mc.x = 0;
			_mc.y = 0;
			addChild( _mc );
		}
		


		

		public function reset():void{
			m_p = new Point();
			m_v = new Point();
			rc_force = new Point();
		}
		public function draw():void{
			if( !_drawn ){
				graphics.beginFill(0xFF0011);
				graphics.drawCircle(0,0, 20);
				graphics.endFill();
				drawn = true;
			}
			trace("[PE] -SimpleParticle,draw-", _m_p);
			this.x = _m_p.x;
			this.y = _m_p.y;
			
		}
		public function clear_force():void{
			rc_force = new Point();
		}
		
		
		
		
		public function get m_force():Point{
			return _g_force.add( _rc_force ).add( _ext_force );
		}
		public function set m_force(value:Point):void{
			_ext_force += value;
		}
		
		public function get g_force():Point{
			return _g_force;
		}
		public function set g_force(value:Point):void{
			_g_force = value;
		}
		
		public function get rc_dist():Number{
			return _dist;
		}
		public function set rc_dist(value:Number):void{
			_dist = value;
		}
		
		public function get rc_force():Point{
			return _rc_force;
		}
		public function set rc_force(value:Point):void{
			_rc_force = value;
		}
		
		public function get m_v():Point{
			return _m_v;
		}
		public function set m_v(value:Point):void{
			_m_v = value;
		}
		
		public function get m_p():Point{
			return _m_p;
		}
		public function set m_p(value:Point):void{
			_m_p = value;
			draw();
		}
		
		public function get mass():Number{
			return _mass;
		}
		public function set mass(value:Number):void{
			_mass = value;
		}

		public function get pinned():Boolean{
			return _pinned;
		}
		public function set pinned(value:Boolean):void{
			_pinned = value;
		}
		

	}
}