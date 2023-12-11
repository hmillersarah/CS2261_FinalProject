// HOW TO PLAY
// _____________

// INSTRUCTIONS:
// - Help Rabbit paint its way out of the lab. 
// - You may select your level using the left and right buttons on the start screen.
// - Rabbit must be the same color as the platform color indicator (thin rectangles on top of the platforms) to change a platform's color. 
// - To change its color, Rabbit must collide with an ink block (the colored ovals).
    // - Two primary colors = a secondary color. 
    // - Once a secondary color, Rabbit must use the gray ink to reset and become a new color.
// - Once all the platforms are successfully painted, the gate will open. To escape, Rabbit must be the same color as the gate.
// - There are currently 4 game levels. 
//      - In level 2, guards are introduced. If Eabbit is caught by a guard, you lose 5 energy points.
//      - Rabbit can get rid of a guard by falling on top of the guard from above. This will only work if Rabbit is the same color as the guard.
//      - In level 3, obstacles are introduced. If Rabbit is hit by an obstacle, you lose 5 energy points.
// - If Rabbit loses all energy points, the player loses the game.
// - To activate the cheat, press button B in the home screen. Then, the player should be able to change Rabbit's color by cycling through the rainbow using Button B in game.

// CONTROLS:
// UP       -> Up
// DOWN     -> Down (the player is able to fall through platforms)
// LEFT     -> Left (level selection on start screen)
// RIGHT    -> Right (level selection on start screen)
// START    -> Pause (in game), Continue (all other screens)
// SELECT   -> Controls (start screen)
// A        -> Instructions (start screen)
// B        -> Cheat

// ____________________________________________________________________________________________________________________________________________________

// FINISHED COMPONENTS:
    // - State Machine (Splash, Instructions, Game, Pause, Win, Lose)
    // - Player able to move left and right
    // - Player collides with inks to change color and resets their color with gray ink
    // - Player steps on platforms to change their color
    // - Player able to stand on and drop from platforms
    // - Gravity 
    // - Sprite collision checking
    // - Collision map
    // - Sprite palette modification at runtime -> Player color changing
    // - Tilemap modification at runtime -> Gate opening
    // - Patrolling enemies, moving obstacles
    // - Score and platform counter display
    // - Animated sprites
    // - Cheat -> Button allows player to cycle through colors
    // - Levels 1-4
    // - Parallax background (start screen)
    // - Home screen switch for turning cheat on/off
    // - Alpha blending to make inactive inks transparent
    // - Sounds + Music
    // - Display total score on level complete/win screens
    // - Disable player movement on respawn to prevent immediately walking into an obstacle + mosaic
    // - Level selection on start screen

// ____________________________________________________________________________________________________________________________________________________

#include <stdlib.h>
#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"

// Added .h files
#include "game.h"
#include "sound.h"

// Spritesheets
#include "spritesheet.h"

// Backgrounds
#include "pauseBG.h"
#include "winBG.h"
#include "loseBG.h"
#include "finalWinBG.h"

// Start BG
#include "startTileset.h"
#include "startBG_sm.h"
#include "startBG_wide.h"

// Instruction BG
#include "instruction1BG.h"
#include "instruction2BG.h"
#include "instruction3BG.h"
#include "instruction4BG.h"
#include "instruction5BG.h"

// Tileset
#include "tileset.h"

// Tilemaps
#include "lvl1Tilemap.h"
#include "lvl2Tilemap.h"
#include "lvl3Tilemap.h"
#include "lvl4Tilemap.h"

// Sounds/Music
#include "pixelsong.h"

// Prototypes
void initialize();

// State Machine Prototypes
// Start
void goToStart();
void start();
// Game levels
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToGame3();
void game3();
void goToGame4();
void game4();
// Pause
void goToPause();
void pause();
// Win
void goToWin();
void win();
void goToFinalWin();
void finalWin();
// Lose
void goToLose();
void lose();
// Instructions
void goToInstr1();
void instr1();
void goToInstr2();
void instr2();
void goToInstr3();
void instr3();
void goToInstr4();
void instr4();
void goToInstr5();
void instr5();

// Update Score prototype
void updateScore();

// Enum
enum {
    START,
    GAME1,
    GAME2,
    GAME3,
    GAME4,
    PAUSE,
    WIN,
    LOSE,
    INSTR1,
    INSTR2,
    INSTR3,
    INSTR4,
    INSTR5,
    FINALWIN
};
int state;

