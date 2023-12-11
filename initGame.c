#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "game.h"
#include "sound.h"
#include <stdlib.h>

// Collision maps
#include "lvl1ColMap.h"
#include "lvl2CollMap.h"
#include "lvl3CollMap.h"
#include "lvl4CollMap.h"

// Music
#include "bitsong.h"

// Sprites
SPRITE player;
SPRITE platform[PLATFORMCNT];
SPRITE ink[INKCNT];
SPRITE obstacle[OBSTACLECNT];
SPRITE guard[GUARDCNT];
SPRITE gate;

// VARIABLES
// Collision map
unsigned char* collisionMap;
// Stores number of painted platforms
int paintedPlatforms;
// Stores if player has completed level
int lvlComplete;
// Player energy score for level
int score;

// Display variables based on PLATFORMCNT
int totalPlatformsNum1;
int totalPlatformsNum2;

// Tile IDs for tilemap modification
int TID1;
int TID2;
int TID3;
int tilemodX;
int tilemodY;

// Boolean for whether player has opened gate/painted all platforms
int gateOpen;

// ALL LEVELS
// ________________________

// Iniitialze game
void initGame() {
    // Hide sprites
    hideSprites();

    // Level-specific variables + functions
    switch (currLvl) {
        case LVL1:
            // Collision map
            collisionMap = (unsigned char*) lvl1ColMapBitmap;

            // Initialize level-specific sprites
            initInksLvl1();
            initPlatformsLvl1();

            // Beginning energy amount
            score = 80;
            break;
        case LVL2:
            // Collision map
            collisionMap = (unsigned char*) lvl2CollMapBitmap;

            // Initialize level-specific sprites
            initPlatformsLvl2();
            initInksLvl2();
            initGuardsLvl2();

            // Beginning energy amount
            score = 80;
            break;
        case LVL3:
            // Collision map
            collisionMap = (unsigned char*) lvl3CollMapBitmap;

            // Initialize level-specific sprites
            initPlatformsLvl3();
            initInksLvl3();
            initObstaclesLvl3();

            // Beginning energy amount
            score = 90;
            break;
        case LVL4:
            // Collision map
            collisionMap = (unsigned char*) lvl4CollMapBitmap;

            // Initialize level-specific sprites
            initPlatformsLvl4();
            initInksLvl4();
            initGuardsLvl4();
            initObstaclesLvl4();

            // Beginning energy amount
            score = 130;
            break;
    }

    // FUNCTIONS
    // Initialize player sprite
    initPlayer();
    // Initialize gate struct
    initGate();

    // VARIABLES
    // Start with gate closed
    gateOpen = 0;
    // Start with no platforms painted
    paintedPlatforms = 0;
    // Level not completed at start
    lvlComplete = 0;

    // PLATFORMCNT for all levels is 12
    // Set total display sprites to 1 and 2
    totalPlatformsNum1 = 1;
    totalPlatformsNum2 = 2;

    // Stop all playing sounds
    stopSounds();
    // Start in-game song
    playSong(bitsong_sampleRate, bitsong_length, bitsong_data);
}

// Initialize player
void initPlayer() {
    // Player size
    player.width = 16;
    player.height = 16;
    // Last player y (stored for jumping/falling)
    player.prevY = player.y;
    // Movement speed
    player.dx = 4;
    player.dy = 8;
    // Starting color + animation direction
    player.direction = NONE;
    player.color = GRAY;
    // Y direction for jumping + gravity
    player.yDirection = DOWN;
    // Player set to not drop through platforms unless down button is pressed
    player.isDropping = 0;
    // Stores whether can jump (prevents jump spamming)
    player.canJump = 1;
    // Starting x index
    player.x = 20;
    // Frame animation
    player.timeUntilNextFrame = 10;
    player.numOfFrames = 3;
    // Player not respawning
    player.respawning = 0;

    // Player starts at top for lvl2
    if (currLvl == LVL2) {
        player.y = 24;
    } else {
        player.y = 216;
    }
}

