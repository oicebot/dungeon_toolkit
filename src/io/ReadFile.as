package io
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.*;
	
	public function ReadFile(filename:String,defaultContent:String=""):String
	{
		var file:File=File.applicationDirectory.resolvePath(filename);
		//File.ap
		var contents:String=new String;
		if(!file.exists){
			WriteFile(filename,defaultContent);
		}
		trace('读取 '+file.nativePath);
		var stream:FileStream=new FileStream;
		stream.open(file,FileMode.READ);
		contents=stream.readUTFBytes(stream.bytesAvailable);//.readUTF();
		stream.close();
		return contents;
	}
}
