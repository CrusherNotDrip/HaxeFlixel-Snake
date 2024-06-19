package snake.objects;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Apple extends FlxSprite
{
	var appleResetTimer:FlxTimer = new FlxTimer();

	/**
	 * This initializes the flixel sprite.
	 */
	public function new():Void
	{
		super();

		makeGraphic(Constants.OBJECT_SIZE, Constants.OBJECT_SIZE, FlxColor.RED);
	}

	/**
	 * This calls a timer (or resets it if active) and when finished, it resets the apple.
	 */
	public function regenerate():Void
	{
		trace('Attempting to reset the apple...');

		kill();

		if (appleResetTimer.active)
			appleResetTimer.reset();
		else
		{
			appleResetTimer.start(0.5, function(regenTimer:FlxTimer):Void
			{
				reset(getRandomX(), getRandomY());
				trace('Successfully reset apple! New apple position: $x | $y');
			});
		}
	}

	public function getRandomX():Int
	{
		return FlxG.random.int(0, Math.round(FlxG.width - width));
	}

	public function getRandomY():Int
	{
		return FlxG.random.int(0, Math.round(FlxG.height - height));
	}
}