// Initialize gate
void initGate() {
    // Gate size
    gate.height = 24;
    gate.width = 24;

    // Gate location + color by level
    switch (currLvl) {
        case LVL1:
            // Location
            gate.x = 216;
            gate.y = 208;
            // Color
            gate.color = BLUE;

            // Gate tile ids
            TID1 = 304;
            TID2 = 336;
            TID3 = 368;
            // Tilemap starting indices
            tilemodX = 26;
            tilemodY = 26;
            break;
        case LVL2:
            // Location
            gate.x = 216;
            gate.y = 208;
            // Color
            gate.color = YELLOW;

            // Gate tile ids
            TID1 = 432;
            TID2 = 464;
            TID3 = 496;
            // Tilemap starting indices
            tilemodX = 26;
            tilemodY = 26;
            break;
        case LVL3:
            // Location
            gate.x = 216;
            gate.y = 16;
            // Color
            gate.color = PURPLE;

            // Gate tile ids
            TID1 = 560;
            TID2 = 592;
            TID3 = 624;
            // Tilemap starting indices
            tilemodX = 26;
            tilemodY = 1;
            break;
        case LVL4:
            // Location
            gate.x = 144;
            gate.y = 80;
            // Color
            gate.color = RED;

            // Gate tile ids
            TID1 = 688;
            TID2 = 720;
            TID3 = 752;
            // Tilemap starting indices
            tilemodX = 17;
            tilemodY = 10;
            break;
    }
}

// LEVEL 1
// ________________________

// Initialize inks
void initInksLvl1() {
    // Loop through all ink sprites
    for (int i = 0; i < INKCNT; i++) {
        // Ink size
        ink[i].width = 8;
        ink[i].height = 8;
        // Inks all initially display on screen
        ink[i].active = 1;
        
        // Ink color, x, and y
        switch (i) {
            case 0:
                ink[i].color = GRAY;
                ink[i].x = 200;
                ink[i].y = 220;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 75;
                ink[i].y = 155;
                break;
            case 2:
                ink[i].color = YELLOW;
                ink[i].x = 152;
                ink[i].y = 57;
                break;
            case 3:
                ink[i].color = RED;
                ink[i].x = 128;
                ink[i].y = 216;
        }
    }
}

// Initialize platforms
void initPlatformsLvl1() {
    // Loop through all platform sprites
    for (int i = 0; i < PLATFORMCNT; i++) {
        // Platform size
        platform[i].height = 8;
        platform[i].width = 32;
        // Platforms start unpainted
        platform[i].active = 0;

        // Random platform color
        int colorPicker = rand() % 3;
        switch (colorPicker) {
            case 0:
                platform[i].color = GREEN;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
        }

        // Platform x
        if (i < 2) {
            platform[i].x = 8;
        } else if (i < 4) {
            platform[i].x = 64;
        } else if (i < 6) {
            platform[i].x = 120;
        } else if (i < 9) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }

        // Platform y
        if (i == 0 || i == 4 || i == 6) {
            platform[i].y = 72;
        } else if (i == 2 || i == 10) {
            platform[i].y = 104;
        } else if (i == 1 || i == 7) {
            platform[i].y = 136;
        } else if (i == 3 || i == 11) {
            platform[i].y = 168;
        } else if (i == 5 || i == 8) {
            platform[i].y = 200;
        } else {
            platform[i].y = 40;
        }
    }
}

// LEVEL 2
// ________________________

void initInksLvl2() {
    // Loop through all ink sprites
    for (int i = 0; i < INKCNT; i++) {
        // Ink size
        ink[i].width = 8;
        ink[i].height = 8;
        // Inks all initially display on screen
        ink[i].active = 1;

        // Ink color, x, and y
        switch (i) {
            case 0:
                ink[i].color = YELLOW;
                ink[i].x = 228;
                ink[i].y = 24;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 16;
                ink[i].y = 84;
                break;
            case 2:
                ink[i].color = GRAY;
                ink[i].x = 200;
                ink[i].y = 180;
                break;
            case 3:
                ink[i].color = RED;
                ink[i].x = 116;
                ink[i].y = 133;
                break;
        }
    }
}

void initPlatformsLvl2() {
    for (int i = 0; i < PLATFORMCNT; i++) {
        // Platform size
        platform[i].height = 8;
        platform[i].width = 32;
        // Platforms start unpainted
        platform[i].active = 0;

        // Platform color
        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
            case 3:
                platform[i].color = PURPLE;
                break; 
        }

        // Platform x
        if (i < 3) {
            platform[i].x = 48;
        } else if (i < 6) {
            platform[i].x = 104;
        } else if (i < 9) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }

        // Platform y
        if (i == 3|| i == 9) {
            platform[i].y = 40;
        } else if (i == 0 || i == 6) {
            platform[i].y = 72;
        } else if (i == 4 || i == 10) {
            platform[i].y = 104;
        } else if (i == 1 || i == 7) {
            platform[i].y = 136;
        } else if (i == 5 || i == 11) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}

