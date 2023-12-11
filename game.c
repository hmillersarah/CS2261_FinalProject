#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "game.h"
#include "sound.h"
#include <stdlib.h>

// Sounds
#include "damagesound.h"
#include "hitsound.h"
#include "dyesound.h"

// Shadow OAM
OBJ_ATTR shadowOAM[128];

// Variables
int hOff;
int vOff;
int time;

// Display variables for energy score (jump score)
int energyNum1;
int energyNum2;
int energyNum3;

// Display variables for platforms left
int platformNum1;
int platformNum2;

// Collision map check
inline unsigned char colorAt(int x, int y) {
    return collisionMap[OFFSET(x, y, MAPWIDTH)];
}

// UPDATE
// _________________________________________________________

// Update game
void updateGame() {
    // Increment time
    time++; 

    // Update player
    updatePlayer();

    // Update inks
    for (int i = 0; i < INKCNT; i++) {
        // If ink has not been collided with
        if (ink[i].active == 1) {
            updateInks(&ink[i]);
        // If player has collided with ink, begin cooldown to respawn
        } else {
            resetInks(&ink[i]);
        }
    }

    // Update platforms
    for (int i = 0; i < PLATFORMCNT; i++) {
        updatePlatforms(&platform[i]);
    }

    // If player is on level 2 or 4...
    if (currLvl == LVL2 || currLvl == LVL4) {
        // Update guards
        for (int i = 0; i < GUARDCNT; i++) {
            updateGuards(&guard[i]);
        }
    }

    // If player is on level 3 or 4...
    if (currLvl == LVL3 || currLvl == LVL4) {
        // Update obstacles
        for (int i = 0; i < OBSTACLECNT; i++) {
            updateObstacles(&obstacle[i]);
        }
    }

    // If player is respawning...
    if (player.respawning == 1) {
        // Wait for period before setting respawing to false
        if (time % 20 == 0) {
            player.respawning = 0;
        }
    }

    // If cheat is on...
    if (BUTTON_PRESSED(BUTTON_B) && (cheat == ON)) {
        changeColorCheat();
    }

    // Update energy score
    updateEnergy();
    
    // IF player has painted all platforms
    if ((paintedPlatforms == PLATFORMCNT) && (gateOpen == 0)) {
        // Open gate
        openGate();
        // Set gateOpen to true
        gateOpen = 1;
    }

    // Check if player has met requirements to win level
    enterGate();
}

