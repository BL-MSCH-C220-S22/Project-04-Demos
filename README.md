# 2D Platformer Demo: Pipes

Mario-style pipes

## Implementation

Built using Godot 3.4.2

The implementation is as follows:
 - The pipe entrance and exit are StaticBody2D nodes with corresponding collision shapes. They each have a script attached to them; the only thing in the script is a transport_to variable (Vector2), describing where the player should be teleported to. They are added to a Pipe group; that simplifies whether or not we neeed to check for a pipe
 - The player has two raycasts added, one pointing down and one pointing to the right
 - In the crouching and moving states, a check is made to see if the new raycasts are colliding with anything in the Pipe group. If so, the player's position is updated based on the pipe's transport_to variable
 - In this setup, there are circumstances under which the camera's constraints need to be adjusted. That is handled in the detection code (in the crouch and moving states)

## References

The player sprite is adaptated from [MV Platformer Male](https://opengameart.org/content/mv-platformer-male-32x64) by MoikMellah. CC0 Licensed.

## Future Development

 - Animating going into and out of the pipe

## Created by 

Jason Francis