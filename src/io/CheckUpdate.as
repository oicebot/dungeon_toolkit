package io
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.*;
	
	import logic.AUTHORIZER;
	
	public function CheckUpdate():void
	{
		var l:URLLoader=new URLLoader;
		var r:URLRequest=new URLRequest(AUTHORIZER.app.UPDATE_ADDRESS);
		//r.method=URLRequestMethod.GET;
		l.addEventListener(Event.COMPLETE,txtCompleteHandler);
		l.addEventListener(IOErrorEvent.IO_ERROR,ioerrorHandler);
		l.dataFormat=URLLoaderDataFormat.TEXT;
		l.load(r);
		
		function txtCompleteHandler(event:Event):void
		{
			var l:URLLoader=URLLoader(event.target);  
			AUTHORIZER.app.versionReceived(String(l.data));
		}
		
		function ioerrorHandler(event:Event):void
		{
			trace("网页加载失败");
		}
	}
}