// Update player
void updatePlayer() {
    // Sprite corners
    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    // Animate player
    animate(&player);

    // If player is not currently respawning...
    if (player.respawning == 0) {
        // Jump
        // If player presses up button + canJump is true
        if (BUTTON_PRESSED(BUTTON_UP) && (player.canJump == 1)) {
            // Set y direction up (gravity)
            player.yDirection = UP;
            // Set player direction (up animation)
            player.direction = UP;
            // Set prevY to current y
            player.prevY = player.y;
            // Player unable to jump until they are no longer in the air
            player.canJump = 0;
            // Decrement energy left by 1
            score -= 1;
        }

        // If player's direction is up...
        if ((player.yDirection == UP)) {
            if (
                // Collision map check
                (colorAt(leftX, topY - player.dy) == 1) && 
                (colorAt(rightX, topY - player.dy) == 1) &&
                // Continue increasing player y until it is 45 less than original position
                (player.y > (player.prevY - JUMPHEIGHT))
                ) 
            {
                // Decrement player y by dy (move upwards)
                player.y -= player.dy;
            } else {
                // Player falls
                // Set y direction down (gravity)
                player.yDirection = DOWN;
                // Set player direction down (down animation)
                player.direction = DOWN;
            }
        }

        // Drop from platform
        if (BUTTON_PRESSED(BUTTON_DOWN)) {
            // Set y direction down (gravity)
            player.yDirection = DOWN;
            // Set player direction down (down animation)
            player.direction = DOWN;
            // Set prevY to current y (dropping)
            player.prevY = player.y;
            // Player falls through platform
            player.isDropping = 1;
        }

        // Regular Gravity (player does not fall through platforms)
        if ((player.isDropping == 0) && (player.yDirection == DOWN)) {
            // Contiune falling if the player does not hit a platform or boundaries
            if (
                // Collision map check
                (colorAt(leftX, bottomY + player.dy) == 1) && 
                (colorAt(rightX, bottomY + player.dy) == 1)
            ) {
                // Increment player y by dy
                player.y += player.dy;
            } else {
                // Player able to jump again
                player.canJump = 1;
                // Reset direction to none (default animation)
                player.direction = NONE;
            }
        // Player dropping from platform
        } else if ((player.isDropping == 1) && (player.yDirection == DOWN)) {
            // Fall through single platform
            if (
                // Collision map check
                // Player can move through platforms (colorAt function returns either 1 or 2)
                (colorAt(leftX, bottomY + player.dy)) && 
                (colorAt(rightX, bottomY + player.dy)) && 
                // Player drops from current platform only, isDropping returns to 0/gravity returns to normal after 16 pixels
                (player.y < (player.prevY + PLAYERDROP))
            ) {
                // Increment player y by dy
                player.y += player.dy;
            } else {
                // Set to regular gravity, player continues to fall until they hit a platform or boundary
                player.isDropping = 0;
            }
        } 

        // Move left
        if (BUTTON_HELD(BUTTON_LEFT)) {
            if (
                // Collision map check
                (colorAt(leftX - player.dx, topY) == 1) && 
                (colorAt(leftX - player.dy, bottomY) == 1)
                ) 
            {
                player.x -= player.dx;
                player.direction = LEFT;
            }
        }
        // Move right
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            if (
                // Collision map check
                (colorAt(rightX + player.dx, topY) == 1) && 
                (colorAt(rightX + player.dy, bottomY) == 1)
                ) 
            {
                player.x += player.dx;
                player.direction = RIGHT;
            }
        }
    }

    // Move camera to follow player
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;

    // Stop camera from moving out of bounds
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;
}

// Animate player
void animate(SPRITE* s) {
    // Change frame
    if (s->timeUntilNextFrame % 10 == 0) {
        s->frame = (s->frame + 1) % s->numOfFrames;
    }
    
    // Decrease time until next frame
    while (s->timeUntilNextFrame != 0) {
        s->timeUntilNextFrame--;
    } 
    
    // Reset time until next frame if it hits 0
    if (s->timeUntilNextFrame == 0) {
        s->timeUntilNextFrame = 10;
    }
}

// Update inks upon collision
void updateInks(SPRITE* i) {
    // Check if player has collided with ink
    if (collision(player.x, player.y, player.width, player.height, i->x, i->y, i->width, i->height)) {
        // Change player color
        changeColor(i);
        // Hide ink sprite temporarily
        i->active = 0;
        // Play player + ink collision sound
        playSoundA(dyesound_data, dyesound_length, 0);
    }
}

// Respawn inks
void resetInks(SPRITE* i) {
    // Respawn ink after cooldown period
    if (time % 100 == 0) {
        i->active = 1;
    }
}

// Change player color
void changeColor(SPRITE* i) {
    // If ink is gray...
    if (i->color == GRAY) {
        // Player becomes gray
        player.color = GRAY;
    // If player is gray...
    } else if (player.color == GRAY) {
        // Player takes on ink color
        player.color = i->color;
    } else {
        // If player is blue...
        if (player.color == BLUE) {
            // Yellow ink creates green
            if (i->color == YELLOW) {
                player.color = GREEN;
            // Red ink creates purple
            } else if (i->color == RED) {
                player.color = PURPLE;
            }
        // If palyer is yellow...
        } else if (player.color == YELLOW) {
            // Blue ink creates green
            if (i->color == BLUE) {
                player.color = GREEN;
            // Red ink creates orange
            } else if (i->color == RED) {
                player.color = ORANGE;
            }
        // If player is red...
        } else if (player.color == RED) {
            // Blue ink creates purple
            if (i->color == BLUE) {
                player.color = PURPLE;
            // Yellow ink creates orange
            } else if (i->color == YELLOW) {
                player.color = ORANGE;
            }
        } 
    }
}

