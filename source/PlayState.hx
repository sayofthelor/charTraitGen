package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	var nameBox:FlxUIInputText;
	var nameLabel:FlxText;
	var goButton:FlxButton;
	var traitText:FlxText;

	override public function create():Void
	{
		#if !html5
		nameBox = new FlxUIInputText(3, 3, 150);
		nameBox.screenCenter(X);
		nameLabel = new FlxText(3, 3, 0, "Name: ");
		nameLabel.x = nameBox.x - nameLabel.width - 3;
		goButton = new FlxButton(3, nameBox.y + nameBox.height + 3, "Go!", generateText);
		goButton.screenCenter(X);
		traitText = new FlxText(3, goButton.y + goButton.height + 10, FlxG.width - 6);
		traitText.setFormat(16, 0xffffffff, CENTER);
		#else
		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xffffffff));
		nameLabel = new FlxText(3, 3, 0, "Name: ");
		nameLabel.setFormat(8, 0xff000000, LEFT);
		nameBox = new FlxUIInputText(nameLabel.x + nameLabel.width + 3, 3, 150);
		goButton = new FlxButton(3, nameBox.y + nameBox.height + 3, "Go!", generateText);
		traitText = new FlxText(3, goButton.y + goButton.height + 10, FlxG.width - 6);
		traitText.setFormat(16, 0xff000000, LEFT);
		#end
		add(nameLabel);
		add(nameBox);
		add(goButton);
		add(traitText);
		super.create();
	}

	private function generateText():Void
	{
		var thing:Array<Dynamic> = TraitStorage.getThing();
		traitText.text = nameBox.text + " is a " + thing[0] + " who is " + thing[1] + ".";
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
