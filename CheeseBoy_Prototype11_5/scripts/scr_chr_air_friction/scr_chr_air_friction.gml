if (!isTouchingGround) //Apply air decceleration
	if (AIR_DECELERATION_FACTOR > abs(velocityX))
		velocityX = 0;
	else
		velocityX = sign(velocityX) * (abs(velocityX) - AIR_DECELERATION_FACTOR);