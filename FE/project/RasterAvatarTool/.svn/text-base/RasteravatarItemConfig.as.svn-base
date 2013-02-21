package com.fantage.module.FE.project.RasterAvatarTool
{

	public class RasteravatarItemConfig
	{
		private var _name:String = "";
		
		private var _type:String = "";
		private var _group:String = "";
		private var _layer:String = "";
		
		private var _xPos:int = 0;
		private var _yPos:int = 0 ;
		
		private var _partWidth:int = 1;
		private var _partHeight:int = 1;
		private var _partNum:int = 1;
		private var _col:int = 1;
		private var _row:int = 1;
		
		private var _drawPrev:String = "";
		private var _independent:String = "";
		private var _independentIndex:int = 0;
		private var _independentLayer:String = "BOARD";
		
		private var _erase:String = "";		
		
		public function RasteravatarItemConfig()
		{
		}

		public function get row():int{
			return _row;
		}

		public function set row(value:int):void{
			_row = value;
		}

		public function get col():int{
			return _col;
		}

		public function set col(value:int):void{
			_col = value;
		}

		public function get name():String{
			return _name;
		}

		public function set name(value:String):void{
			_name = value;
		}

		public function get independent():String{
			return _independent;
		}

		public function set independent(value:String):void{
			_independent = value;
		}

		public function get erase():String{
			return _erase;
		}

		public function set erase(value:String):void{
			_erase = value;
		}

		public function get independentLayer():String{
			return _independentLayer;
		}

		public function set independentLayer(value:String):void{
			_independentLayer = value;
			independent =  _independentIndex+","+independentLayer;
		}

		public function get independentIndex():int{
			return _independentIndex;
		}

		public function set independentIndex(value:int):void{
			_independentIndex = value;
			independent =  _independentIndex+","+independentLayer;
		}

		public function get drawPrev():String{
			return _drawPrev;
		}

		public function set drawPrev(value:String):void{
			_drawPrev = value;
		}

		public function get partNum():int{
			return _col * _row;
		}

		public function get partHeight():int{
			return _partHeight/_row;
		}

		public function set partHeight(value:int):void{
			_partHeight = value;
		}

		public function get partWidth():int{
			return _partWidth/_col;
		}

		public function set partWidth(value:int):void{
			_partWidth = value;
		}

		public function get yPos():int{
			return _yPos;
		}

		public function set yPos(value:int):void{
			_yPos = value;
		}

		public function get xPos():int{
			return _xPos;
		}

		public function set xPos(value:int):void{
			_xPos = value;
		}

		public function get layer():String{
			return _layer;
		}

		public function set layer(value:String):void{
			_layer = value;
		}

		public function get group():String{
			return _group;
		}

		public function set group(value:String):void{
			_group = value;
		}

		public function get type():String{
			return _type;
		}

		public function set type(value:String):void{
			_type = value;
		}
		
		public function toXML():XML{
		 var xml:String =
			 "<item name=\""+name+"\" independ=\"true\">\n" +
			 "<type>"+type+"</type>\n"+
			 "<group>"+group+"</group>\n"+
			 "<layer>"+layer+"</layer>\n"+
			 "<xPos>"+xPos+"</xPos>\n"+
			 "<yPos>"+yPos+"</yPos>\n"+
			 "<partWidth>"+partWidth+"</partWidth>\n"+
			 "<partHeight>"+partHeight+"</partHeight>\n"+
			 "<partNum>"+partNum+"</partNum>\n"+
			 "<refer/>\n"+
			 "<drawPrev>"+drawPrev+"</drawPrev>\n"+
			 "<independent>"+independent+"</independent>\n"+
			 "<erase>"+erase+"</erase>"+
			 "<motion/>"+
			 "</item>";
		 	 
			return new XML(	xml);
		}
		
		public function getString():String{
			var xml:String =
				"<item name=\""+name+"\" independ=\"true\">\n" +
				"<type>"+type+"</type>\n"+
				"<group>"+group+"</group>\n"+
				"<layer>"+layer+"</layer>\n"+
				"<xPos>"+xPos+"</xPos>\n"+
				"<yPos>"+yPos+"</yPos>\n"+
				"<partWidth>"+partWidth+"</partWidth>\n"+
				"<partHeight>"+partHeight+"</partHeight>\n"+
				"<partNum>"+partNum+"</partNum>\n"+
				"<refer/>\n"+
				"<drawPrev>"+drawPrev+"</drawPrev>\n"+
				"<independent>"+independent+"</independent>\n"+
				"<erase>"+erase+"</erase>\n"+
				"<motion/>\n"+
				"</item>";
			return xml;
		}

	}
}