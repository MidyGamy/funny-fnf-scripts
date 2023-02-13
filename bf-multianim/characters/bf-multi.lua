
local leftTimer = -1;
local downTimer = -1;
local upTimer = -1;
local rightTimer = -1;

function goodNoteHit(id, dir, ntype, sus)
	if dir == 0 then
		leftTimer = 0
	end
	if dir == 1 then
		downTimer = 0
	end
	if dir == 2 then
		upTimer = 0
	end
	if dir == 3 then
		rightTimer = 0
	end
	daAnim = "sing"
	if leftTimer > -1 then
		daAnim = daAnim.."W"
	end
	if downTimer > -1 then
		daAnim = daAnim.."S"
	end
	if upTimer > -1 then
		daAnim = daAnim.."N"
	end
	if rightTimer > -1 then
		daAnim = daAnim.."E"
	end
	-- debugPrint(daAnim)
	playAnim('boyfriend', daAnim, true)
end

function onUpdate(elapsed)
	if leftTimer > -1 then
		leftTimer = leftTimer + elapsed
	end
	if leftTimer > (stepCrochet * 0.25 * 0.001) then
		leftTimer = -1
	end
	
	if downTimer > -1 then
		downTimer = downTimer + elapsed
	end
	if downTimer > (stepCrochet * 0.25 * 0.001) then
		downTimer = -1
	end

	if upTimer > -1 then
		upTimer = upTimer + elapsed
	end
	if upTimer > (stepCrochet * 0.25 * 0.001) then
		upTimer = -1
	end

	if rightTimer > -1 then
		rightTimer = rightTimer + elapsed
	end
	if rightTimer > (stepCrochet * 0.25 * 0.001) then
		rightTimer = -1
	end
end