package com.fantage.module.FE.test.physics.engine.constraints
{
	public interface IConstraint
	{
		function apply_force():void;
		function get type():String;
		function draw():void;
	}
}