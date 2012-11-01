package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../assets/cursor.png')] private var cursorPNG:Class;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			FlxG.mouse.show();
			FlxG.mouse.load(cursorPNG, 1, 8, 8);
			
			Registry.player = new PlayerManager;
			add(Registry.player);
			
			Registry.debug = new FlxText(0, 0, 80, "");
			add(Registry.debug);
		}
		
	}

}