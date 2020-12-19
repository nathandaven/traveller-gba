
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

// external objects
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern int canTravel;

// prototypes !
void initMapView();
void initMapViewPlayer();
void resumeMapView();
void updateMapView();
void updateMapViewPlayer();
void drawMapView();
void animatePlayer();
void drawMapView();
void drawMapViewPlayer();
