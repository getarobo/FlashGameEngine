package com.fantage.module.FE.Manager
{
	import com.fantage.module.FE.Component.ControlComponent;
	import com.fantage.module.FE.FE;
	
	import flash.events.Event;
	import flash.utils.Dictionary;

	public class ProcessManager
	{
		private var _update:Boolean = false;
		private var _addedEL:Boolean = false;
		
		private var _controlList:Array;
		private var _controlDict:Dictionary;
		
		public function ProcessManager()
		{
			_controlList = [];
			_controlDict = new Dictionary();
		}
		
		public function start():void{
			_update = true;
			addEL();
		}
		
		public function stop():void{
			_update = false;
			removeEL();
		}
		
		private function addEL():void{
			if( !_addedEL){
				if( FE.mainStage ){
					FE.mainStage.addEventListener( Event.ENTER_FRAME, onFrame);
				}
				_addedEL = true;
			}
		}
		
		private function removeEL():void{
			if( _addedEL){
				if( FE.mainStage )
					FE.mainStage.removeEventListener( Event.ENTER_FRAME, onFrame);
				_addedEL = false;
			}
		}
		
		private function onFrame($e:Event):void{
			if( !_update )
				return;
			var control:ControlComponent
			var spatialCount:int = 0;
			var controlCount:int = 0;
			var tickCount:int = 0;
			/*for each ( control in _controlDict ){
				if( control != null && control.owner != null ){
					control.onSpatialTick();
					spatialCount++;
				}
			}
			for each ( control in _controlDict ){
				if( control != null && control.owner != null ){
					control.onControlTick();
					controlCount++;
				}
			}*/
			for each ( control in _controlDict ){
				if( control != null && control.owner != null ){
					control.onTick();
					controlCount++;
				}
			}
			
		//	trace("[M9] - ProcessManager - onFrame - spatialDict:", spatialCount, "controlDict:",controlCount, "tickCount:", tickCount);
		}
		
		
		public function killAll($class:Class=null):void{
			var control:*;
			for each ( control in _controlDict ){
				if( control != null && control.owner != null && ($class != null && control is $class) ){
					control.owner.destroy();
				}
			}
		}
		
		
		public function registerControl($control:ControlComponent):void{
//			_controlList.push( $control );
			if( _controlDict[$control.owner.name]  )
				throw Error("Control of ["+$control.owner.name+"] is already registered");
			_controlDict[$control.owner.name] = $control;
		}
		
		public function unregisterControl($control:ControlComponent):void{
			delete _controlDict[$control.owner.name];
		}
		
		public function shutDown():void{
			stop();
			for each( var tmp:* in _controlDict ){
				tmp = null;
			}
			_controlDict = null;
			_controlList = null;

		}
		
	}
}