// Buttons
unsigned short oldButtons;
unsigned short buttons;

// Current game level
int currLvl;
// Total score for all levels
int totalScore;
// Turns cheat on
int cheat;

// Start BG1 hOff
int hOff1;
// Start BG2 hOff
int hOff2;

// Display variables for total score
int scoreNum1;
int scoreNum2;
int scoreNum3;

int main() {
    mgba_open();
    initialize();

    while (1) { 
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State machine
        switch (state) {
            case START:
                start();
                break;
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
                break;
            case GAME3:
                game3();
                break;
            case GAME4:
                game4();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INSTR1:
                instr1();
                break;
            case INSTR2:
                instr2();
                break;
            case INSTR3:
                instr3();
                break;
            case INSTR4:
                instr4();
                break;
            case INSTR5:
                instr5();
                break;
            case FINALWIN:
                finalWin();
                break;
        }

        waitForVBlank();
        // Copy shadowOAM into OAM
        DMANow(3, shadowOAM, OAM, 128*4);
    }
}

// Initialize game
void initialize() {
    // Turn cheat off
    cheat = OFF;
    // Copy shadowOAM into OAM
    DMANow(3, shadowOAM, OAM, 512);

    // Copy spritesheet into sprite memory
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    // Hide sprites
    hideSprites();

    // Set up sound
    setupSounds();
    setupInterrupts();
    REG_TM2CNT = 0;
    REG_TM2D = 0;
    REG_TM3CNT = 0;
    REG_TM2D = 0;

    // Go to start
    goToStart();
}

// START
void goToStart() {
    // Hide sprites
    hideSprites();
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL | BG_4BPP;
    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP;

    // Start backgrounds
    DMANow(3, startTilesetPal, PALETTE, startTilesetPalLen / 2);
    DMANow(3, startTilesetTiles, &CHARBLOCK[1], startTilesetTilesLen / 2);
    DMANow(3, startBG_smMap, &SCREENBLOCK[30], startBG_smMapLen / 2);
    DMANow(3, startBG_wideMap, &SCREENBLOCK[28], startBG_wideMapLen / 2);

    // "TO LAB" Text
    shadowOAM[36].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(136);
    shadowOAM[36].attr1 = ATTR1_SMALL | ATTR1_X(8);
    shadowOAM[36].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 0);

    // "START" Text
    shadowOAM[37].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
    shadowOAM[37].attr1 = ATTR1_SMALL | ATTR1_X(19);
    shadowOAM[37].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 1);

    // Main Text
    shadowOAM[38].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(125);
    shadowOAM[38].attr1 = ATTR1_LARGE | ATTR1_X(80);
    shadowOAM[38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 3);

    shadowOAM[39].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(125);
    shadowOAM[39].attr1 = ATTR1_LARGE | ATTR1_X(144);
    shadowOAM[39].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 3);

    // Cheat Switch
    shadowOAM[40].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(150);
    shadowOAM[40].attr1 = ATTR1_TINY | ATTR1_X(120);
    shadowOAM[40].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(cheat, 2);

    // Level Selection
    shadowOAM[41].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(118);
    shadowOAM[41].attr1 = ATTR1_MEDIUM | ATTR1_X(16);
    shadowOAM[41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);

    // Level Selection Arrows
    shadowOAM[42].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(120);
    shadowOAM[42].attr1 = ATTR1_TINY | ATTR1_X(10);
    shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 14);

    shadowOAM[43].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(120);
    shadowOAM[43].attr1 = ATTR1_TINY | ATTR1_X(50);
    shadowOAM[43].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);

    // Initialize hOffs
    hOff1 = 0;
    hOff2 = 0;

    // Set state to start
    state = START;

    // Reset total score
    totalScore = 0;

    // Initialize to level 1
    currLvl = LVL1;

    // Play start song
    playSong(pixelsong_sampleRate, pixelsong_length, pixelsong_data);
}

