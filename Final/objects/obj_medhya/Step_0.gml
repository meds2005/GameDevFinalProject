//Turn to direction on single press of WASD
if (keyboard_check_pressed(ord("W"))) last_dir = "W";
if (keyboard_check_pressed(ord("A"))) last_dir = "A";
if (keyboard_check_pressed(ord("S"))) last_dir = "S";
if (keyboard_check_pressed(ord("D"))) last_dir = "D";

//Movement when continuously holding a key
var moved = false;

if (keyboard_check(ord("W"))) {
    sprite_index = spr_player_W;  image_speed = 0.2;
    if (!place_meeting(x, y - avatar_speed, obj_wall)) {
        y -= avatar_speed;
        moved = true;
    }
}
if (keyboard_check(ord("S"))) {
	sprite_index = spr_player_S;  image_speed = 0.2;
	if (!place_meeting(x, y + 10 + avatar_speed, obj_wall)) {
		y += avatar_speed;
		moved = true;
	}
}
if (keyboard_check(ord("A"))) {
	sprite_index = spr_player_A;  image_speed = 0.3;
    if (!place_meeting(x - 5 - avatar_speed, y, obj_wall)) {
        x -= avatar_speed;
        moved = true;
    }
}
if (keyboard_check(ord("D"))) {
    sprite_index = spr_player_D;  image_speed = 0.3;
    if (!place_meeting(x + avatar_speed, y, obj_wall)) {
        x += avatar_speed;
        moved = true;
    }
}

//If not moving this step, show the facing idle
if (!moved) {
    switch (last_dir) {
        case "W": sprite_index = spr_player_W_idle; break;
        case "A": sprite_index = spr_player_A_idle; break;
        case "S": sprite_index = spr_player_S_idle; break;
        case "D": sprite_index = spr_player_D_idle; break;
    }
    image_speed = 0;
    image_index = 0;
}

function change_rooms()
{
	if (place_meeting(x, y, obj_door))
	{
		var door = instance_place(x, y, obj_door);
		x = door.spawn_x;
		y = door.spawn_y;
		room_goto(door.destination_room);
	}
}

change_rooms()

with (obj_banana_1) {
    var dist1 = point_distance(x, y, other.x, other.y);

    // If player is close
    if (dist1 <= 130) 
	{
        if (!instance_exists(eattext_id)) 
		{
            eattext_id = instance_create_layer(x, y - 22, "Instances", obj_eattext);
        }
    } 
    else 
	{
        if (instance_exists(eattext_id)) 
		{
            instance_destroy(eattext_id);
            eattext_id = noone;
        }
    }
}

with (obj_banana) {
    var dist2 = point_distance(x, y, other.x, other.y);

    // If player is close
    if (dist2 <= 130) {
        if (!instance_exists(eattext_id)) {
            eattext_id = instance_create_layer(x, y - 22, "Instances", obj_eattext);
        }
    } 
    else {
        if (instance_exists(eattext_id)) {
            instance_destroy(eattext_id);
            eattext_id = noone;
        }
    }
}

//Maya Textbox
if (place_meeting(x, y, obj_maya)) 
{
    if (keyboard_check_pressed(vk_space) && !obj_maya_textbox.visible) 
	{
		audio_play_sound(snd_dialogue, 1, false);
        show_dialogue1 = true;
        dialogue1_timer = 0;           
        obj_maya_textbox.visible = true;  
    }
}

if (show_dialogue1) {
    dialogue1_timer ++;
    if (dialogue1_timer >= dialogue1_duration) 
	{
		if (instance_exists (obj_maya_textbox))
		{
			obj_maya_textbox.visible = false; 
		}
		dialogue1_timer = 0;
		show_dialogue1 = false;        
    }
}

//Soniya Textbox
if (place_meeting(x, y, obj_soniya)) 
{
    if (keyboard_check_pressed(vk_space) && !obj_soniya_textbox.visible) 
	{
		audio_play_sound(snd_dialogue, 1, false);
        show_dialogue2 = true;
        dialogue2_timer = 0;           
        obj_soniya_textbox.visible = true;  
    }
}

if (show_dialogue2) {
    dialogue2_timer ++;
    if (dialogue2_timer >= dialogue2_duration) 
	{
		if (instance_exists (obj_soniya_textbox))
		{
			obj_soniya_textbox.visible = false;  
		}
        dialogue2_timer = 0;
        show_dialogue2 = false;        
    }
}

//Restart
if (keyboard_check_pressed(ord("R")))
{
	game_restart();
}