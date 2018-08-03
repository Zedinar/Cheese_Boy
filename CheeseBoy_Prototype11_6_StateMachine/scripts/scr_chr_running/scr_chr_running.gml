MAX_RUNNING_SPEED = 4.5;	//default = 4.5
RUNNING_ACCELERATION = .6;	//default = .6

//facing
scr_chr_facing();

if (tryingToMove)
{
	directionFacing = tryingWhichDirection;

	var acc = directionFacing * RUNNING_ACCELERATION;
	if (abs(velocityX + acc) <= MAX_RUNNING_SPEED) //Don't walk too fast
	{
		velocityX += acc;
	}
	else
	{
		velocityX = MAX_RUNNING_SPEED * sign(acc);
	}
}
scr_chr_collision();
scr_chr_friction();


if (keyNone)
{
	currentState = states.IDLE;
}
if (!keyRun && (keyLeft or keyRight))
{
	currentState = states.WALKING;
}

if (keyUp && isTouchingGround)
{
	currentState = states.JUMPING;
}