void start() {
    // Button right to select level
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        // Level sprite
        int lvlSprite = 0;
        
        // Change to next level
        switch (currLvl) {
            case LVL1:
                // Switch to level 2
                currLvl = LVL2;
                lvlSprite = 4;
                break;
            case LVL2:
                // Switch to level 3
                currLvl = LVL3;
                lvlSprite = 8;
                break;
            case LVL3:
                // Switch to level 4
                currLvl = LVL4;
                lvlSprite = 12;
                break;
            case LVL4:
                // Switch to level 1
                currLvl = LVL1;
                lvlSprite = 0;
                break;
        }

        // Set level sprite
        shadowOAM[41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lvlSprite, 12);
    }

    // Button left to select level
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        // Level sprite
        int lvlSprite = 0;
        
        // Change to previous level
        switch (currLvl) {
            case LVL1:
                // Switch to level 4
                currLvl = LVL4;
                lvlSprite = 12;
                break;
            case LVL2:
                // Switch to level 1
                currLvl = LVL1;
                lvlSprite = 0;
                break;
            case LVL3:
                // Switch to level 2
                currLvl = LVL2;
                lvlSprite = 4;
                break;
            case LVL4:
                // Switch to level 3
                currLvl = LVL3;
                lvlSprite = 8;
                break;
        }

        // Set level sprite
        shadowOAM[41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lvlSprite, 12);
    }

    // Go to game level (based on level selection)
    if (BUTTON_PRESSED(BUTTON_START)) {
        switch (currLvl) {
            case LVL1:
                goToGame1();
                break;
            case LVL2:
                goToGame2();
                break;
            case LVL3:
                goToGame3();
                break;
            case LVL4:
                goToGame4();
                break;
        }
        // Initialize game
        initGame();
    }

    // Enable cheat
    if (BUTTON_PRESSED(BUTTON_B)) {
        // Turn cheat on or off
        if (cheat == OFF) {
            cheat = ON;
        } else {
            cheat = OFF;
        }
        // Update cheat switch sprite
        shadowOAM[40].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(cheat, 2);
    }

    // Go to instructions
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstr1();
    }

    // Increment hOffs for parallax backgrounds
    hOff1 += 1;
    hOff2 += 3;

    waitForVBlank();
    // Copy shadowOAM into OAM
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM) / 2);
    // Set HOFF registers to hOffs
    REG_BG1HOFF = hOff1;
    REG_BG2HOFF = hOff2;

}

// GAME LVL 1
void goToGame1() {
    // Hide sprites
    hideSprites();
    // Enable BG0, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP; 

    // Level 1 map
    DMANow(3, tilesetPal, PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, lvl1TilemapMap, &SCREENBLOCK[31], lvl1TilemapMapLen / 2);

    state = GAME1;
}

void game1() {
    // Update game
    updateGame();
    // Draw game
    drawGame();
    // Wait for vblank
    waitForVBlank();

    // Pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Go to win if player completes level
    if (lvlComplete == 1) {
        totalScore += score;
        goToWin();
    }

    // Go to lose if player runs out of score points
    if (score <= 0) {
        goToLose();
    }
}

// GAME LVL 2
void goToGame2() {
    // Hide sprites
    hideSprites();
    // Enable BG0, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP; 

    // Level 2 map
    DMANow(3, tilesetPal, PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, lvl2TilemapMap, &SCREENBLOCK[31], lvl2TilemapMapLen / 2);

    state = GAME2;
}

void game2() {
    // Update game
    updateGame();
    // Draw game
    drawGame();
    // Wait for vblank
    waitForVBlank();

    // Pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Go to win if player completes level
    if (lvlComplete == 1) {
        totalScore += score;
        goToWin();
    }

    // Go to lose if player runs out of score points
    if (score <= 0) {
        goToLose();
    }
}

// GAME LVL 3
void goToGame3() {
    // Hide sprites
    hideSprites();
    // Enable BG0, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP; 

    // Level 3 map
    DMANow(3, tilesetPal, PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, lvl3TilemapMap, &SCREENBLOCK[31], lvl3TilemapMapLen / 2);

    state = GAME3;
}

void game3() {
    // Update game
    updateGame();
    // Draw game
    drawGame();
    // Wait for vblank
    waitForVBlank();

    // Pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Go to win if player completes level
    if (lvlComplete == 1) {
        totalScore += score;
        goToWin();
    }

    // Go to lose if player runs out of score points
    if (score <= 0) {
        goToLose();
    }
}

// GAME LVL 4
void goToGame4() {
    // Hide sprites
    hideSprites();
    // Enable BG0, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP; 

    // Level 3 map
    DMANow(3, tilesetPal, PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, lvl4TilemapMap, &SCREENBLOCK[31], lvl4TilemapMapLen / 2);

    state = GAME4;
}

void game4() {
    // Update game
    updateGame();
    // Draw game
    drawGame();
    // Wait for vblank
    waitForVBlank();

    // Pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Go to win if player completes level
    if (lvlComplete == 1) {
        totalScore += score;
        goToFinalWin();
    }

    // Go to lose if player runs out of score points
    if (score <= 0) {
        goToLose();
    }
}

