scr_chr_inputs()

MAX_RUNNING_SPEED = 4.5;	//default = 4.5
RUNNING_ACCELERATION = .6;	//default = .6

//Determine direction. Move to it's own script when possible.
tryingToMove = false;
tryingWhichDirection = 0;

if (keyRight && keyLeft)
	tryingWhichDirection = 0;
else if (keyRight)
	tryingWhichDirection = 1;
else if (keyLeft)
	tryingWhichDirection = -1;
	
tryingToMove = (tryingWhichDirection != 0);

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
	scr_chr_friction()
	if (velocityX == 0)
		currentState = states.IDLE;
}
if (!keyRun && (keyLeft or keyRight))
{
	currentState = states.WALKING;
	show_debug_message(" switching to walking from running");
}

if (keyUp && isTouchingGround)
{
	currentState = states.JUMPING;
	show_debug_message(" switching to jumping from running");
}
