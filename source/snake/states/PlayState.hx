package snake.states;

import flixel.FlxState;
import snake.objects.Apple;
import snake.objects.Snake;

/**
 * The main game.
 *
 * This is where everything happens.
 */
class PlayState extends FlxState
{
	var apple:Apple;
	var snake:Snake;

	override public function create():Void
	{
		trace('PlayState opened! Attempting to initialize everything...');

		setupApple();
		setupSnake();

		trace('Initialized everything!');

		super.create();
	}

	function setupApple():Void
	{
		apple = new Apple();
		apple.setPosition(apple.getRandomX(), apple.getRandomY());
		add(apple);

		trace('Initialized Apple!');
	}

	function setupSnake():Void
	{
		snake = new Snake(FlxG.width / 2, FlxG.height / 2);
		add(snake);

		snake.addSnake(1);

		trace('Initialized Snake!');
	}

	override public function update(elapsed:Float):Void
	{
		checkApple();

		#if debug
		if (FlxG.keys.justPressed.L)
			apple.regenerate();
		#end

		super.update(elapsed);
	}

	function checkApple():Void
	{
		if (FlxG.overlap(snake, apple))
		{
			trace('Snake touched Apple!');

			apple.regenerate();
		}
	}
}