// PAUSE
void goToPause() {
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Pause background
    DMANow(3, pauseBGPal, PALETTE, pauseBGPalLen / 2);
    DMANow(3, pauseBGTiles, &CHARBLOCK[1], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[30], pauseBGMapLen / 2);
    
    // Reset BG1 hOff
    hOff1 = 0;

    // Pause game music/sounds
    pauseSounds();

    state = PAUSE;
}

void pause() {
    // Return to game
    if (BUTTON_PRESSED(BUTTON_START)) {
        // Unpause music/sounds
        unpauseSounds();

        // Return to correct game level
        switch (currLvl) {
            case LVL1:
                goToGame1();
                break;
            case LVL2:
                goToGame2();
                break;
            case LVL3:
                goToGame3();
                break;
            case LVL4:
                goToGame4();
                break;
        }
    }
    
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// LEVEL COMPLETE
void goToWin() {
    hideSprites();
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    // Update total score
    updateScore();

    // Win background
    DMANow(3, winBGPal, PALETTE, winBGPalLen / 2);
    DMANow(3, winBGTiles, &CHARBLOCK[1], winBGTilesLen / 2);
    DMANow(3, winBGMap, &SCREENBLOCK[30], winBGMapLen / 2);

    // Score static text
    shadowOAM[42].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(128);
    shadowOAM[42].attr1 = ATTR1_LARGE | ATTR1_X(88);
    shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
    
    // Score (hundreds place)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(128);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum1, 6) | ATTR2_PRIORITY(0);

    // Score (tens place)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[1].attr1 = ATTR1_TINY | ATTR1_X(136);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum2, 6) | ATTR2_PRIORITY(0);

    // Score (ones place)
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[0].attr1 = ATTR1_TINY | ATTR1_X(144);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum3, 6) | ATTR2_PRIORITY(0);

    // Reset BG1 hOff
    hOff1 = 0;

    state = WIN;

    // Stop music/sound
    stopSounds();
}

void win() {
    // If player wins level...
    if (BUTTON_PRESSED(BUTTON_START)) {
        switch (currLvl) {
            // For level 1...
            case LVL1:
                // Go to level 2
                goToGame2();
                currLvl = LVL2;
                initGame();
                break;
            // For level 2...
            case LVL2:
                // Go to level 3
                goToGame3();
                currLvl = LVL3;
                initGame();
                break;
            // For level 3...
            case LVL3:
                // Go to level 4
                goToGame4();
                currLvl = LVL4;
                initGame();
                break;
            // Level 4 win screen is final win screen
        }
    }

    waitForVBlank();
    // Copy shadowOAM into OAM
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM) / 2);
    REG_BG1HOFF = hOff1;
}

