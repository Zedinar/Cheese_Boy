//walking

scr_chr_inputs();

MAX_WALKING_SPEED = 2.7;	//default = 2.7
WALKING_ACCELERATION = .5	// default = .5


//Determine direction. Move to it's own script when possible.
tryingToMove = false;
tryingWhichDirection = 0;

if (keyRight && keyLeft)
{
	tryingWhichDirection = 0;
}
else if (keyRight)
{
	tryingWhichDirection = 1;
}
else if (keyLeft)
{
	tryingWhichDirection = -1;
}
	
tryingToMove = (tryingWhichDirection != 0);

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
scr_chr_friction();


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
