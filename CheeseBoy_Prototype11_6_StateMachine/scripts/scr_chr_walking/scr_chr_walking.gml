//walking

MAX_WALKING_SPEED = 2.7;	//default = 2.7
WALKING_ACCELERATION = .5	// default = .5

//gravity and facing
scr_chr_facing();

if (tryingToMove)
{
	directionFacing = tryingWhichDirection;

	var acc = directionFacing * WALKING_ACCELERATION;
	if (abs(velocityX + acc) <= MAX_WALKING_SPEED) //Don't walk too fast
	{
		velocityX += acc;
	}
	else
	{
		velocityX = MAX_WALKING_SPEED * sign(acc);
	}
}

scr_chr_collision();


if (keyNone)
{
	velocityX = 0;
	currentState = states.IDLE;
}
if (keyRun)
{
	currentState = states.RUNNING;
	show_debug_message(" switching to running from walking");
}

if (keyUp && isTouchingGround)
{
	currentState = states.JUMPING;
	show_debug_message(" switching to jumping from walking");
}
