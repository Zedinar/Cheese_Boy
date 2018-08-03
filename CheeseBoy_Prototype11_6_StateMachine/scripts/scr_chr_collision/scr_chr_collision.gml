if (!isTouchingGround) //Apply gravity.
{
	velocityY += FALLING_ACCELERATION; //gravity
}

//Horizontal Collisions
if (place_meeting(x+velocityX,y,oWall))
{
	while (!place_meeting(x+sign(velocityX),y,oWall))
		x = x + sign(velocityX);
	velocityX = 0;
}
else x = x + velocityX;

//Vertical Collisions
if (place_meeting(x,y+velocityY,oWall))
{
	//set ground and ceiling
	while (!place_meeting(x,y+sign(velocityY),oWall))
		y = y + sign(velocityY);
	velocityY = 0;
}
else y = y + velocityY;

//update Collision Variables
isTouchingGround = place_meeting(x,y+1,oWall);
isTouchingCeiling = place_meeting(x,y+1,oWall);;
isTouchingEnemy = place_meeting(x ,y,oPlayer);
isRising = (velocityY < 0);
isFalling = (velocityY > 0);
touchingWhichSideWall = 0;
if (place_meeting(x-1,y,oWall)) touchingWhichSideWall = -1;
else if (place_meeting(x+1,y,oWall)) touchingWhichSideWall = 1;
isTouchingSideWall = (touchingWhichSideWall != 0);