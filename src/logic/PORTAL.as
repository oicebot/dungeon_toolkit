package logic
{
	import str.STR;
	import logic.DEALER;
	import logic.AUTHORIZER;
	import logic.CONDITIONER;

	public class PORTAL
	{
		public function PORTAL(){}
		
		public static function portal(qqnum:String,nick:String,text:String):String
		{
			//conditioner
			if(text=="discuss"||text=="dis") 	return CONDITIONER.toDiscuss(qqnum,nick,text);
			if(text=="rotate"||text=="rot")	return CONDITIONER.toRotate(qqnum,nick,text);
			if(text=="prepare"||text=="pre")	return CONDITIONER.toPrepare(qqnum,nick,text);
			if(text=="battle"||text=="bat") 	return CONDITIONER.toBattle(qqnum,nick,text);
			
			if(STR.beginwith(text,"list ")||STR.beginwith(text,"l ")) 				return CONDITIONER.chgList(qqnum,nick,text);
			if(text=="list"||text=="l") 			return CONDITIONER.showList();
			
			if(text=="now") 							return CONDITIONER.now();
			if(STR.endwith(text,"/"))				return CONDITIONER.next(qqnum,nick,text);
			if(text=="next"||text=="n") 			return CONDITIONER.next(qqnum,nick,text);
			if(text=="previous"||text=="p") 	return CONDITIONER.previous(qqnum,nick,text);
			if(STR.beginwith(text,"assign ")||STR.beginwith(text,"a ")) 			return CONDITIONER.assign(qqnum,nick,text);
			
			//authorizer
			if(STR.beginwith(text,"authorize ")||STR.beginwith(text,"au ")) 	return AUTHORIZER.authorizer(qqnum,nick,text);
			if(text=="autest"||text=="aut") 	return AUTHORIZER.chkAuthority(qqnum,nick,text);
			
			//help
			if(text==	"help"||text=="h")								return INTRODUCER.help();
			if(text==	"command"||text=="cmd")					return INTRODUCER.command();
			if(text==	"command talk"||text=="cmd talk")	return INTRODUCER.cmdTalk();
			if(text==	"command turn"||text=="cmd turn")	return INTRODUCER.cmdTurn();
			if(text==	"command auth"||text=="cmd auth")	return INTRODUCER.cmdAuth();
			if(text==	"order"||text=="ord")							return INTRODUCER.order();
			if(text==	"about")												return INTRODUCER.about();
			
			//dealer
			if(STR.onlyOne(text,"d"))	return DEALER.dealer(qqnum,nick,text);
			return null;
			
		}
		
	}
}