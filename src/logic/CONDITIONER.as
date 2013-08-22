package logic
{
	import logic.AUTHORIZER;
	import str.STR;
	
	public class CONDITIONER
	{
		private static const DISCUSS		:int=0;
		private static const ROTATE		:int=1;
		private static const PREPARE		:int=2;
		private static const BATTLE			:int=3;
		
		private static var mode:int=DISCUSS;
		private static var units:Array=new Array;
		private static var players:Array=new Array;
		private static var whoseTurn:int=0;
		
		public function CONDITIONER(){}
		
		//切换状态
		public static function toDiscuss(qqnum:String,nick:String,text:String):String
		{
			if(swapModenList(qqnum,DISCUSS)==-1) return null;
			return now();
		}
		
		public static function toRotate(qqnum:String,nick:String,text:String):String
		{
			if(swapModenList(qqnum,ROTATE)==-1) return null;
			whoseTurn=0;
			return now();
		}
		
		public static function toPrepare(qqnum:String,nick:String,text:String):String
		{
			if(swapModenList(qqnum,PREPARE)==-1) return null;
			return now();
		}
		
		public static function toBattle(qqnum:String,nick:String,text:String):String
		{
			if(swapModenList(qqnum,BATTLE)==-1) return null;
			whoseTurn=0;
			return now();
		}
		
		//询问当前状态
		public static function now():String
		{
			switch (mode)
			{
				case DISCUSS:
					return "当前为自由讨论环节";
					break;
				case ROTATE:
					return "当前为轮流发言环节，"+speaker();
					break;
				case PREPARE:
					return "当前为准备战斗环节，各位投骰敏捷，作为攻击顺序";
					break;
				case BATTLE:
					return "当前为战斗进行环节，"+speaker();
					break;
			}
			return null;
		}
		
		//询问当前的指定回合对象
		private static function speaker():String
		{
			if(mode==DISCUSS||mode==PREPARE) return "当前自由发言";
			if(units.length==0) return "当前没有指定角色";
			return "当前是 "+units[whoseTurn]+" 的回合，请及时发言";
		}
		
		//进入下一回合
		public static function next(qqnum:String,nick:String,text:String):String
		{
			if(mode==DISCUSS||mode==PREPARE) return null;
			if(units.length==0) return "还未指定回合顺序列表";
			//如果组织者发送命令，或者发言者以“/“结尾
			if	(	(AUTHORIZER.isAuthorized(qqnum)&&(text=="next"||text=="n")		)||
				(	STR.trim(nick)==units[whoseTurn]&&STR.endwith(text,"/"))				)
			{
				var s:String=units[whoseTurn];
				whoseTurn++;
				if(whoseTurn>=units.length) whoseTurn=0;
				return s+" 回合结束，进入 "+units[whoseTurn]+" 的回合";
			}
			return null;
		}
		
		//退回上一回合
		public static function previous(qqnum:String,nick:String,text:String):String
		{
			if(mode==DISCUSS||mode==PREPARE) return null;
			if(!AUTHORIZER.isAuthorized(qqnum)) return null;
			if(units.length==0) return "还未指定回合顺序列表";
			whoseTurn--;
			if(whoseTurn<0) whoseTurn=units.length-1;
			return "退回至 "+units[whoseTurn]+" 的回合";
		}

		//指定进行某个回合
		public static function assign(qqnum:String,nick:String,text:String):String
		{
			if(mode==DISCUSS||mode==PREPARE) return null;
			if(!AUTHORIZER.isAuthorized(qqnum)) return null;
			if(units.length==0) return "还未指定回合顺序列表";
			var i:int=units.indexOf(STR.split(STR.afterSpace(text))[0]);
			if(i<0) return "回合顺序列表中没有此单位";
			whoseTurn=i;
			return "切换至 "+units[whoseTurn]+" 的回合"; 
		}
		
		public static function chgList(qqnum:String,nick:String,text:String):String
		{
			if(!AUTHORIZER.isAuthorized(qqnum)) return null;
			units=STR.split(STR.afterSpace(text));
			return showList();
		}
		
		public static function showList():String
		{
			var r:String= "当前发言顺序为 ";
			for (var i:int=0;i<units.length;i++)
			{
				r=r+units[i];
				if(i!=units.length-1){r=r+", "};
			}
			return r;
		}
		
		//如果从非战斗状态进入战斗状态，则将发言列表从units存入players
		private static function swapModenList(qqnum:String,toMode:int):int
		{
			//返回null证明没有权限，返回其他值，则说明状态切换成功
			if(!AUTHORIZER.isAuthorized(qqnum)) return -1;
			
			if((mode==DISCUSS||mode==ROTATE)&&(toMode==PREPARE||toMode==BATTLE))
			{
				players=units;
			}else if((toMode==DISCUSS||toMode==ROTATE)&&(mode==PREPARE||mode==BATTLE))
			{
				units=players;
			}
			mode=toMode;
			return mode;
		}
		
	}
}