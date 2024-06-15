package snake.states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;

/**
 * The main game.
 *
 * This is where everything happens.
 */
class PlayState extends FlxState
{
	var apple:FlxSprite;

	public override function create():Void
	{
		setupApple();

		super.create();
	}

	function setupApple():Void
	{
		apple = new FlxSprite();
		apple.makeGraphic(Constants.OBJECT_SIZE, Constants.OBJECT_SIZE, FlxColor.RED);
		add(apple);

		repositionApple();
	}

	public override function update(elapsed:Float):Void
	{
		#if debug
		if (FlxG.keys.justPressed.L)
			resetApple();
		#end

		super.update(elapsed);
	}

	function repositionApple():Void
	{
		apple.setPosition(FlxG.random.int(0, FlxG.width), FlxG.random.int(0, FlxG.height));
	}

	var appleResetTimer:FlxTimer = new FlxTimer();

	function resetApple():Void
	{
		apple.kill();

		if (appleResetTimer.active)
			appleResetTimer.reset();
		else
		{
			appleResetTimer.start(0.5, function(regenerateApple:FlxTimer)
			{
				repositionApple();
				apple.revive();
			});
		}
	}
}
