//Determine direction.
tryingToMove = false;
tryingWhichDirection = 0;

if (keyRight && keyLeft)
{
	tryingWhichDirection = 0;
}
else if (keyRight)
{
	tryingWhichDirection = 1;
}
else if (keyLeft)
{
	tryingWhichDirection = -1;
}
	
tryingToMove = (tryingWhichDirection != 0);