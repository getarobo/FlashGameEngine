package com.fantage.module.FE.project.RasterAvatarTool
{
	public class RasterAvatarConfiguration
	{
		public function RasterAvatarConfiguration()
		{
		}
		
		static public function getConfigByType($type:String):RasteravatarItemConfig{
			switch( $type ){
				case "ACCB":
					return getACCB();
					break;
				case "ACCF":
					return getACCF();
					break;
				case "ACCH":
					return getACCH();
					break;
				case "COST":
					return getCOST();
					break;
				case "ONEP":
					return getONEP();
					break;
				case "FULP":
					return getFULP();
					break;
				case "FULT":
					return getFULT();
					break;
				case "FULL":
					return getFULL();
					break;
				case "AIR4":
					return getAIR4();
					break;
				case "FUTB":
					return getFULB();
					break;
			}
			return getACCB();
		}
		
		
		static public function getFULB():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "FUTB";
			config.group = "FULL";
			config.layer = "FULL";
			config.drawPrev = "BOARD";
			config.erase = "WING,FACE,EYES,LIPS,HAIR,ACCE,EARR,ACCF,ACCH,BROW,BODY,SHOE,BOTTOM,TOP,ACCB,FRONT,FULP,FACD,EYED,LIPD"
			return config;
		}
		
		
		static public function getACCB():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type  = "ACCB";
			config.group = "ACCB";
			config.layer = "ACCB";
			config.drawPrev = "FRONT";
			return config;
		}
		
		static public function getACCF():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "ACCF";
			config.group = "ACCF";
			config.layer = "ACCF";
			config.drawPrev = "HAIR";
			return config;
		}
		
		static public function getACCH():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "ACCH";
			config.group = "ACCH";
			config.layer = "ACCH";
			config.drawPrev = "HAIR";
			return config;
		}
		
		static public function getCOST():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "COST";
			config.group = "TOP";
			config.layer = "TOP";
			config.drawPrev = "BOTTOM";
			config.erase = "BOTTOM,HAIR,SHOE";
			return config;
		}
		
		static public function getONEP():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "ONEP";
			config.group = "TOP";
			config.layer = "TOP";
			config.drawPrev = "BOTTOM";
			config.erase = "BOTTOM";
			return config;
		}
		
		static public function getFULP():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "FULP";
			config.group = "FULL";
			config.layer = "FULL";
			config.drawPrev = "BOARD";
			config.erase = "WING,HAIR,ACCE,EARR,ACCF,ACCH,BODY,SHOE,BOTTOM,ACCB,FRONT,BFRONT,EMOT,BOARD,TOP,FACD,EYED,LIPD";
			return config;
		}
		
		static public function getFULT():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "FULT";
			config.group = "FULL";
			config.layer = "FULL";
			config.drawPrev = "BOARD";
			config.erase = "WING,FACE,EYES,LIPS,HAIR,ACCE,EARR,ACCF,ACCH,BROW,BODY,SHOE,BOTTOM,TOP,ACCB,FRONT,FULP,FACD,EYED,LIPD,BOARD,BFRONT"
			return config;
		}
		
		static public function getFULL():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "FULL";
			config.group = "FULL";
			config.layer = "FULL";
			config.drawPrev = "BOARD";
			config.erase = "WING,FACE,EYES,LIPS,HAIR,ACCE,EARR,ACCF,ACCH,BROW,BODY,SHOE,BOTTOM,TOP,ACCB,FRONT,FULP,FACD,EYED,LIPD";
			return config;
		}
		
		static public function getAIR4():RasteravatarItemConfig{
			var config:RasteravatarItemConfig = new RasteravatarItemConfig();
			config.type = "AIR4";
			config.group = "BOARD";
			config.layer = "BOARD";
			config.drawPrev = "WING";
			return config;
		}
	}
}