// Cheat to change player color using Button B
void changeColorCheat() {
    switch (player.color) {
        case GRAY:
            player.color = RED;
            break;
        case RED:
            player.color = ORANGE;
            break;
        case ORANGE:
            player.color = YELLOW;
            break;
        case YELLOW:
            player.color = GREEN;
            break;
        case GREEN:
            player.color = BLUE;
            break;
        case BLUE:
            player.color = PURPLE;
            break;
        case PURPLE:
            player.color = GRAY;
            break;
    }
}

// Paint platforms
void updatePlatforms(SPRITE* p) {
    // If player steps on platform
    if (collision(player.x, player.y, player.width, player.height, p->x, (p->y - 1), p->width, 1)) {
        // If platform has not been colored and the player matches the platform color...
        if ((p->active == 0) && (player.color == p->color)) {
            // Paint platform
            p->active = 1;
            // Increase painted platform counter
            paintedPlatforms++;
        }
    }

    // Set vars used to display platforms left
    platformNum1 = paintedPlatforms / 10;
    platformNum2 = paintedPlatforms % 10;
}

// Tilemap modification to open escape gate
void openGate() {
    // Current tile ID to replace existing tile
    int currTID;
    // Loop through each tile ID (changes by row, increments by column) and row for 3X3 tile area
    for (int j = 0; j < 3; j++) {
        // Set level-specific tile IDs depending on row
        switch (j) {
            case 0:
                currTID = TID1;
                break;
            case 1:
                currTID = TID2;
                break;
            case 2:
                currTID = TID3;
                break;
        }
        // Loop through each tilemap column
        for (int i = 0; i < 4; i++) {
            // offset x increments for each column
            // tilemodY remains the same for each column, updates each row
            // currTID updates tile id for each new column tile
            SCREENBLOCK[31].tilemap[OFFSET((tilemodX + i), tilemodY, 32)] = TMAP_ENTRY_TILEID((currTID + i));
        }
        
        // Go to new row
        tilemodY += 1;
    }
}

// Check if player has won
void enterGate() {
    // If player collides with gate...
    if (collision(player.x, player.y, player.width, player.height, gate.x, gate.y, gate.width, gate.height)) {
        // If all paltforms have been painted and player color matches gate color...
        if ((paintedPlatforms == PLATFORMCNT) && (player.color == gate.color)) {
            // Set level complete variable to true
            lvlComplete = 1;
        }
    }
}

// Update obstacles
void updateObstacles(SPRITE* o) {
    // Sprite corners
    int leftX = o->x;
    int rightX = o->x + o->width - 1;
    int topY = o->y;
    int bottomY = o->y + o->height - 1;
    
    // Animate obstacles
    animate(o);

    // If the obstacle is moving up...
    if (o->direction == UP) {
        // If the obstacle has not hit a wall or platform...
        if ((colorAt(leftX, topY - o->dy) == 1) && 
            (colorAt(rightX, topY - o->dy) == 1)) {
                // Update the obstacle's y
                o->y -= o->dy;
        } else {
            // Else switch the direction of the obstacle
            o->direction = DOWN;
        }
    } 

    // If the obstacle is moving down...
    if (o->direction == DOWN) {
        // If the obstacle has not hit a wall or platform...
        if ((colorAt(leftX, bottomY + o->dy) == 1) && 
            (colorAt(rightX, bottomY + o->dy) == 1)) {
                // Update the obstacle's y
                o->y += o->dy;
        } else {
            // Else switch the direction of the obstacle
            o->direction = UP;
        }
    } 

    // If the obstacle is moving right...
    if (o->direction == RIGHT) {
        // If the obstacle has not hit a wall or platform...
        if ((colorAt(rightX + o->dx, topY) == 1) && 
            (colorAt(rightX + o->dy, bottomY) == 1)) {
                // Update the obstacle's x
                o->x += o->dx;
        } else {
            // Else switch the direction of the obstacle
            o->direction = LEFT;
        }
    }

    // If the obstacle is moving left...
    if (o->direction == LEFT) {
        // If the obstacle has not hit a wall or platform...
        if ((colorAt(leftX - o->dx, topY) == 1) && 
            (colorAt(leftX - o->dy, bottomY) == 1)) {
                // Update the obstacle's x
                o->x -= o->dx;
        } else {
            // Else switch the direction of the obstacle
            o->direction = RIGHT;
        }
    }

    // If player collides with obstacle...
    if (collision(player.x, player.y, player.width, player.height, o->x, o->y, o->width, o->height)) {
        // Play damage sound
        playSoundA(hitsound_data, hitsound_length, 0);
        // Decrement score
        score -= 5;
        // Reset player
        resetPlayer();
    }
}

