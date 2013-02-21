package com.fantage.module.FE.Util
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;


	public class ScheduleTask
	{
		private var _theTimer:Timer;
		private var _scheduleList:Array = [];
		
		
		public function ScheduleTask()
		{
			_scheduleList = []
			_theTimer = new Timer(1,0);
			_theTimer.addEventListener( TimerEvent.TIMER, onTimer );
		}
		
		public function get running():Boolean{
			return _theTimer.running;
		}
		
		private function onTimer($e:TimerEvent):void{
			if (_scheduleList.length == 0 && _theTimer.running){
				_theTimer.stop();
				return;
			}
			
			if (!_theTimer.running)
				_theTimer.start();
			
			for (var i:int = 0 ; i < _scheduleList.length ; i++)
			{
				var currentTime:int = getTimer();
				var task:Object = _scheduleList[i];
				
				if (currentTime >= task.endTime)
				{
					task.method.apply(null, task.argumentList);
					if( _scheduleList == null )
						return;
					_scheduleList.splice(i, 1);
					i--;
				}
			}		
		}
		
		public function stopAll():void{
			_scheduleList = [];
			_theTimer.stop();
		}
		
		public function scheduleTask( $method:Function, $delay:int, $argumentList:Array = null ):void{
			var task:Object = new Object();
			task.delay = $delay;
			task.method = $method;
			task.argumentList = $argumentList;
			task.endTime = getTimer() + $delay;
			
			_scheduleList.push( task );
			
			if( !_theTimer.running )
				_theTimer.start();
				
		} 
		
		public function shutDown():void{
			trace("[M9] taskManager shutdown");
			_theTimer.stop();
			_theTimer.removeEventListener( TimerEvent.TIMER, onTimer );
			_scheduleList = [];
			_scheduleList = null;
			_theTimer = null;
		}
		
	}
}