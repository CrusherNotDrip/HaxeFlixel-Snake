package snake.objects;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

/**
 * The main object and handler for the snake.
 */
class Snake extends FlxSpriteGroup
{
	var SNAKE_ID:Int = 0;

	/**
	 * Initializes the Flixel Sprite Group and sets the position to it.
	 * @param x X Position.
	 * @param y Y Position.
	 */
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
	}

	/**
	 * Adds a square to the sprite group.
	 * @param amount 
	 */
	public function addSnake(amount:Int = 1):Void
	{
		for (i in 0...amount)
		{
			var snake:FlxSprite = new FlxSprite();
			snake.makeGraphic(Constants.OBJECT_SIZE, Constants.OBJECT_SIZE, FlxColor.GREEN);
			snake.ID = SNAKE_ID;
			add(snake);

			SNAKE_ID++;
		}
	}
}