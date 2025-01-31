package funkin.objects.ui.fonts;

typedef Letter =
{
	var ?anim:Null<String>;
	var ?offset:Array<Float>;
	var ?boldOffset:Array<Float>;
}

enum LetterType
{
	LETTER;
	NUMBER;
	SYMBOL;
}

class AlphaLetters
{
	public static var letterList:Map<LetterType, String> = [
		LETTER => "abcdefghijklmnopqrstuvwxyz",
		NUMBER => "\\/|~#$%()*+-:;<=>@[]^_.,'\"´!?",
		SYMBOL => "1234567890",
	];

	public static var letterMap:Map<String, Null<Letter>> = [
		// LETTERS
		"a" => null,
		"b" => null,
		"c" => null,
		"d" => null,
		"e" => null,
		"f" => null,
		"g" => null,
		"h" => null,
		"i" => null,
		"j" => null,
		"k" => null,
		"l" => null,
		"m" => null,
		"n" => null,
		"o" => null,
		"p" => null,
		"q" => null,
		"r" => null,
		"s" => null,
		"t" => null,
		"u" => null,
		"v" => null,
		"w" => null,
		"x" => null,
		"y" => null,
		"z" => null,
		// NUMBERS
		"0" => null,
		"1" => null,
		"2" => null,
		"3" => null,
		"4" => null,
		"5" => null,
		"6" => null,
		"7" => null,
		"8" => null,
		"9" => null,
		// SYMBOLS
		"(" => null,
		")" => null,
		":" => null,
		";" => null,
		"[" => null,
		"]" => null,
		"^" => null,
		"_" => null,
		"#" => null,
		"$" => null,
		"*" => {anim: "star"},
		"+" => {anim: "plus"},
		"-" => {anim: "dash", offset: [0, 550]},
		"<" => {anim: "less"},
		">" => {anim: "greater"},
		"=" => {anim: "equals"},
		"\\" => {anim: "bslash"},
		"/" => {anim: "fslash"},
		"'" => {anim: "single quotes"},
		'"' => {anim: "double quotes"},
		"." => {anim: "period"},
		"," => {anim: "comma"},
		"?" => {anim: "question"},
		"!" => {anim: "exclamation"},
		"|" => {anim: "pipe"},
		"~" => {anim: "tilde"},
		// SPECIAL SYMBOLS
		">:(" => {anim: "angry faic"},
		"<3" => {anim: "heart"},
	];
}
