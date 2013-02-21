package com.fantage.module.FE.Entity
{
	import com.junkbyte.console.Cc;
	
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class EntityPool
	{
		private var _pools:Dictionary;
		private var _reference:Dictionary;
		private var _theBook:Array;
		
		public function EntityPool()
		{
			_pools = new Dictionary(true);
			_reference = new Dictionary(true);
			_theBook = [];
		}
		
		private function getPool( $type:Class ):Array{
			return $type in _pools ? _pools[$type] : _pools[$type] = new Array();
		}
		
		public function allocateEntity($type:Class = null):iEntity{
			
			if( $type == null )
				$type = Entity;
			var pool:Array = getPool( $type );
			if( pool.length > 0 ){
		//		Cc.log("pop");
				return pool.pop();
			}else{
		//		Cc.log("new");
				var entity:iEntity = new Entity();
				_theBook.push( entity);
				return entity;
			}
		}
		
		//NOT WORKING - wrong idea
		public function getEntityByName($name:String, $type:Class = null):iEntity{
			trace("getEntityByName name:", $name, "type:", $type);
			if( $type == null )
				$type = Entity;
			var pool:Array = getPool($type);
			for each ( var entity:iEntity in pool ){
				if( entity.name == $name ){
					trace("getEntityByName - seaching:", $name, "compare to:", entity.name);
					return entity;
				}
			}
			return null;
		}
		
		public function renewEntity( $obj:*, $type:Class = null ):void{
			if( !$type ){
				var typeName = getQualifiedClassName( $obj );
				$type = getDefinitionByName( typeName ) as Class;
			}
			var pool:Array = getPool( $type );
			$obj.renew();
			pool.push( $obj );
		}
		
		public function shutDown():void{
			trace("[FE] EntityPool shutdown");
			var type:Class = Entity;
			var pool:Array = getPool(type);
			trace("[FE] Entity Pool:", pool.length, pool);
			for each( var entity:iEntity in _theBook ){
				trace("[FE] entity des:", entity.name);
				if( entity != null && entity.alive)
					entity.destroy();
			}
		
			for each( var tmp:Array in _pools ){
				trace("[FE] foreach tmp in pools:", tmp );
				tmp = null;
			}
			_pools = null;
		}
		
		
	}
}