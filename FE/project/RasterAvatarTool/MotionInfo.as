package com.fantage.module.FE.project.RasterAvatarTool
{
	public class MotionInfo
	{
		private var _name:String = "";
		private var _target:String = "";
		private var _repeat:Boolean = true;
		private var _allowIntercept:Boolean = false;
		private var _frames:Array = [];
		
		public function MotionInfo($name:String, $target:String, $frames:Array, $intercept:Boolean = false)
		{
			name = $name;
			target = $target;
			frames = $frames;
			allowIntercept = $intercept;
		}

		public function get frames():Array{
			return _frames;
		}

		public function set frames(value:Array):void{
			_frames = value;
		}

		public function get allowIntercept():Boolean{
			return _allowIntercept;
		}

		public function set allowIntercept(value:Boolean):void{
			_allowIntercept = value;
		}

		public function get repeat():Boolean{
			return _repeat;
		}

		public function set repeat(value:Boolean):void{
			_repeat = value;
		}

		public function get name():String{
			return _name;
		}

		public function set name(value:String):void{
			_name = value;
		}

		public function get target():String{
			return _target;
		}

		public function set target(value:String):void{
			_target = value;
		}

	}
}