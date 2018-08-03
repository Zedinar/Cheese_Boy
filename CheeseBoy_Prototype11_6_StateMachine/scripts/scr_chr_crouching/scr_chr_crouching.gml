if (!keyDown)
{
	currentState = states.UNCROUCHING;
}

//state change to states.CROUCHED currently being handled by animation script. 

scr_chr_facing();
scr_chr_collision();
scr_chr_friction();

