package com.fantage.module.FE
{
	import com.fantage.module.FE.Entity.EntityPool;
	import com.fantage.module.FE.Entity.iEntity;
	import com.fantage.module.FE.Manager.InputManager;
	import com.fantage.module.FE.Manager.ProcessManager;
	import com.fantage.module.FE.Manager.SceneManager;
	import com.fantage.module.FE.Manager.ScoreManager;
	import com.fantage.module.FE.Manager.SoundManager;
	import com.fantage.module.FE.Util.HitTest.HitTest;
	import com.fantage.module.FE.Util.ScheduleTask;
	import com.junkbyte.console.Cc;
	import com.junkbyte.console.core.Remoting;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class FE
	{
		
		//basic
		private static var _mainClass:Sprite = null;	
		private static var _started:Boolean = false;
		private static var _mainClassName:String = "";
		private static var _mainStage:Stage;
		private static var _debug:Boolean = true;
		
		//bridge
		private static var _bridge:Object;
		
		//entity pool
		protected static var _entityPool:EntityPool;
		
		//tools
		protected static var _hitTest:HitTest;
		
		//managers
		protected static var _inputManager:InputManager;
		protected static var _processManager:ProcessManager;
		protected static var _sceneManager:SceneManager;
		protected static var _scoreManager:ScoreManager;
		protected static var _soundManager:SoundManager
		
		//utils
		protected static var _taskManager:ScheduleTask;
		
		public function FE()
		{
		}
		


		public static function startup($mainClass:Sprite, $mainClassName:String, $managers:Object = null, $debug:Boolean = true):void{
				if( _started ){
					throw new Error("[FE] already started");
				}else{
					_started = true;
				}
				//debug
				if( _debug ){
					createConsole( $mainClassName );
					//MonsterDebugger.initialize($mainClass);
				}		
				
				//basic
				_mainClass = $mainClass;
				_mainClassName = $mainClassName;
				_mainStage = _mainClass.stage;
				_debug = $debug;
				trace("[FE] mainClass:", _mainClass, "mainStage:", _mainStage);
				
				//entity pool
				_entityPool = new EntityPool();
				
				//manager
				if( $managers ){
					applyCustomManagers( $managers );
				}
				initializeManagers();
		
		}
		
		public static function shutDown():void{
			if( _started ){
				trace("[FE] shut down");
				_entityPool.shutDown();
				shutDownManagers();
				
				_started = false;
				nullifyAll();
			}
		}
			
		public static function get DEBUG():Boolean{
			return _debug;
		}
		public static function set DEBUG($debug:Boolean):void{
			
			_debug = $debug;
			
		}
		private static function applyCustomManagers($obj:Object):void{
			if( $obj.hasOwnProperty("process") ){
				log("[FE] custom ScoreManager:", $obj["score"]);
				_processManager = $obj["process"];
			}
			if( $obj.hasOwnProperty("input") ){
				log("[FE] custom ScoreManager:", $obj["score"]);
				_inputManager = $obj["input"];
			}
			if( $obj.hasOwnProperty("scene") ){
				log("[FE] custom ScoreManager:", $obj["score"]);
				_sceneManager = $obj["scene"];
			}
			if( $obj.hasOwnProperty("score") ){
				log("[FE] custom ScoreManager:", $obj["score"]);
				_scoreManager = $obj["score"];
			}
			if( $obj.hasOwnProperty("sound") ){
				log("[FE] custom ScoreManager:", $obj["score"]);
				_soundManager = $obj["sound"];
			}
				
		}
		private static function nullifyAll():void{
		//	_mainClass = null;
			_entityPool = null;
			_inputManager = null;
			_processManager = null;
			_sceneManager = null;
			_scoreManager = null;
			_soundManager = null;
		}
		
		private static function createConsole($name:String) : void
		{
			trace("Console:", $name);
			if( ! Cc.started){
				Cc.startOnStage(_mainClass, $name);
				Cc.config.commandLineAllowed = true;
				Cc.remoting = true;
				Cc.fpsMonitor = true;
				Cc.instance.remoter.remoting = Remoting.SENDER;
				Cc.visible = false;			
				log("[FE] - debug: true");
			}
		}
			
		protected static function initializeManagers():void{
	//		if( !_inputManager)
				_inputManager = new InputManager();
		//	if( !_processManager )
				_processManager = new ProcessManager();
	//		if( !_sceneManager )
				_sceneManager = new SceneManager();
	//		if( !_scoreManager )
				_scoreManager = new ScoreManager();
		//	if( !_soundManager )
				_soundManager = new SoundManager();
			//if( !_taskManager )
				_taskManager = new ScheduleTask();
			
			_hitTest = new HitTest();
		}
		
		private static function shutDownManagers():void{
			_taskManager.shutDown();
			_processManager.shutDown();
			_inputManager.shutDown();
			_sceneManager.shutDown();
			_scoreManager.shutDown();
			_soundManager.shutDown();
		}
		
		public static function allocateEntity():iEntity{
			return _entityPool.allocateEntity();
		}
		
		public static function destroyEntity( $entity:iEntity):void{
			_entityPool.renewEntity( $entity );
		}
		
		public static function getEntityByName($name:String, $type:Class = null):iEntity{
			return _entityPool.getEntityByName($name, $type);
		}

		public static function log( ...strings):void{
			if( _debug )
				Cc.log( strings );
		}
		
		
		
		
		
		
		public static function hitTest($e1:iEntity, $e2:iEntity):Boolean{
			return _hitTest.hitTest($e1, $e2);
		}
		
		
		
		
		
		public static function scheduleTask($method:Function,  $delay:Number, $vars:Array = null):void{
			_taskManager.scheduleTask( $method, $delay, $vars );
		}
		
		
		public static function get mainClass():Sprite{
			return _mainClass;
		}
		public static function get mainStage():Stage{
			return _mainStage;
		}		
		public static function get processManager():ProcessManager{
			return _processManager;		
		}		
		public static function get sceneManager():SceneManager{
			return _sceneManager;
		}		
		public static function get soundManager():SoundManager{
			return _soundManager;
		}		
		public static function get scoreManager():ScoreManager{
			return _scoreManager;
		}
		public static function set scoreManager($sm:ScoreManager):void{
			_scoreManager = $sm;
		}
		public static function get sm():ScoreManager{
			return _scoreManager;
		}
		public static function get started():Boolean{
			return _started;
		}
		public static function set bridge($bridge:Object):void{
			_bridge = $bridge;
		}
		public static function get bridge():Object{
			return _bridge;
		}
		public static function get taskManager():ScheduleTask{
			return _taskManager;
		}
		public static function set taskManager(value:ScheduleTask):void{
			_taskManager = value;
		}
		
		
	}
	
	
}