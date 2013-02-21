package com.fantage.module.FE.project.RasterAvatarTool
{
	public class FrameInfo
	{
		
		private var _delay:int;
		private var _ms:int;
		private var _name:String;
		private var _sprite:int;
		
		private var _offset:int;
		private var _max:int;
		
		
		public function FrameInfo($delay:int, $ms:int, $name:String, $sprite:int, $offset:int = -1, $max:int = -1 )
		{
			_delay = $delay;
			_ms = $ms;
			_name = $name;
			_sprite = $sprite;
			_offset = $offset;
			_max = $max;
		}

		public function get max():int{
			return _max;
		}

		public function set max(value:int):void{
			_max = value;
		}

		public function get offset():int{
			return _offset;
		}

		public function set offset(value:int):void{
			_offset = value;
		}

		public function get sprite():int{
			return _sprite;
		}

		public function set sprite(value:int):void{
			_sprite = value;
		}

		public function get name():String{
			return _name;
		}

		public function set name(value:String):void{
			_name = value;
		}

		public function get ms():int{
			return _ms;
		}

		public function set ms(value:int):void{
			_ms = value;
		}

		public function get delay():int{
			return _delay;
		}

		public function set delay(value:int):void{
			_delay = value;
		}

	}
}