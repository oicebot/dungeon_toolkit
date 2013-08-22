package logic
{
	import str.STR;
	
	public class AUTHORIZER
	{
		private static var authorizee:String=new String;
		public static var app:dungeon_toolkit;
		
		public function AUTHORIZER(){}
		
		public static function authorizer(qqnum:String,nick:String,text:String):String
		{
			if(!isAuthorized(qqnum)) return null;
			
			authorizee=STR.afterSpace(text);
			return "已授权给 "+authorizee;
		}
		
		public static function chkAuthority(qqnum:String,nick:String,text:String):String
		{
			if (!isAuthorized(qqnum)) return (qqnum+" 没有组织者权限");
			return (qqnum+" 拥有组织者权限");
		}
		
		public static function isAuthorized(qqnum:String):Boolean
		{
			return (qqnum==app.txtAu1.text)||(qqnum==app.txtAu2.text)||(qqnum==authorizee)
		}
		
	}
}