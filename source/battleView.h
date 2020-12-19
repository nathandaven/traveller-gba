// used for animation
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
// size defines
#define MAPWIDTH 340
#define MAPHEIGHT 160

// additional defines
#define ACTIVE 1
#define INACTIVE 0
#define RIGHT 1
#define LEFT -1
#define GRAVITY -32




// external objects
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;

//extern TOWN towns;







// prototypes !
void initBattleView();
void resumeBattleView();
void initBattleViewPlayer();
void initBattleViewButtons();
void resumeBattleView();
void updateBattleView();
void updateBattleViewPlayer();
void updateBattleViewVillagers();
void applyGravity();
void animateBattleViewPlayer();
void drawBattleView();
void animatePlayer();
void drawBattleView();
void drawBattleViewPlayer();
void drawBattleViewVillagers();