// LOSE
void goToLose() {
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Lose background
    DMANow(3, loseBGPal, PALETTE, loseBGPalLen / 2);
    DMANow(3, loseBGTiles, &CHARBLOCK[1], loseBGTilesLen / 2);
    DMANow(3, loseBGMap, &SCREENBLOCK[30], loseBGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = LOSE;

    // Stop music/sound
    stopSounds();
}

void lose() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// INSTRUCTIONS
// PG 1
void goToInstr1() {
    hideSprites();
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Win background
    DMANow(3, instruction1BGPal, PALETTE, instruction1BGPalLen / 2);
    DMANow(3, instruction1BGTiles, &CHARBLOCK[1], instruction1BGTilesLen / 2);
    DMANow(3, instruction1BGMap, &SCREENBLOCK[30], instruction1BGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = INSTR1;

    // Stop music/sound
    stopSounds();
}

void instr1() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    // Go to pg2 of instructions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr2();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// PG2
void goToInstr2() {
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Win background
    DMANow(3, instruction2BGPal, PALETTE, instruction2BGPalLen / 2);
    DMANow(3, instruction2BGTiles, &CHARBLOCK[1], instruction2BGTilesLen / 2);
    DMANow(3, instruction2BGMap, &SCREENBLOCK[30], instruction2BGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = INSTR2;
}

void instr2() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    // Go to pg3 of instructions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr3();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// PG3
void goToInstr3() {
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Win background
    DMANow(3, instruction3BGPal, PALETTE, instruction3BGPalLen / 2);
    DMANow(3, instruction3BGTiles, &CHARBLOCK[1], instruction3BGTilesLen / 2);
    DMANow(3, instruction3BGMap, &SCREENBLOCK[30], instruction3BGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = INSTR3;
}

void instr3() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    // Go to pg4 of instructions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr4();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// PG4
void goToInstr4() {
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Win background
    DMANow(3, instruction4BGPal, PALETTE, instruction4BGPalLen / 2);
    DMANow(3, instruction4BGTiles, &CHARBLOCK[1], instruction4BGTilesLen / 2);
    DMANow(3, instruction4BGMap, &SCREENBLOCK[30], instruction4BGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = INSTR4;
}

void instr4() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    // Go to pg5 of instructions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr5();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// PG5
void goToInstr5() {
    hideSprites();
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1);

    // Win background
    DMANow(3, instruction5BGPal, PALETTE, instruction5BGPalLen / 2);
    DMANow(3, instruction5BGTiles, &CHARBLOCK[1], instruction5BGTilesLen / 2);
    DMANow(3, instruction5BGMap, &SCREENBLOCK[30], instruction5BGMapLen / 2);

    // Reset BG1 hOff
    hOff1 = 0;

    state = INSTR5;
}

void instr5() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    // Go to pg1 of instructions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr1();
    }

    waitForVBlank();
    REG_BG1HOFF = hOff1;
}

// WIN GAME
void goToFinalWin() {
    hideSprites();
    // Enable BG1, mode 0
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    // Update total score
    updateScore();

    // Win background
    DMANow(3, finalWinBGPal, PALETTE, finalWinBGPalLen / 2);
    DMANow(3, finalWinBGTiles, &CHARBLOCK[1], finalWinBGTilesLen / 2);
    DMANow(3, finalWinBGMap, &SCREENBLOCK[30], finalWinBGMapLen / 2);

    // Score static text
    shadowOAM[42].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(128);
    shadowOAM[42].attr1 = ATTR1_LARGE | ATTR1_X(88);
    shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
    
    // Score (hundreds place)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(128);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum1, 6) | ATTR2_PRIORITY(0);

    // Score (tens place)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[1].attr1 = ATTR1_TINY | ATTR1_X(136);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum2, 6) | ATTR2_PRIORITY(0);

    // Score (ones place)
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(128);
    shadowOAM[0].attr1 = ATTR1_TINY | ATTR1_X(144);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreNum3, 6) | ATTR2_PRIORITY(0);

    // Reset BG1 hOff
    hOff1 = 0;

    // Change state
    state = FINALWIN;

    // Stop music/sound
    stopSounds();
}

void finalWin() {
    // Return to start
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

    waitForVBlank();
    // Copy shadowOAM into OAM
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM) / 2);
    REG_BG1HOFF = hOff1;
}

// INTERRUPTS
void setupInterrupts() {
    // Turn off
    REG_IME = 0;

    // Enable timer interrupts, vBlank interrupt
    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    // Set to interrupt handler
    REG_INTERRUPT = &interruptHandler;

    // Turn on
	REG_IME = 1;
}

void interruptHandler() {
    // Turn off
    REG_IME = 0;

    // At vBlank
	if (REG_IF & IRQ_VBLANK) {

        // Sound A
        // Increment count
        soundA.vBlankCount++;
        if (soundA.vBlankCount >= soundA.durationInVBlanks) {
            // Play sound
            if (soundA.looping) {
                playSoundA(soundA.data, soundA.dataLength, soundA.looping);
            // End sound
            } else {
                soundA.isPlaying = 0;
                REG_TM0CNT = TIMER_OFF;
                dma[1].cnt = 0;
            }
        }

        // Sound B
        // Increment count
        soundB.vBlankCount++;
        if (soundB.vBlankCount >= soundB.durationInVBlanks) {
            // Play sound
            if (soundB.looping) {
                playSoundB(soundB.data, soundB.dataLength, soundB.looping);
            // End sound
            } else {
                soundB.isPlaying = 0;
                REG_TM1CNT = TIMER_OFF;
                dma[2].cnt = 0;
            }

		}

	}

    // Complete interrupt
    REG_IF = REG_IF;
    // Turn on
    REG_IME = 1;
}

// Update total score display
void updateScore() {
    // Hundreds place
    scoreNum1 = (totalScore / 10) / 10;
    // Tens place
    scoreNum2 = (totalScore / 10)  % 10;
    // Ones place
    scoreNum3 = (totalScore % 10);
}
