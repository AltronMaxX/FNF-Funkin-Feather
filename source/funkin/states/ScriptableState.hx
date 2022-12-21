package funkin.states;

import feather.tools.FeatherModule;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxMath;

/**
	Parent State that handles the entire state structure from the project
	it can also be extended by a script itself
**/
class ScriptableState extends FlxUIState
{
	public var selection:Float = 0; // Defines the Current Selected Item on a State

	public var wrappableGroup:Array<Dynamic> = []; // Defines the `selection` limits

	public var stateModule:FeatherModule;

	override public function create():Void
	{
		super.create();
	}

	public function updateSelection(newSelection:Int = 0):Void
		selection = FlxMath.wrap(Math.floor(selection) + newSelection, 0, wrappableGroup.length - 1);
}

class ScriptableSubstate extends FlxSubState
{
	public var selection:Float = 0;

	public var wrappableGroup:Array<Dynamic> = [];

	public var substateModule:FeatherModule;

	override public function create():Void
	{
		super.create();
	}

	public function updateSelection(newSelection:Int = 0):Void
		selection = FlxMath.wrap(Math.floor(selection) + newSelection, 0, wrappableGroup.length - 1);
}
