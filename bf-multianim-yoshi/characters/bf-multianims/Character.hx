import Conductor;

function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true); // Setting to true will override getColors() and dance().
}

var leftTimer = -1;
var downTimer = -1;
var upTimer = -1;
var rightTimer = -1;
var singLetters = ["W","S","N","E"];

function onAnim(animName:String) {
	switch (animName) {
		case "singLEFT":
			leftTimer = 0;
		case "singDOWN":
			downTimer = 0;
		case "singUP":
			upTimer = 0;
		case "singRIGHT":
			rightTimer = 0;
		case "idle":
			leftTimer = downTimer = upTimer = rightTimer = -1;
			return;
		default:
			return;
	}
	var daAnim = "sing";
	if (leftTimer > -1)
		daAnim += "W";
	if (downTimer > -1)
		daAnim += "S";
	if (upTimer > -1)
		daAnim += "N";
	if (rightTimer > -1)
		daAnim += "E";
	if (character.animation.exists(daAnim))
		character.playAnim(daAnim, true);
}

function update(elapsed:Float)
{
	if (leftTimer > -1)
	{
		leftTimer += elapsed;
		if (leftTimer >= Conductor.stepCrochet * 0.25 * 0.001)
		{
			leftTimer = -1;
		}
	}
	if (downTimer > -1)
	{
		downTimer += elapsed;
		if (downTimer >= Conductor.stepCrochet * 0.25 * 0.001)
		{
			downTimer = -1;
		}
	}
	if (upTimer > -1)
	{
		upTimer += elapsed;
		if (upTimer >= Conductor.stepCrochet * 0.25 * 0.001)
		{
			upTimer = -1;
		}
	}
	if (rightTimer > -1)
	{
		rightTimer += elapsed;
		if (rightTimer >= Conductor.stepCrochet * 0.25 * 0.001)
		{
			rightTimer = -1;
		}
	}
}