//Get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyUp = keyboard_check(vk_space);
keyRun = keyboard_check(ord("K"));
keyUpDone = keyboard_check_released(vk_space);
keyChangeMap = keyboard_check(ord("M"));
keyChangeMapRelease = keyboard_check_released(ord("M"));
keyNone = keyboard_check(vk_nokey);