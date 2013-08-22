package io
{
	import flash.filesystem.*;

	public function WriteFile(filename:String, contents:String):void
	{
		var file:File=new File(File.applicationDirectory.resolvePath(filename).nativePath);	//这样可以
		//var file:File=File.applicationDirectory.resolvePath(filename);	//这样就不可以，尼玛
		
		trace('写入 '+file.nativePath);
		//trace(contents);
		var stream:FileStream=new FileStream;
		stream.open(file,FileMode.WRITE);
		stream.writeUTFBytes(contents);
		stream.close();
	}
}