package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;
import snake.states.PlayState;

/**
 * The heart of the project.
 */
class Main extends Sprite
{
	public function new():Void
	{
		super();
		addChild(new FlxGame(0, 0, PlayState));
		FlxG.mouse.visible = false;
	}
}
