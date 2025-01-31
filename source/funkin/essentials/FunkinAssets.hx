package funkin.essentials;

import funkin.essentials.PlayerInfo;
import funkin.objects.ui.notes.Note;
import funkin.objects.ui.notes.Strum.BabyArrow;
import funkin.states.PlayState;

/**
	FunkinAssets matches together a lot of functions for creating assets
**/
class FunkinAssets
{
	/**
		Pop Ups, like Ratings and Combo
	**/
	public static function generateRating(skin:String = 'default'):PlumaSprite
	{
		var width:Int = (skin == "pixel" ? 60 : 352);
		var height:Int = (skin == "pixel" ? 21 : 155);

		var rating:PlumaSprite = new PlumaSprite();
		rating.loadGraphic(AssetHelper.grabAsset("ratings", IMAGE, "images/ui/" + skin), true, width, height);

		for (i in 0...PlayerInfo.judgeTable.length)
			rating.animation.add(PlayerInfo.judgeTable[i].name, [i]);

		rating.setGraphicSize(Std.int(rating.width * (skin == "pixel" ? PlayState.pixelAssetSize : 0.7)));
		rating.updateHitbox();

		rating.antialiasing = (skin != "pixel");

		return rating;
	}

	public static function generateCombo(skin:String = 'default'):PlumaSprite
	{
		var width:Int = (skin == "pixel" ? 12 : 108);
		var height:Int = (skin == "pixel" ? 12 : 142);

		var combo:PlumaSprite = new PlumaSprite();
		combo.loadGraphic(AssetHelper.grabAsset("combo_numbers", IMAGE, "images/ui/" + skin), true, width, height);

		for (i in 0...10)
			combo.animation.add('num' + i, [i]);

		combo.setGraphicSize(Std.int(combo.width * (skin == "pixel" ? PlayState.pixelAssetSize : 0.5)));
		combo.updateHitbox();

		combo.antialiasing = (skin != "pixel");

		return combo;
	}

	/**
		Notes
	**/
	public static function generateStrums(babyArrow:BabyArrow, index:Int, ?texture:String = 'NOTE_assets'):BabyArrow
	{
		switch (PlayState.assetSkin)
		{
			case "pixel":
				babyArrow.loadGraphic(AssetHelper.grabAsset(texture, IMAGE, 'data/notes/default'), true, 17, 17);

				babyArrow.animation.add('static', [index]);
				babyArrow.animation.add('pressed', [4 + index, 8 + index], 12, false);
				babyArrow.animation.add('confirm', [12 + index, 16 + index], 12, false);

				babyArrow.setGraphicSize(Std.int(babyArrow.width * PlayState.pixelAssetSize));
				babyArrow.updateHitbox();
				babyArrow.antialiasing = false;

				babyArrow.addOffset('static', -67, -50);
				babyArrow.addOffset('pressed', -67, -50);
				babyArrow.addOffset('confirm', -67, -50);

				babyArrow.x += 5;
				babyArrow.y += 25;

			default:
				babyArrow.frames = AssetHelper.grabAsset(texture, SPARROW, 'data/notes/default');

				babyArrow.animation.addByPrefix(BabyArrow.colors[index], 'arrow' + BabyArrow.actions[index].toUpperCase());
				babyArrow.animation.addByPrefix('static', 'arrow${BabyArrow.actions[index].toUpperCase()}');
				babyArrow.animation.addByPrefix('pressed', '${BabyArrow.actions[index]} press', 24, false);
				babyArrow.animation.addByPrefix('confirm', '${BabyArrow.actions[index]} confirm', 24, false);

				babyArrow.setGraphicSize(Std.int(babyArrow.width * 0.7));
				babyArrow.antialiasing = true;
		}

		return babyArrow;
	}

	public static function generateNotes(note:Note, index:Int, isSustain:Bool = false):Note
	{
		switch (PlayState.assetSkin)
		{
			case "pixel":
				var indexPixel:Array<Int> = [4, 5, 6, 7];

				if (isSustain)
				{
					note.loadGraphic(AssetHelper.grabAsset('pixel_holds', IMAGE, 'data/notes/default'), true, 7, 6);
					note.animation.add(BabyArrow.colors[index] + 'holdend', [indexPixel[index]]);
					note.animation.add(BabyArrow.colors[index] + 'hold', [indexPixel[index] - 4]);
				}
				else
				{
					note.loadGraphic(AssetHelper.grabAsset('pixel_notes', IMAGE, 'data/notes/default'), true, 17, 17);
					note.animation.add(BabyArrow.colors[index] + 'Scroll', [indexPixel[index]], 12);
				}

				note.setGraphicSize(Std.int(note.width * PlayState.pixelAssetSize));
				note.updateHitbox();
				note.antialiasing = false;

			default:
				note.frames = AssetHelper.grabAsset('NOTE_assets', SPARROW, 'data/notes/default');

				if (!isSustain)
					note.animation.addByPrefix(BabyArrow.colors[index] + 'Scroll', BabyArrow.colors[index] + '0');
				else
				{
					note.animation.addByPrefix(BabyArrow.colors[index] + 'hold', BabyArrow.colors[index] + ' hold piece');
					note.animation.addByPrefix(BabyArrow.colors[index] + 'holdend', BabyArrow.colors[index] + ' hold end');

					// i'm going after phantomarcade @BeastlyGhost
					note.animation.addByPrefix('purpleholdend', 'pruple end hold');
				}

				note.setGraphicSize(Std.int(note.width * 0.7));
				note.updateHitbox();
				note.antialiasing = true;
		}

		return note;
	}
}
