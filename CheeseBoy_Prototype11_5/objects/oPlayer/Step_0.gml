event_inherited();
//Get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyUp = keyboard_check(vk_space);
keyRun = keyboard_check(ord("K"));
keyUpDone = keyboard_check_released(vk_space);
keyChangeMap = keyboard_check(ord("M"));
keyChangeMapRelease = keyboard_check_released(ord("M"));

if (keyRun)
	tryingToRun = true;
if (keyRight && keyLeft)
	tryingWhichDirection = 0;
else if (keyRight)
	tryingWhichDirection = 1;
else if (keyLeft)
	tryingWhichDirection = -1;
if (keyDown)
	tryingToCrouch = true;
if (keyUp)
{
	tryingToJump = true;
	hasReleasedJump = false;
}

if (isTouchingGround && tryingToJump && isJumping == false && canJumpAgain)
{
	isJumping = true;
	canJumpAgain = false;
	isHoldingFirstJumpInAir = true;
}
else if (isTouchingGround && isJumping)
{
	isJumping = false;
	isHoldingFirstJumpInAir = false;
}

if (isTouchingGround && tryingToJump == false)
{
	canJumpAgain = true;
}

if (keyUpDone)
{
	hasReleasedJump = true;
	isHoldingFirstJumpInAir = false;
}

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