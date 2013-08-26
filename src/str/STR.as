package str
{
	import mx.utils.StringUtil;
	public class STR
	{
		public function STR(){}
		
		public static function onlyHas(text:String,arr:Array):Boolean
		{
			for(var i:int=0;i<text.length;i++)
			{
				if(arr.indexOf(text.charAt(i))==-1) return false;
			}
			return true;
		}
		
		public static function onlyOne(text:String,key:String):Boolean
		{
			return (text.replace(key,"").replace(key,"").length==text.length-1);
		}
		
		public static function beginwith(text:String,key:String):Boolean
		{
			return (text.substring(0,key.length)==key);
		}
		
		public static function endwith(text:String,key:String):Boolean
		{
			return (text.substring(text.length-key.length)==key);
		}
		
		public static function afterSpace(text:String):String
		{
			return text.substring(text.indexOf(" ")+1);
		}
	
		public static function trim(text:String):String
		{
			var t:String=text;
			var l:int
			var c:String;
			
			do
			{
				l=t.length;
				c=t.charAt(0);
				if (c==" "||c=="\n"||c=="\r") t=t.substring(1);
			} while (l>t.length);
			
			do
			{
				l=t.length;
				c=t.charAt(t.length-1);
				if (c==" "||c=="\n"||c=="\r") t=t.substring(0,t.length-1);
			} while (l>t.length);
			
			return t;
		}
		
		public static function split(text:String,seperator:String="@"):Array
		{
			var t:String=text+seperator;
			var l:Array=new Array;
			var j:int=0;
			
			for (var i:int=0;i<t.length;i++)
			{
				if(t.charAt(i)==seperator)
				{
					if(i!=0)
					{
						l.push(trim(t.substring(j+1,i)));
						j=i;
					}
				}
			}
			return l;
		}
	
		public static function between(text:String,left:String="{",right:String="}"):String
		{
			var j:int=0;
			
			for (var i:int=0;i<text.length;i++)
			{
				if(text.charAt(i)==left)
				{
					j=i;
				}else if(text.charAt(i)==right)
				{
					return trim(text.substring(j+1,i));
				}
			}
			return null;
		}
		
	}
}