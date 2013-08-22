package logic
{
	public class INTRODUCER
	{
		public function INTRODUCER(){}
		
		public static function help():String
		{
			return "投骰命令：\n" +
				"d=1d20, d+5=1d20+5, d 5=1d20+5, d-5=1d20-5\n" +
				"2d=2d20, d8 5=1d8+5, 2d4=2d4, 3d6-5=3d6-5\n" +
				"其他帮助：\n" +
				"command/cmd 	- 管理命令的查询\n" +
				"order/ord 		- 发言规则的介绍\n" +
				"help/h		- 两种形态的帮助\n" +
				"about		- 这个软件的说明";
		}
		
		public static function command():String
		{
			return "管理命令：\n" +
			"发言环境：discuss/dis, rotate/rot, prepare/pre, battle/bat\n" +
			"回合控制：list/l, now, next/n, previous/p, assign/a\n" +
			"授权管理：authorize/au, autest/aut\n" +
			"\n" +
			"细节说明：cmd 类别代号，如 cmd talk\n" +
			"类别代号：talk(发言环境)/turn(回合控制)/auth(授权管理)";
		}
		
		public static function cmdTalk():String
		{
			return "发言环境：\n" +
			"discuss/dis	- 进入自由讨论环节\n" +
			"rotate/rot	- 进入轮流发言环节，需要指定回合顺序列表\n" +
			"prepare/pre	- 进入准备转都环节，提示所有人投先攻\n" +
			"battle/bat	- 进入战斗进行环节，需要指定回合顺序列表\n" +
			"轮流发言和战斗进行时，回合自动和手动控制就会开启";
		}
		
		public static function cmdTurn():String
		{
			return "回合控制：\n" +
			"轮流发言和战斗进行时，回合自动和手动控制就会开启\n" +
			"回合指定玩家发言最后以\"/\"结尾，则自动进入下一回合\n" +
			"组织者可以使用如下命令，调整回合顺序列表及当前回合\n" +
			"list/l			- 返回当前回合顺序列表\n" +
			"list/l @名称 @名称…	- 设置列表，使用QQ自带的@功能\n" +
			"now			- 查看当前发言环境及回合(全员可使用)\n" +
			"next/n		- 组织者手动切换至下一回合\n" +
			"previous/p		- 组织者手动退回至上一回合\n" +
			"assign/a @名称	- 组织者手动切换至某单位的回合";
		}
		
		public static function cmdAuth():String
		{
			return "授权管理：\n" +
			"当前的组织者可以通过命令，使一名玩家获得组织者权限\n" +
			"此功能的使用，主要为了方便手机时不能 @名称 而开发\n" +
			"纯文本的 @名称 亦可生效，所以手机上你想手动也可以\n" +
			"authorize/au QQ账号	- 使指定玩家获得组织者权限(不是@)\n" +
			"autest/aut		- 验证自身是否具有组织者权限\n" +
			"\n" +
			"组织者：有权切换发言环境、调整回合及回合顺序列表等";
		}
		
		public static function order():String
		{
			return "发言规则：\n" +
			"自由讨论：自由发言，没有限制，各位积极参与\n" +
			"轮流发言：指定的玩家发言，发言后以\"/\"结尾，则轮到下一位\n" +
			"进入战斗：规则同上，请玩家在进行移动及动作之后以\"/\"结尾";
		}
	
		public static function about():String
		{
			return "软件说明：地牢里的小工具箱\n" +
			"挂接在 avbot 下的程序，用以投骰、组织对话秩序\n" +
			"因为没考虑英文用户会使用，所以命令没有前置符\n" +
			"\n" +
			"作者微博：http://weibo.com/bankichi\n" +
			"本屌不出名不愤青，唯一爱好是黑苹果脑残粉，\n" +
			"而且也不是程序猿，所以你敢提个新需求试试？";
		}
		
	}
}