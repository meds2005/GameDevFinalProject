//Textbox
draw_set_halign(fa_left);
draw_set_color(c_black);
if (instance_exists(obj_soniya))
{
	draw_sprite(spr_textbox, 0, obj_soniya.x - 200, obj_soniya.y - 180);	
	draw_set_color(c_white);
}

//Dialogues
if (global.eaten1 = false)
{
	if (instance_exists(obj_soniya))
	{
		draw_text_ext(obj_soniya.x - 180, obj_soniya.y - 150, default_text, string_height(default_text), sprite_width - 40);
	}
}
else if (global.eaten1 == true)
{
	if (instance_exists(obj_soniya))
	{
		draw_text_ext(obj_soniya.x - 180, obj_soniya.y - 140, banana_gone_text, string_height(banana_gone_text), sprite_width - 40);
	}
}