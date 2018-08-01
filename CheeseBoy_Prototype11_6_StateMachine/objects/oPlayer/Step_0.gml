CharacterAnimate()
switch (currentState)
{
	case states.IDLE: scr_chr_idle(); break;
	case states.WALKING: scr_chr_walking(); break;
	case states.RUNNING: scr_chr_running(); break;
	case states.JUMPING: scr_chr_jumping(); break;
}
	