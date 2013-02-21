package com.fantage.module.FE.test.physics.core
{
	import flash.geom.Point;

	public class Vec2d
	{
		public var position:Point;
		public var angle:Number;
		
		public function Vec2d(endPoint:Point)
		{
			position = endPoint;
		}
		
		public function inverse():Vec2d
		{
			return new Vec2d(new Point(-position.x, -position.y));
		}
		
		public function sum(otherVector:Vec2d):Vec2d
		{
			position.x += otherVector.position.x;
			position.y += otherVector.position.y;
			
			return this;
		}
		
		public function subtract(otherVector:Vec2d):Vec2d
		{
			position.x -= otherVector.position.x;
			position.y -= otherVector.position.y;
			
			return this;
		}
		
		public function multiply(number:Number):Vec2d
		{
			position.x *= number;
			position.y *= number;
			
			return this;
		}
		
		public function magnitude():Number
		{
			return Math.sqrt((position.x * position.x) + (position.y * position.y));
		}
		
		public function angle():Number
		{
			var angle:Number = Math.atan2(position.y, position.x);
			
			if (angle < 0)
			{
				angle += Math.PI * 2;
			}
			
			return angle;
		}
		
		public function dot(otherVector:Vec2d):Number
		{
			return (position.x * otherVector.position.x) + (position.y * otherVector.position.y);
		}
		
		public function angleBetween(otherVector:Vec2d):Number
		{
			return Math.acos(dot(otherVector) / (magnitude() * otherVector.magnitude()));
		}
		
		public function rangedAngleBetween(otherVector:Vec2d):Number
		{
			var firstAngle:Number;
			var secondAngle:Number;
			
			var angle:Number;
			
			firstAngle = Math.atan2(otherVector.position.y, otherVector.position.x);
			secondAngle = Math.atan2(position.y, position.x);
			
			angle = secondAngle - firstAngle;
			
			while (angle > Math.PI)
				angle -= Math.PI * 2;
			while (angle < -Math.PI)
				angle += Math.PI * 2;
			
			return angle;
		}
		
		public function normalize():Vec2d
		{
			position.x /= magnitude();
			position.y /= magnitude();
			
			return this;
		}
		
		public function normalRight():Vec2d
		{
			return new Vec2d(new Point(-position.y, position.x));
		}
		
		public function normalLeft():Vec2d
		{
			return new Vec2d(new Point(position.y, -position.x));
		}
		
		public function rotate(angleInRadians:Number):Vec2d
		{
			var newPosX:Number = (position.x * Math.cos(angleInRadians)) - (position.y * Math.sin(angleInRadians));
			var newPosY:Number = (position.x * Math.sin(angleInRadians)) + (position.y * Math.cos(angleInRadians));
			
			position.x = newPosX;
			position.y = newPosY;
			
			return this;
		}
	}
}