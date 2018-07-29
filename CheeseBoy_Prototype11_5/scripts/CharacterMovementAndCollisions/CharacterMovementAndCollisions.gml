tryingToMove = (tryingWhichDirection != 0);
isTouchingGround = place_meeting(x,y+1,oWall);
isTouchingCeiling = place_meeting(x,y+1,oWall);;
isTouchingEnemy = place_meeting(x ,y,oPlayer);
isRising = (velocityY < 0);
isFalling = (velocityY > 0);
touchingWhichSideWall = 0;
if (place_meeting(x-1,y,oWall)) touchingWhichSideWall = -1;
else if (place_meeting(x+1,y,oWall)) touchingWhichSideWall = 1;
isTouchingSideWall = (touchingWhichSideWall != 0);

if (tryingToMove)
	directionFacing = tryingWhichDirection;

//character states (used primarily for animating)
if (tryingToCrouch && currentState != states.CROUCHED)
	currentState = states.CROUCHING;
else if (tryingToCrouch) {}
else if (!tryingToCrouch && currentState == states.CROUCHING)
	currentState = states.UNCROUCHING
else if (currentState == states.CROUCHED)
	currentState = states.UNCROUCHING;
else if (tryingToMove)
{
	if (tryingToRun) currentState = states.RUNNING;
	else currentState = states.WALKING;
}
else if (currentState != states.UNCROUCHING && currentState != states.CROUCHING)
	currentState = states.IDLE;


//horizontal movement
//walking
if (currentState == states.WALKING){ //Attempting to move
	var acc = directionFacing * WALKING_ACCELERATION;
	if (abs(velocityX + acc) <= MAX_WALKING_SPEED) //Don't walk too fast
		velocityX += acc;
	else
		velocityX = MAX_WALKING_SPEED * sign(acc);
}

//running
else if (currentState == states.RUNNING){ //Attempting to move
	var acc = directionFacing * RUNNING_ACCELERATION;
	if (abs(velocityX + acc) <= MAX_RUNNING_SPEED) //Don't walk too fast
		velocityX += acc;
	else
		velocityX = MAX_RUNNING_SPEED * sign(acc);
}


//friction (only horizontal)
if (isTouchingGround) //Apply ground decceleration
	if (GROUND_DECELERATION_FACTOR > abs(velocityX))
		velocityX = 0;
	else
		velocityX = sign(velocityX) * (abs(velocityX) - GROUND_DECELERATION_FACTOR);

if (!isTouchingGround) //Apply air decceleration
	if (AIR_DECELERATION_FACTOR > abs(velocityX))
		velocityX = 0;
	else
		velocityX = sign(velocityX) * (abs(velocityX) - AIR_DECELERATION_FACTOR);



//vertical movement 
if (!isTouchingGround) //Apply gravity
	velocityY += FALLING_ACCELERATION; //gravity

//jumping
if (isTouchingGround && isJumping)
	velocityY = -INITIAL_JUMP_VELOCITY * max(abs(velocityX) / 3.0, 1);
  //Shortest jump
if (isJumping && tryingToJump == false && jumpHoldCounter < MIN_JUMP_HOLD)
{
	velocityY -= LOW_HOLD_JUMP_ACCELERATION;
	jumpHoldCounter += 1;
}
  //Every Other jump
else if (isJumping && tryingToJump && jumpHoldCounter < MAX_JUMP_HOLD && isHoldingFirstJumpInAir)
{
	velocityY -= HOLD_JUMP_ACCELERATION;
	jumpHighCounter += 1;
	jumpHoldCounter += 1;
}
  //Jump apex holds
    //lowest jump (15 frames of upward movement, and 7 or less frames of button held)
else if (isJumping && jumpHoldCounter == MIN_JUMP_HOLD && jumpApexCounter < MAX_JUMP_APEX_HOLD && jumpHighCounter <= 7)
{
	velocityY = JUMP_APEX_VELOCITY_LOW_JUMP;
	jumpApexCounter += 1;
}
    //mid jump (15-25 frames of upward movement)
else if (isJumping && jumpHoldCounter >= MIN_JUMP_HOLD && jumpHoldCounter <= MIN_JUMP_HOLD + 10 && jumpApexCounter < MID_JUMP_APEX_HOLD)
{
	velocityY = JUMP_APEX_VELOCITY_MID_JUMP;
	jumpApexCounter += 1;
}
    //max jump (26-max jump frames of upward movement)
else if (isJumping && jumpHoldCounter > MIN_JUMP_HOLD + 10 && jumpHoldCounter <= MIN_JUMP_HOLD + 20 && jumpApexCounter < LOW_JUMP_APEX_HOLD)
{
	velocityY = JUMP_APEX_VELOCITY_HIGH_JUMP;
	jumpApexCounter += 1;
}


if (velocityY > MAX_FALLING_SPEED) velocityY = MAX_FALLING_SPEED; //max falling speed
if (velocityY < -MAX_JUMPING_SPEED) velocityY = -MAX_JUMPING_SPEED; //max jumping speed


//Horizontal Collisions
if (place_meeting(x+velocityX,y,oWall))
{
	while (!place_meeting(x+sign(velocityX),y,oWall))
		x = x + sign(velocityX);
	velocityX = 0;
}
x = x + velocityX;

//Vertical Collisions
if (place_meeting(x,y+velocityY,oWall))
{
	//set ground and ceiling
	while (!place_meeting(x,y+sign(velocityY),oWall))
		y = y + sign(velocityY);
	velocityY = 0;
}
y = y + velocityY;

//reset misc variables
tryingToMove = false;
tryingToRun = false;
tryingWhichDirection = 0;
tryingToCrouch = false;
tryingToJump = false;
//recalculate isTouchingGround because x and y have changed
isTouchingGround = place_meeting(x,y+1,oWall);
if (isTouchingGround)
{
	jumpHoldCounter = 0;
	jumpHighCounter = 0;
	jumpApexCounter = 0;
}