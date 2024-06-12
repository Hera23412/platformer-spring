/// @desc Core Player Logic

//Get Player Inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space)

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,Owall)) && (key_jump)
{
		vsp = -jumpsp
}

//Horizontal collision
if (place_meeting(x+hsp, y, Owall))
{
	while (!place_meeting(x+sign(hsp),y,Owall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Colition
if (place_meeting(x,y+vsp,Owall))
{
	while (!place_meeting(x,y+sign(vsp),Owall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if  (!place_meeting(x,y+1,Owall))
{
	sprite_index = sPlayerjump;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayeridle;
	}
	else
	{
		sprite_index = sPlayerrun;
	}
}

if (hsp != 0) image_xscale = sign(hsp);