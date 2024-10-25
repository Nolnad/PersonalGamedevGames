key_up = keyboard_check(ord("W")) // keyboard_check(vk_up);
key_left = keyboard_check(ord("A")) //or keyboard_check(vk_left);
key_down = keyboard_check(ord("S")) //or keyboard_check(vk_down);
key_right = keyboard_check(ord("D")) //or keyboard_check(vk_right);

key_shoot = mouse_check_button(mb_left)

inputdir = point_direction(0,0,key_right-key_left,key_down-key_up);
inputmag = (key_right-key_left != 0) or (key_down-key_up != 0);

var 
vx, vy,
ax, ay;

vx = x-old_x
vy = y-old_y

old_x = x
old_y = y

	
fx += lengthdir_x(inputmag * accel, inputdir)
fy += lengthdir_y(inputmag * accel, inputdir)


ax = fx/mass
ay = fy/mass

fx = 0
fy = 0

x_calc = vx + ax - vx/decel
y_calc = vy + ay - vy/decel          
				
				
if key_shoot and shoot_del <= 0
{
	shoot_del = shoot_del_max
	
	instance_create_layer(x,y,"Instances",oBullet)
}
		
shoot_del = approach(shoot_del,0,1)
				   
x += x_calc
y += y_calc