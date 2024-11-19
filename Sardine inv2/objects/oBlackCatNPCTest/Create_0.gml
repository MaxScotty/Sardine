// Inherit the parent event
event_inherited();

depth = -bbox_bottom;

//States
NPCstates = {
	idle: {
		left: sBCleft,
		right: sBCright,
		down: sBCdown,
		up: sBCup
	},
	
	walk: {
		left: sBc_Walk_Left,
		right: sBc_Walk_Right,
		down: sBc_Walk_Down,
		up: sBC_Walk_UP
	}
}

NPCstate = NPCstates.idle;

/*NPC_spr[RIGHT] = NPCstate.right;
NPC_spr[UP] = NPCstate.up;
NPC_spr[LEFT] = NPCstate.left;
NPC_spr[DOWN] = NPCstate.down;*/

Talked = 0;