// Reset player
void resetPlayer() {
    // Set player animation to default
    player.direction = NONE;

    // Player able to jump
    player.canJump = 1;

    // Return player to starting position
    player.x = 20;
    player.y = 216;
    // At top for level 2
    if (currLvl == LVL2) {
        player.y = 24;
    }

    // Set player's previous y to current y
    // Prevents player from immediately jumping upon respawn
    player.prevY = player.y;

    // Player set to respawn 
    player.respawning = 1;
}

// Update energy score display
void updateEnergy() {
    // Hundreds place
    energyNum1 = (score / 10) / 10;
    // Tens place
    energyNum2 = (score / 10)  % 10;
    // Ones place
    energyNum3 = (score % 10);
}

// Update guards
void updateGuards(SPRITE* g) {
    // If player's y index is within range of the guard's y index...
    if (player.y == g->y) {
        // Guard increases their speed
        g->dx = 2;
        // If player is to the right of the guard...
        if (player.x > g->x) {
            // If guard is not at the right edge of their platform...
            if (g->x <= g->maxX - 1) {
                // Move the guard right
                g->x += g->dx;
                g->direction = RIGHT;
            }
        // If the player is to the left of the guard...
        } else if (player.x < g->x) {
            // If the guard is not at the left edge of their platform...
            if (g->x >= g->minX + 1) {
                // Move the guard left
                g->x -= g->dx;
                g->direction = LEFT;
            } 
        }
    } else {
        // Guard speed set to normal
        g->dx = 1;
        // If the guard is moving right...
        if (g->direction == RIGHT) {
            // If the guard has not hit a wall or platform...
            if (g->x <= g->maxX - 1) {
                    // Update the guards's x
                    g->x += g->dx;
            } else {
                // Else switch the direction of the guard
                g->direction = LEFT;
            }
        }

        // If the guard is moving left...
        if (g->direction == LEFT) {
            // If the guard has not hit a wall or platform...
            if (g->x >= g->minX + 1) {
                    // Update the guard's x
                    g->x -= g->dx;
            } else {
                // Else switch the direction of the guard
                g->direction = RIGHT;
            }
        }
    }

    // Animate guard
    animate(g);

    // If guard is active and collides with player...
    if ((g->active == 1) && (collision(g->x, g->y, g->width, g->height, player.x, player.y, player.width, player.height))) {
        // If player has fallen on guard and matches the guard's color...
        if ((player.direction == DOWN) && (player.color == g->color)) {
            // Play destroyed rat sound
            playSoundA(damagesound_data, damagesound_length, 0);
            // Deactivate guard
            g->active = 0;
        // Else reset player
        } else {
            // Play player hit sound
            playSoundA(hitsound_data, hitsound_length, 0);
            // Decrement score
            score -= 5;
            // Reset player
            resetPlayer();
        }
    }
}

// DRAW
// _________________________________________________________

