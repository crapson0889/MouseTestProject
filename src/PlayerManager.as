package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayerManager extends FlxGroup
	{
		public var sprite:PlayerSprite;
		public var lazer:FlxWeapon;
		public var flashlight:FlxSprite;
		
		[Embed(source = '../assets/bullet.png')] private var bulletPNG:Class;
		[Embed(source = '../assets/flashlight.png')] private var flashlightPNG:Class;
		
		public function PlayerManager() 
		{
			flashlight = new FlxSprite(0, 0, flashlightPNG);
			flashlight.origin = new FlxPoint(0, 0);
			add(flashlight);
			
			lazer = new FlxWeapon("lazer");
			lazer.makeImageBullet(50, bulletPNG);
			lazer.setFireRate(400);
			lazer.setBulletSpeed(200);
			add(lazer.group);
			
			sprite = new PlayerSprite;
			add(sprite);
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(sprite, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			FlxControl.player1.setWASDControl(true, true, true, true);
			FlxControl.player1.setMovementSpeed(200, 200, 200, 200, 100, 100);
		}
		
		override public function update():void 
		{
			super.update();
			
			lazer.setFiringPosition(sprite.x, sprite.y, 6, 6);
			flashlight.x = sprite.x + 8;
			flashlight.y = sprite.y + 8;
			flashlight.angle = FlxU.getAngle(new FlxPoint(sprite.x, sprite.y) , new FlxPoint(FlxG.mouse.x, FlxG.mouse.y)) + 225;
			
			if (FlxG.mouse.pressed())
			{
				lazer.fireAtMouse();
			}
		}
		
	}

}