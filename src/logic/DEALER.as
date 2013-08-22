package logic
{
	import str.STR;
	
	public class DEALER
	{
		public function DEALER(){}
		
		public static function dealer(qqnum:String,nick:String,text:String):String
		{
			if(!STR.onlyHas(text,["0","1","2","3","4","5","6","7","8","9","0","d"," ","+","-"])) return null;
			var dPos:int=text.indexOf("d");
			var pPos:int=text.indexOf("+");
			var sPos:int=text.indexOf(" ");
			var mPos:int=text.indexOf("-");
			
			var dices:int=int(text.substring(0,dPos));
			var faces:int=0;
			var add:int=0;
			
			if(pPos>-1){
				faces=int(text.substring(dPos+1,pPos));
				add=int(text.substring(pPos+1));
			}else if(sPos>-1){
				faces=int(text.substring(dPos+1,sPos));
				add=int(text.substring(sPos+1));
			}else if(mPos>-1){
				faces=int(text.substring(dPos+1,mPos));
				add=int(text.substring(mPos));
			}else{
				faces=int(text.substring(dPos+1));
			}
			
			if(dices<0) return null;
			if(dices==0) dices=1;
			if(faces==0) faces=20;
			
			if(dices>100||faces>200||add>100) return null;
			
			if(add==0) return (nick+" "+dices+"d"+faces+"="+roll(dices,faces,0));
			if(add>0) return (nick+" "+dices+"d"+faces+"+"+add+"="+roll(dices,faces,add));
			if(add<0) return (nick+" "+dices+"d"+faces+""+add+"="+roll(dices,faces,add));
			
			return null;
		}
		
		public static function roll(dices:int,faces:int,add:int):int
		{
			var sum:int=0;
			var i:int;
			for(i=0;i<dices;i++)
			{
				sum+=Math.floor(Math.random()*faces)+1;
			}
			sum+=add;
			return sum;
		}

	}
}