// Draw game
void drawGame() {
    // Draw player
    drawPlayer();
    // Draw inks
    drawInks();
    // Draw platforms
    drawPlatforms();

    // Draw level 2 guards
    if (currLvl == LVL2 || currLvl == LVL4) {
        drawGuards();
    }

    // Draw level 3 obstacles
    if (currLvl == LVL3 || currLvl == LVL4) {
        drawObstacles();
    }

    // Draw overlay displays for energy and platform count
    drawEnergy();
    drawPlatformCnt();

    // Wait for vblank
    waitForVBlank();
    // Copy shadowOAM into OAM
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM) / 2);
    // Copy hOff and vOff into registers
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Draw player
void drawPlayer() {
    // ATTR0
    // If player is respawning...
    if (player.respawning == 1) {
        // Use Mosaic effect on player
        REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
        shadowOAM[10].attr0 = ATTR0_MOSAIC | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);;
    // Else draw player normally
    } else {
        shadowOAM[10].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
    }
    // ATTR1
    // If player is moving left...
    if (player.direction == LEFT) {
        // Flip sprite
        shadowOAM[10].attr1 = ATTR1_SMALL | ATTR1_X(player.x - hOff) | ATTR1_HFLIP;
    } else {
        shadowOAM[10].attr1 = ATTR1_SMALL | ATTR1_X(player.x - hOff);
    }
    // ATTR2
    // Player color -> Row of palette
    // player direction -> Column of spritesheet
    // Player frame -> Row of spritesheet
    shadowOAM[10].attr2 = ATTR2_PALROW(player.color) | ATTR2_TILEID((player.direction * 2), (player.frame * 2));
}

