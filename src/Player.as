package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		
		public function Player()
		{
			super(FlxG.width / 2, FlxG.height / 2);
			loadGraphic(playerPNG, true, true, 16, 18, true);
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			FlxControl.player1.setWASDControl(true, true, true, true);
			FlxControl.player1.setMovementSpeed(200, 200, 200, 200, 100, 100);
		}
		
		override public function  update():void 
		{
			super.update();
			
			if (FlxG.mouse.justPressed())
			{
				Registry.bullets.fire();
			}
		}
	}

}