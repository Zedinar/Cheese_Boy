if (keyRun)
{
	currentState = states.RUNNING;
	show_debug_message(" switching to running from idle");
}
else if (keyRight or keyLeft)
{
	currentState = states.WALKING;
	show_debug_message(" switching to walking from idle");
}

if (keyUp)
{
	currentState = states.JUMPING;
	show_debug_message("switching to jump from idle");
}

if (keyDown && isTouchingGround)
{
	currentState = states.CROUCHING;
}
//if (keyRight && keyLeft)
//	tryingWhichDirection = 0;
//else if (keyRight)
//	tryingWhichDirection = 1;
//else if (keyLeft)
//	tryingWhichDirection = -1;


//if (isTouchingGround && tryingToJump && isJumping == false && canJumpAgain)
//{
//	isJumping = true;
//	canJumpAgain = false;
//	isHoldingFirstJumpInAir = true;
//}
//else if (isTouchingGround && isJumping)
//{
//	isJumping = false;
//	isHoldingFirstJumpInAir = false;
//}

//if (isTouchingGround && tryingToJump == false)
//{
//	canJumpAgain = true;
//}

//if (keyUpDone)
//{
//	hasReleasedJump = true;
//	isHoldingFirstJumpInAir = false;
//}

if (keyChangeMap && canChangeMap)
{
	if (room == room0)
		room_goto(room01);
	else if (room == room01)
		room_goto(room0);
}

if (mapChangeWaitFrames > 0)
{
	mapChangeWaitFrames -= 1;
}
else
{
	canChangeMap = true;
}

scr_chr_friction();
scr_chr_collision();