void initGuardsLvl2() {
    for (int i = 0; i < GUARDCNT; i++) {
        // Guard size
        guard[i].width = 8;
        guard[i].height = 16;
        // Set to active
        guard[i].active = 1;
        // Initial movement speed
        guard[i].dx = 1;
        // Animation frames
        guard[i].timeUntilNextFrame = 10;
        guard[i].numOfFrames = 3;

        switch (i) {
            case 0:
                // Color
                guard[i].color = ORANGE;
                // Starting X, Y coordinates
                guard[i].x = 32;
                guard[i].y = 56;
                // Range of movement on x-axis
                guard[i].minX = 8;
                guard[i].maxX = 104;
                // Starting direction
                guard[i].direction = RIGHT;
                break;
            case 1:
                guard[i].color = YELLOW;
                guard[i].x = 32;
                guard[i].y = 88;
                guard[i].minX = 8;
                guard[i].maxX = 56;
                guard[i].direction = LEFT;
                break;
            case 2:
                guard[i].color = GREEN;
                guard[i].x = 216;
                guard[i].y = 184;
                guard[i].minX = 128;
                guard[i].maxX = 240;
                guard[i].direction = RIGHT;
                break;
            case 3:
                guard[i].color = PURPLE;
                guard[i].x = 216;
                guard[i].y = 216;
                guard[i].minX = 8;
                guard[i].maxX = 240;
                guard[i].direction = LEFT;
                break; 
        }
    }
}

// LEVEL 3
// ________________________

// Initialize inks
void initInksLvl3() {
    // Loop through all ink sprites
    for (int i = 0; i < INKCNT; i++) {
        // Ink size
        ink[i].width = 8;
        ink[i].height = 8;
        // Inks all initially display on screen
        ink[i].active = 1;

        // Ink color, x, and y
        switch (i) {
            case 0:
                ink[i].color = YELLOW;
                ink[i].x = 92;
                ink[i].y = 24;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 176;
                ink[i].y = 88;
                break;
            case 2:
                ink[i].color = RED;
                ink[i].x = 36;
                ink[i].y = 152;
                break;
            case 3:
                ink[i].color = GRAY;
                ink[i].x = 204;
                ink[i].y = 216;
                break;
        }
    }
}

// Initialize platforms
void initPlatformsLvl3() {
    for (int i = 0; i < PLATFORMCNT; i++) {
        // Platform size
        platform[i].height = 8;
        platform[i].width = 32;
        // Platforms start unpainted
        platform[i].active = 0;

        // Platform color
        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = ORANGE;
                break;
            case 3:
                platform[i].color = PURPLE;
                break; 
        }

        // Platform x
        if (i < 3) {
            platform[i].x = 24;
        } else if (i < 6) {
            platform[i].x = 80;
        } else if (i < 9) {
            platform[i].x = 136;
        } else {
            platform[i].x = 192;
        }

        // Platform y
        if (i == 0 || i == 6) {
            platform[i].y = 40;
        } else if (i == 3 || i == 9) {
            platform[i].y = 72;
        } else if (i == 1 || i == 7) {
            platform[i].y = 104;
        } else if (i == 4 || i == 10) {
            platform[i].y = 136;
        } else if (i == 2 || i == 8) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}

// Initialize obstacles
void initObstaclesLvl3() {
    // Loop through obstacles
    for (int i = 0; i < OBSTACLECNT; i++) {
        // Size
        obstacle[i].width = 8;
        obstacle[i].height = 8;
        // Velocity
        obstacle[i].dx = 4;
        obstacle[i].dy = 4;
        // Animation frames
        obstacle[i].timeUntilNextFrame = 10;
        obstacle[i].numOfFrames = 3;

        // Starting location + direction
        switch (i) {
            case 0:
                obstacle[i].x = 64;
                obstacle[i].y = 120;
                obstacle[i].direction = DOWN;
                break;
            case 1:
                obstacle[i].x = 120;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 2:
                obstacle[i].x = 120;
                obstacle[i].y = 8;
                obstacle[i].direction = DOWN;
                break;
            case 3:
                obstacle[i].x = 8;
                obstacle[i].y = 56;
                obstacle[i].direction = RIGHT;
                break;
            case 4:
                obstacle[i].x = 176;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
        }
    }
}

