// used for animation
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
// size defines
#define MAPWIDTH 512
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
void setUpTown(TOWN town);
void initTownView();
void resumeTownView();
void initTownViewPlayer();
void initTownViewVillagers();
void initTownViewButtons();
void resumeTownView();
void updateTownView();
void updateTownViewPlayer();
void updateTownViewVillagers();
void applyGravity();
void animateTownViewPlayer();
void drawTownView();
void animatePlayer();
void drawTownView();
void drawTownViewPlayer();
void drawTownViewVillagers();
void resetTownView();