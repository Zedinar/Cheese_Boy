scr_chr_inputs()

//for prototype purposes
INITIAL_JUMP_VELOCITY = 7;
FALLING_ACCELERATION = .2;

//Allow Lateral Movement. Should be part of it's own move script.
//Currently using walk_accel. Could make air_accel to change aerial movement.
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


//jumping
if (isTouchingGround && keyUp)
{
	velocityY = -INITIAL_JUMP_VELOCITY * max(abs(velocityX) / 3.0, 1);
}

//reduce vertical speed if not holding jump button.
if (!keyUp && !isTouchingGround)
{
	velocityY = max(velocityY, velocityY/4);
}

if (velocityY > MAX_FALLING_SPEED) velocityY = MAX_FALLING_SPEED; //max falling speed
if (velocityY < -MAX_JUMPING_SPEED) velocityY = -MAX_JUMPING_SPEED; //max jumping speed

scr_chr_collision();
scr_chr_air_friction();

if (!keyUp && isTouchingGround && (keyLeft or keyRight) && !keyRun)
{
	currentState = states.WALKING;
}

if (!keyUp && isTouchingGround && (keyLeft or keyRight) && keyRun)
{
	currentState = states.RUNNING;
}

if (!keyUp && isTouchingGround)
{
	currentState = states.IDLE;
	show_debug_message("switching to idle from jump")
}

  //Shortest jump. Replaced with speed reduction above.
//if (isJumping && tryingToJump == false && jumpHoldCounter < MIN_JUMP_HOLD)
//{
//	velocityY -= LOW_HOLD_JUMP_ACCELERATION;
//	jumpHoldCounter += 1;
//}
//  //Every Other jump
//else if (isJumping && tryingToJump && jumpHoldCounter < MAX_JUMP_HOLD && isHoldingFirstJumpInAir)
//{
//	velocityY -= HOLD_JUMP_ACCELERATION;
//	jumpHighCounter += 1;
//	jumpHoldCounter += 1;
//}
//  //Jump apex holds
//    //lowest jump (15 frames of upward movement, and 7 or less frames of button held)
//else if (isJumping && jumpHoldCounter == MIN_JUMP_HOLD && jumpApexCounter < MAX_JUMP_APEX_HOLD && jumpHighCounter <= 7)
//{
//	velocityY = JUMP_APEX_VELOCITY_LOW_JUMP;
//	jumpApexCounter += 1;
//}
//    //mid jump (15-25 frames of upward movement)
//else if (isJumping && jumpHoldCounter >= MIN_JUMP_HOLD && jumpHoldCounter <= MIN_JUMP_HOLD + 10 && jumpApexCounter < MID_JUMP_APEX_HOLD)
//{
//	velocityY = JUMP_APEX_VELOCITY_MID_JUMP;
//	jumpApexCounter += 1;
//}
//    //max jump (26-max jump frames of upward movement)
//else if (isJumping && jumpHoldCounter > MIN_JUMP_HOLD + 10 && jumpHoldCounter <= MIN_JUMP_HOLD + 20 && jumpApexCounter < LOW_JUMP_APEX_HOLD)
//{
//	velocityY = JUMP_APEX_VELOCITY_HIGH_JUMP;
//	jumpApexCounter += 1;
//}