// LEVEL 3
// ________________________

// Initialize inks
void initInksLvl4() {
    for (int i = 0; i < INKCNT; i++) {
        // Ink size
        ink[i].width = 8;
        ink[i].height = 8;
        // Inks all initially display on screen
        ink[i].active = 1;

        // Ink color, x, and y
        switch (i) {
            case 0:
                ink[i].color = GRAY;
                ink[i].x = 104;
                ink[i].y = 216;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 232;
                ink[i].y = 24;
                break;
            case 2:
                ink[i].color = RED;
                ink[i].x = 16;
                ink[i].y = 24;
                break;
            case 3:
                ink[i].color = YELLOW;
                ink[i].x = 144;
                ink[i].y = 216;
                break;
        }
    }
}

// Initialize platforms
void initPlatformsLvl4() {
    for (int i = 0; i < PLATFORMCNT; i++) {
        // Platform size
        platform[i].height = 8;
        platform[i].width = 32;
        // Platforms start unpainted
        platform[i].active = 0;

        // Platform color
        int colorPicker = rand() % 6;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = ORANGE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
            case 3:
                platform[i].color = GREEN;
                break; 
            case 4:
                platform[i].color = BLUE;
                break;
            case 5:
                platform[i].color = PURPLE;
                break;
        }

        // Platform x
        if (i < 2) {
            platform[i].x = 8;
        } else if (i < 4) {
            platform[i].x = 48;
        } else if (i < 5) {
            platform[i].x = 64;
        } else if (i < 8) {
            platform[i].x = 88;
        } else if (i < 10) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }

        // Platform y
        if (i == 4 || i == 8) {
            platform[i].y = 40;
        } else if (i == 0 || i == 5 || i == 10) {
            platform[i].y = 72;
        } else if (i == 2) {
            platform[i].y = 104;
        } else if (i == 1 || i == 6) {
            platform[i].y = 136;
        } else if (i == 3 || i == 9) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}

// Initialize guards
void initGuardsLvl4() {
    for (int i = 0; i < GUARDCNT; i++) {
        // Guard size
        guard[i].width = 8;
        guard[i].height = 16;
        // Set to active
        guard[i].active = 1;
        // Initial movement speed
        guard[i].dx = 1;
        // Animation frames
        guard[i].timeUntilNextFrame = 10;
        guard[i].numOfFrames = 3;

        switch (i) {
            case 0:
                // Color
                guard[i].color = PURPLE;
                // Starting X, Y coordinates
                guard[i].x = 64;
                guard[i].y = 24;
                // Range of movement on x-axis
                guard[i].minX = 64;
                guard[i].maxX = 184;
                // Starting direction
                guard[i].direction = RIGHT;
                break;
            case 1:
                guard[i].color = RED;
                guard[i].x = 88;
                guard[i].y = 120;
                guard[i].minX = 88;
                guard[i].maxX = 128;
                guard[i].direction = RIGHT;
                break;
            case 2:
                guard[i].color = GREEN;
                guard[i].x = 240;
                guard[i].y = 216;
                guard[i].minX = 136;
                guard[i].maxX = 240;
                guard[i].direction = LEFT;
                break;
            case 3:
                guard[i].color = ORANGE;
                guard[i].x = 184;
                guard[i].y = 88;
                guard[i].minX = 136;
                guard[i].maxX = 184;
                guard[i].direction = LEFT;
                break; 
        }
    }
}

// Initialize obstacles
void initObstaclesLvl4() {
    // Loop through obstacles
    for (int i = 0; i < OBSTACLECNT; i++) {
        // Size
        obstacle[i].width = 8;
        obstacle[i].height = 8;
        // Velocity
        obstacle[i].dx = 4;
        obstacle[i].dy = 4;
        // Animation frames
        obstacle[i].timeUntilNextFrame = 10;
        obstacle[i].numOfFrames = 3;

        // Starting location + direction
        switch (i) {
            case 0:
                obstacle[i].x = 40;
                obstacle[i].y = 8;
                obstacle[i].direction = DOWN;
                break;
            case 1:
                obstacle[i].x = 80;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 2:
                obstacle[i].x = 40;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 3:
                obstacle[i].x = 80;
                obstacle[i].y = 48;
                obstacle[i].direction = UP;
                break;
            case 4:
                obstacle[i].x = 8;
                obstacle[i].y = 16;
                obstacle[i].direction = RIGHT;
                break;
        }
    }
}
