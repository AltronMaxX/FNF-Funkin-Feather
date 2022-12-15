package funkin.objects.ui.notes;

import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import funkin.song.Conductor;

/**
	Strumline class, initializes the gray notes at the top / bottom of the screen,
	it also comes with a set of functions for handling said notes
**/
class Strum extends FlxGroup
{
	public var characters:Array<Character>;

	public var babyArrows:FlxTypedGroup<BabyArrow>;

	public var notes:FlxTypedGroup<Note>;
	public var holds:FlxTypedGroup<Note>;
	public var splashes:FlxTypedGroup<NoteSplash>;

	public var downscroll:Bool = false;
	public var autoplay:Bool = true;

	public function new(x:Float, y:Float, characters:Array<Character>, autoplay:Bool = true, downscroll:Bool = false):Void
	{
		super();

		this.characters = characters;
		this.autoplay = autoplay;
		this.downscroll = downscroll;

		babyArrows = new FlxTypedGroup<BabyArrow>();

		/*
			notes = new FlxTypedGroup<Note>();
			holds = new FlxTypedGroup<Note>();
		 */
		splashes = new FlxTypedGroup<NoteSplash>();

		for (index in 0...4)
		{
			var babyArrow:BabyArrow = new BabyArrow(index);

			babyArrow.setPosition(x, y);
			babyArrow.ID = index;

			CustomAssets.generateStrums(babyArrow, index);

			babyArrow.x += (index - ((4 / 2))) * babyArrow.swagWidth;
			babyArrow.y -= 10;

			babyArrow.animation.play('static');
			babyArrows.add(babyArrow);

			babyArrow.alpha = 0;
			FlxTween.tween(babyArrow, {y: babyArrow.y + 10, alpha: babyArrow.defaultAlpha}, 1 / Conductor.songRate,
				{ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * index)});
		}

		add(babyArrows);
		add(splashes);

		// cache the splash stuff
		var firework:NoteSplash = new NoteSplash(100, 100, 0);
		firework.alpha = 0.000001;
		splashes.add(firework);
	}

	public function popUpSplash(index:Int):Void
	{
		var firework:NoteSplash = splashes.recycle(NoteSplash);
		var babyArrow:BabyArrow = babyArrows.members[index];
		firework.setupNoteSplash(babyArrow.x, babyArrow.y, index);
		firework.alpha = 1;
		splashes.add(firework);
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);
		splashes.forEachAlive(function(splash:NoteSplash)
		{
			var babyArrow:BabyArrow = babyArrows.members[splash.index];
			splash.setPosition(babyArrow.x, babyArrow.y);
			splash.scrollFactor.set(babyArrow.scrollFactor.x, babyArrow.scrollFactor.y);
			splash.angle = babyArrow.angle;
		});
	}
}
