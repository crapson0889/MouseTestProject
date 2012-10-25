package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//public var player:Player = new Player;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			Registry.player = new Player;
			add(Registry.bullets);
			add(Registry.player);
			
			FlxG.mouse.show();
		}
		
	}

}