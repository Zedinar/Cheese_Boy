CharacterAnimate()
scr_chr_inputs()
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
switch (currentState)
{
	case states.IDLE: scr_chr_idle(); break;
	case states.WALKING: scr_chr_walking(); break;
	case states.RUNNING: scr_chr_running(); break;
	case states.JUMPING: scr_chr_jumping(); break;
	case states.CROUCHING: scr_chr_crouching(); break;
	case states.CROUCHED: scr_chr_crouched(); break;
//	case states.UNCROUCHING: scr_chr_uncrouching(); break;
}
	