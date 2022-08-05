package;

import flixel.math.FlxRandom;

using StringTools;

class TraitStorage
{
	public static var rng:FlxRandom = new FlxRandom();
	public static var traits:Map<String, Array<String>> = [
		"occupation" => ["knight", "sorcerer", "merchant", "hunter", "soldier", "politician"],
		"adjective" => ["brave", "shy", "cowardly", "tired", "hardworking", "evil", "smart"]
	];

	public static function getThing():Array<String>
	{
		var t:Array<String> = [];
		for (i in traits.keys())
		{
			t.push(traits[i][rng.int(0, Std.int(traits[i].length - 1))]);
		}
		return t;
	}
}
