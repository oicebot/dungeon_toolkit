package formats
{
	import formats.Msg;
	
	public class MessageSending
	{
		public var protocol:String="rpc";
		public var channel:String;
		public var message:Msg;
		
		public function MessageSending()
		{
			message=new Msg;
		}
	}
}