image_speed = 1;
image_xscale = 1;

if (sprite_index == undefined) //set sprite to SPRITE_IDLE if undefined
	sprite_index = SPRITE_IDLE;

if (SPRITE_WALKING == undefined) //set sprite to SPRITE_IDLE if undefined
	SPRITE_WALKING = SPRITE_IDLE;

//temp catch all flipped
if (directionFacing == -1)
	image_xscale = -1;


if (currentState == states.IDLE)
	sprite_index = SPRITE_IDLE;


else if (currentState == states.WALKING){
	sprite_index = SPRITE_WALKING;
}

else if (currentState == states.RUNNING){
	sprite_index = SPRITE_RUNNING;
}

else if (currentState == states.CROUCHING)
{
	if (sprite_index != SPRITE_CROUCHING)
		image_index = 0;
	sprite_index = SPRITE_CROUCHING;
	if (5 < image_index && image_index <= 6) //fix for variable lengths
		currentState = states.CROUCHED;
}

else if (currentState == states.CROUCHED)
	sprite_index = SPRITE_CROUCHED;

else if (currentState == states.UNCROUCHING) //make for specific animation
{
	image_speed = -1;
	if (sprite_index == SPRITE_CROUCHED)
		image_index = 4;
	if (image_index <= 1 && sprite_index == SPRITE_CROUCHING)
		currentState = states.IDLE;
	sprite_index = SPRITE_CROUCHING;
}