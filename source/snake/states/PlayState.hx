package snake.states;

import flixel.FlxState;
import snake.objects.Apple;

/**
 * The main game.
 *
 * This is where everything happens.
 */
class PlayState extends FlxState
{
	var apple:Apple;

	override public function create():Void
	{
		setupApple();

		super.create();
	}

	function setupApple():Void
	{
		apple = new Apple();
		apple.setPosition(apple.getRandomX(), apple.getRandomY());
		add(apple);

		repositionApple();
	}

	override public function update(elapsed:Float):Void
	{
		#if debug
		if (FlxG.keys.justPressed.L)
			apple.regenerate();
		#end

		super.update(elapsed);
	}
}
