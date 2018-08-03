//for prototype purposes
INITIAL_JUMP_VELOCITY = 7;	//default = 6.7
FALLING_ACCELERATION = .3;	//default = 1
MAX_FALLING_SPEED = 6;	//default = 5.8
MAX_JUMPING_SPEED = 8;	//default is 6.7
JUMPING_DECELERATION = 3 //default is 3
HORIZONTAL_TO_VERTICAL_SPEED_FACTOR = .33 //default = .33



//jumping
if (isTouchingGround && keyUp)
{
	velocityY = -INITIAL_JUMP_VELOCITY * max(abs(velocityX)*HORIZONTAL_TO_VERTICAL_SPEED_FACTOR, 1);
	show_debug_message(string(velocityY));
	show_debug_message(string(velocityX));
	show_debug_message("jumping");
}

//reduce vertical speed if not holding jump button.
if (!keyUp && !isTouchingGround)
{
	velocityY = max(velocityY, velocityY/JUMPING_DECELERATION);
}

if (velocityY > MAX_FALLING_SPEED) velocityY = MAX_FALLING_SPEED; //max falling speed
if (velocityY < -MAX_JUMPING_SPEED) velocityY = -MAX_JUMPING_SPEED; //max jumping speed


//Facing
scr_chr_facing();

//Allow Lateral Movement. 
//Currently using walk_accel. Could make air_accel to change aerial movement.
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

//Second Collision test and Friction
scr_chr_air_friction();
scr_chr_collision();


//State Transitions

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


