// used for animation
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
// size defines
#define MAPWIDTH 512
#define MAPHEIGHT 512

// additional defines
#define ACTIVE 1
#define INACTIVE 0
#define RIGHT 1
#define LEFT -1
#define GRAVITY -32

#define GRAV 100
#define JUMPPOWER 1500
#define SHIFTUP(num)    ((num) << 8)
#define SHIFTDOWN(num)  ((num) >> 8)

#define TOTALENEMIES 6





// external objects
extern int hOff;
extern int vOff;
/* extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player; */
//extern TOWN towns;

//extern VILLAGER enemies[TOTALENEMIES];
//extern VILLAGER boss;





// prototypes !
void initDungeonView();
void resumeDungeonView();
void initDungeonViewPlayer();
void initDungeonViewVillagers();
void initDungeonViewButtons();
void resumeDungeonView();
void updateDungeonView();
void updateDungeonViewPlayer();
void updateDungeonViewEnemies();
void applyGravity();
void animateDungeonViewPlayer();
void drawDungeonView();
void animatePlayer();
void drawDungeonView();
void drawDungeonViewPlayer();
void drawDungeonViewVillagers();
