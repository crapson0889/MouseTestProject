package 
{
	import org.flixel.*;
	
	public class PlayerSprite extends FlxSprite
	{
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		
		public function PlayerSprite()
		{
			super(FlxG.width / 2, FlxG.height / 2);
			loadGraphic(playerPNG, true, true, 16, 18, true);
		}
	}

}