// Draw guards
void drawGuards() {
    // Loop through guards
    for (int i = 0; i < GUARDCNT; i++) {
        // If guard is active...
        if (guard[i].active) {       
            // If guard is on camera... 
            if (((guard[i].y - vOff < SCREENHEIGHT) && (guard[i].y - vOff > 0)) && ((guard[i].x - hOff < SCREENWIDTH) && (guard[i].x - hOff > 0))) {
                // Display guard
                shadowOAM[11 + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(guard[i].y - vOff);
                // If guard is moving left, flip sprite
                if (guard[i].direction == LEFT) {
                    shadowOAM[11 + i].attr1 = ATTR1_TINY | ATTR1_X(guard[i].x - hOff) | ATTR1_HFLIP;
                } else {
                    shadowOAM[11 + i].attr1 = ATTR1_TINY | ATTR1_X(guard[i].x - hOff);
                }
                // Guard color -> Palette row
                // Guard frame -> Spritesheet row
                shadowOAM[11 + i].attr2 = ATTR2_PALROW(guard[i].color) | ATTR2_TILEID(10, guard[i].frame * 2);
            // Hide guards not on camera
            } else {
                shadowOAM[11 + i].attr0 = ATTR0_HIDE;
            }
        // Hide inactive guards
        } else {
            shadowOAM[11 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// Draw inks
void drawInks() {
    // Loop through ink sprites
    for (int i = 0; i < INKCNT; i++) {
        // If ink is on camera...
        if (((ink[i].y - vOff < SCREENHEIGHT) && (ink[i].y - vOff > 0)) && ((ink[i].x - hOff < SCREENWIDTH) && (ink[i].x - hOff > 0))) {
            // If ink is active...
            if (ink[i].active == 1)  {
                // Display ink
                shadowOAM[32 + i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(ink[i].y - vOff);

            // If ink is inactive...
            } else {
                // Make ink transparent
                // Set BG0 to bottom layer for blending
                REG_BLDCNT = BLD_STD | BLD_BOT(0);
                // Blend ratio
                REG_BLDALPHA = BLD_EVA(6) | BLD_EVB(10);
                // Display ink
                shadowOAM[32 + i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(ink[i].y - vOff) | ATTR0_BLEND;
            }

            shadowOAM[32 + i].attr1 = ATTR1_TINY | ATTR1_X(ink[i].x - hOff);
            // Ink color -> Palette row
            shadowOAM[32 + i].attr2 = ATTR2_PALROW(ink[i].color) | ATTR2_TILEID(11, 3);
        // Else hide ink
        } else {
            // Hide ink
            shadowOAM[32 + i].attr0 = ATTR0_HIDE;

        }
    }
}

// Draw platforms
void drawPlatforms() {
    // Loop through platforms
    for (int i = 0; i < PLATFORMCNT; i++) {
        // If platform is on camera
        if (((platform[i].y - vOff < SCREENHEIGHT) && (platform[i].y - vOff > 0))) {
            shadowOAM[15 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(platform[i].y - vOff);
            shadowOAM[15 + i].attr1 = ATTR1_SMALL | ATTR1_X(platform[i].x - hOff);
            // If platform is unpainted...
            if (platform[i].active == 0) {
                // Use unpainted platform sprite
                // Platform color -> Palette row
                shadowOAM[15 + i].attr2 = ATTR2_PALROW(platform[i].color) | ATTR2_TILEID(16, 0);
            // If platform is painted...
            } else {
                // Use painted platform sprite
                shadowOAM[15 + i].attr2 = ATTR2_PALROW(platform[i].color) | ATTR2_TILEID(16, 1);
            }
        // Else hide platform
        } else {
            shadowOAM[15 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// Draw obstacles
void drawObstacles() {
    // Loop through obstacle sprites
    for (int i = 0; i < OBSTACLECNT; i++) {
        // If obstacles is on camera, display obstacle
        if (((obstacle[i].y - vOff < SCREENHEIGHT) && (obstacle[i].y - vOff > 0)) && ((obstacle[i].x - hOff < SCREENWIDTH) && (obstacle[i].x - hOff > 0))) {
            shadowOAM[27 + i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(obstacle[i].y - vOff);
            shadowOAM[27 + i].attr1 = ATTR1_TINY | ATTR1_X(obstacle[i].x - hOff);
            // Obstacle frame -> Spritesheet row
            shadowOAM[27 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(11, obstacle[i].frame);
        // Else, hide obstacle
        } else {
            shadowOAM[27 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// Draw energy display
void drawEnergy() {
    // Static text
    shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
    shadowOAM[3].attr1 = ATTR1_LARGE | ATTR1_X(150);
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 7) | ATTR2_PRIORITY(0);

    // Energy (hundreds place)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(194);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(energyNum1, 6) | ATTR2_PRIORITY(0);

    // Energy (tens place)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[1].attr1 = ATTR1_TINY | ATTR1_X(199);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(energyNum2, 6) | ATTR2_PRIORITY(0);

    // Energy (ones place)
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[0].attr1 = ATTR1_TINY | ATTR1_X(204);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(energyNum3, 6) | ATTR2_PRIORITY(0);

}

// Draw platform count display
void drawPlatformCnt() {
    // Static text
    shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
    shadowOAM[9].attr1 = ATTR1_LARGE | ATTR1_X(20);
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 7) | ATTR2_PRIORITY(0);

    shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
    shadowOAM[8].attr1 = ATTR1_MEDIUM | ATTR1_X(84);
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 7) | ATTR2_PRIORITY(0);

    // Total platforms (tens place)
    shadowOAM[7].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[7].attr1 = ATTR1_TINY | ATTR1_X(22);
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(platformNum1, 6) | ATTR2_PRIORITY(0);

    // Total platforms (ones place)
    shadowOAM[6].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[6].attr1 = ATTR1_TINY | ATTR1_X(27);
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(platformNum2, 6) | ATTR2_PRIORITY(0);

    // // Platforms painted (tens place)
    shadowOAM[5].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[5].attr1 = ATTR1_TINY | ATTR1_X(36);
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(totalPlatformsNum1, 6) | ATTR2_PRIORITY(0);

    // Platforms painted (ones place)
    shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(145);
    shadowOAM[4].attr1 = ATTR1_TINY | ATTR1_X(42);
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(totalPlatformsNum2, 6) | ATTR2_PRIORITY(0);
}