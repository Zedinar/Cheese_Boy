event_inherited();


if (isTouchingSideWall)
	walkingDirection = -touchingWhichSideWall;

tryingWhichDirection = walkingDirection;


//Enemy Collision
	if(isTouchingEnemy && oPlayer.invincible = false){
		//landing on enemy
		if(oPlayer.y < y- 24){
			if (isTouchingEnemy && oPlayer.keyUp)
				{
					oPlayer.velocityY -= oPlayer.INITIAL_JUMP_VELOCITY + 5;
				}
			with(oPlayer) velocityY = -INITIAL_JUMP_VELOCITY;
			//instance_destroy();
		}
		//hitting side of enemy
		else {
			oPlayer.CheeseSalt--;
			walkingDirection = -walkingDirection;
			//oPlayer.currentState = states.IDLE;
			if (oPlayer.x > oEnemy.x) oPlayer.velocityX += 7; //player on left
			else if (oPlayer.x < oEnemy.x) oPlayer.velocityX -= -7; //player on right
			oPlayer.invincible = true;
			alarm[0] = 50;
			alarm[1] = 1;
			if(oPlayer.CheeseSalt == 0){
				room_restart();
			}
		}
	}
