#include "sprites.h"

// Constants
    // Map Size
#define MAPWIDTH 256
#define MAPHEIGHT 256
    // Sprite Variables
#define PLATFORMCNT 12
#define INKCNT 4
#define OBSTACLECNT 5
#define GUARDCNT 4
    // Jumping
#define JUMPHEIGHT 45
#define PLAYERDROP 16

// Sprites
extern SPRITE player;
extern SPRITE platform[PLATFORMCNT];
extern SPRITE ink[INKCNT];
extern SPRITE obstacle[OBSTACLECNT];
extern SPRITE guard[GUARDCNT];
extern SPRITE gate;

// Shadow Variables
OBJ_ATTR shadowOAM[128];
extern int hOff;
extern int vOff;

// Variables that change by level
extern int currLvl;
extern unsigned char* collisionMap;

// Tilemap modification
extern int TID1;
extern int TID2;
extern int TID3;
extern int tilemodX;
extern int tilemodY;

// Platforms Display Nums
extern int platformNum1;
extern int platformNum2;
extern int totalPlatformsNum1;
extern int totalPlatformsNum2;

// Energy Display Nums
extern int energyNum1;
extern int energyNum2;
extern int energyNum3;

// Score Display Nums
extern int scoreNum1;
extern int scoreNum2;
extern int scoreNum3;

// Variables that reset by level
extern int paintedPlatforms;
extern int lvlComplete;
extern int score;
extern int gateOpen;

// Variables that transfer between levels
extern int totalScore;
extern int cheat;

// Enums
typedef enum {UP, DOWN, RIGHT, LEFT, NONE} DIRECTION;
typedef enum {GRAY, RED, BLUE, YELLOW, GREEN, ORANGE, PURPLE} COLOR;
typedef enum {LVL1, LVL2, LVL3, LVL4} LEVEL;
typedef enum {OFF = 12, ON = 14} CHEAT;

// Prototypes
// Game
void initGame();
void updateGame();
void drawGame();
// Player
void initPlayer();
void updatePlayer();
void resetPlayer();
void drawPlayer();
// Platforms
void initPlatformsLvl1();
void initPlatformsLvl2();
void initPlatformsLvl3();
void initPlatformsLvl4();
void updatePlatforms(SPRITE* p);
void drawPlatforms();
void drawPlatformCnt();
// Inks
void initInksLvl1();
void initInksLvl2();
void initInksLvl3();
void initInksLvl4();
void updateInks(SPRITE* i);
void resetInks(SPRITE* i);
void changeColor(SPRITE* i);
void drawInks();
// Coloring
void changeColor(SPRITE* i);
void changeColorCheat();
// Obstacles
void initObstaclesLvl3();
void initObstaclesLvl4();
void updateObstacles(SPRITE* o);
void drawObstacles();
// Energy Display
void updateEnergy();
void drawEnergy();
// Guards
void initGuardsLvl2();
void initGuardsLvl4();
void updateGuards(SPRITE* g);
void drawGuards();
// Animation
void animate(SPRITE* s);
// Gate
void initGate();
void openGate();
void enterGate();