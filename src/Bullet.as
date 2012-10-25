package
{
	/*
	 *	Handles basic functions of a single bullet
	 * */
	import org.flixel.*;

	public class Bullet extends FlxSprite
	{
		[Embed(source = '../assets/bullet.png')] private var bulletPNG:Class;
		
		public var damage:int = 1;
		public var speed:int = 300;
		
		public function Bullet() 
		{
			super(0, 0, bulletPNG);
			
			//	We do this so it's ready for pool allocation straight away
			exists = false;
		}

		public function fire(bx:int, by:int):void
		{
			var player:Player = Registry.player;
			x = bx + 8;
			y = by + 8; 
			velocity.x = ((FlxG.mouse.x - player.x) / FlxU.abs(FlxG.mouse.y - player.y)) * 200;
			velocity.y = ((FlxG.mouse.y - player.y) / FlxU.abs(FlxG.mouse.x - player.x)) * 200;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			//	Bullet off the top of the screen?
			if (exists)
			{
				if(x < 0 || x > FlxG.width)
					exists = false;
				if(y < 0 || y > FlxG.height)
					exists = false;	
			}
		}
		
	}

}