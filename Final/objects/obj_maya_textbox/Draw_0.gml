//Textbox
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_sprite(spr_textbox, 0, obj_maya.x - 200, obj_maya.y - 180);	
draw_set_color(c_white);

//Dialogues
if (global.eaten2 = false)
{
	draw_text_ext(obj_maya.x - 180, obj_maya.y - 150, default_text, string_height(default_text), sprite_width - 40);

}
else if (global.eaten2 == true)
{
	draw_text_ext(obj_maya.x - 180, obj_maya.y - 140, food_gone_text, string_height(food_gone_text), sprite_width - 40);
}	