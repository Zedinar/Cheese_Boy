//friction (only horizontal)
if (isTouchingGround) //Apply ground decceleration
	if (GROUND_DECELERATION_FACTOR > abs(velocityX))
		velocityX = 0;
	else
		velocityX = sign(velocityX) * (abs(velocityX) - GROUND_DECELERATION_FACTOR);