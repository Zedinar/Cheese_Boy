MAX_WALKING_SPEED = 2.7;
WALKING_ACCELERATION = .5;

MAX_RUNNING_SPEED = 4.5;
RUNNING_ACCELERATION = .6;

GROUND_DECELERATION_FACTOR = .3; //only affects when not moving ie: will not be applied while walking
AIR_DECELERATION_FACTOR = .04; //only affects left/right does NOT affect jump/fall
FALLING_ACCELERATION = 1;
MAX_FALLING_SPEED = 5.8;

INITIAL_JUMP_VELOCITY = 7;
LOW_HOLD_JUMP_ACCELERATION = 0.01; //used only for the lowest jump
HOLD_JUMP_ACCELERATION = LOW_HOLD_JUMP_ACCELERATION * 80; //used for all other jumps
MIN_JUMP_HOLD = 15; //min frames to apply HOLD_JUMP_ACCELERATION
MAX_JUMP_HOLD = 33; //max frames to apply HOLD_JUMP_ACCELERATION
MAX_JUMPING_SPEED = 6.7;
MAX_JUMP_APEX_HOLD = 5; //maximum number of frames to stay at apex of jump. Used on lowest jump.
MID_JUMP_APEX_HOLD = 6;
LOW_JUMP_APEX_HOLD = 3; //minimum number of frames to stay at apex of jump. Used on second highest jumps.
JUMP_APEX_VELOCITY_LOW_JUMP = 3; // signed vertical velocity of the player during the apex frames of the lowest jump
JUMP_APEX_VELOCITY_MID_JUMP = 1;
JUMP_APEX_VELOCITY_HIGH_JUMP = 2; // signed vertical velocity of the player during the apex frames of the highest jump that has apex frames


SPRITE_IDLE = undefined;
SPRITE_IDLE_LEFT = undefined; //uses SPRITE_IDLE flipped if undefined
SPRITE_WALKING = undefined;
SPRITE_WALKING_LEFT = undefined; //uses SPRITE_WALKING flipped if undefined
SPRITE_CROUCHING = undefined;
SPRITE_CROUCHED = undefined;
SPRITE_UNCROUCHING = undefined; //uses SPRITE_CROUCHING reversed if undefined
SPRITE_RUNNING = undefined;


velocityX = 0;
velocityY = 0;



isTouchingGround = false;
isTouchingSideWall = false;
touchingWhichSideWall = 0; //-1 for left, +1 for right, 0 for neither
isTouchingCeiling = false;

directionFacing = 1;//-1 for left, +1 for right, [0 for neither - is this even a thing?]

enum states {IDLE, WALKING, RUNNING, CROUCHING, CROUCHED, UNCROUCHING, JUMPING}
currentState = states.IDLE;
//is_idle = false;
//is_walking = false;
//is_crouching = false;
//is_uncrouching = false;
//is_crouched = false;
isRising = false; //velocity_y < 0
isFalling = false; //velocity_y > 0
isJumping = false; //true while player is in the air after jumping
canJumpAgain = true; //set false when player jumps, and resets when player touches the ground
isHoldingFirstJumpInAir = false; //true when initial jump button press is still held after jumping


tryingToMove = false;
tryingToRun = false;
tryingWhichDirection = 0; //-1 for left, +1 for right, 0 for neither
tryingToJump = false; //Signifies jump key is held
tryingToCrouch = false;

jumpHoldCounter = 0; //count up to MAX_JUMP_HOLD
jumpHighCounter = 0; //counts how long the jump key was pressed during a jump
jumpApexCounter = 0; //count up to MAX_JUMP_APEX_HOLD
isAtApex = false; // true if player is at highest point on a jump

canChangeMap = false; // true when the map can be changed
mapChangeWaitFrames = 60; // prevents the map from being changed for 60 frames upon loading a new map