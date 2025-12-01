var dist = point_distance(x, y, obj_medhya.x, obj_medhya.y);

if (dist <= 130 && keyboard_check_pressed(ord("E")) && !animating) 
{
	audio_play_sound(snd_eat, 1, false);
    animating = true;
    image_index = 1;   // Start animation at frame 2
    image_speed = 0.09; // How fast to play (tweak this)
}

// If we are animating, check if animation finished
if (animating) 
{
    if (image_index >= 3.9) { // past last frame
        instance_destroy();   // remove this object
		global.eaten1 = true;
    }
}

if (instance_exists(eattext_id)) 
{
    instance_destroy(eattext_id);
}