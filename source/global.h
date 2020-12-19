volatile extern int playerHealth;
volatile extern int playerMoney;
volatile extern int playerArrows;
volatile extern int playerShootSpeed;
extern int playerHasBow;
#define TOTALTOWNS 6

extern TOWN currentTown;
extern TOWN towns[TOTALTOWNS];

extern ANISPRITE aButton;
extern ANISPRITE bButton;

#define PLAYERSHOOTTHRESHHOLD 30



// types of people in the town: determines how they collide with player
// questgiver
enum {
    NONE,
    BOWGIVER,
    BOUNTY,
    BOUNTYDEST,
    LETTERGIVER,
    LETTERDEST
};

// merchant types
enum {
    BOWUPGRADE,
    KEY
};

enum {
    NORMIE,
    MERCHANT,
    DOCTOR,
    QUESTGIVER,
    HOSTILE,
    GOBLIN,
    SKELETON,
    BOSS
}; 
//int villagerTypes[] = {NORMIE, MERCHANT, HOSTILE};

enum {SMALLTOWN, BIGTOWN, CASTLEA, CASTLEB};



extern int textViewChoice;
extern int merchantViewChoice;
extern int battleViewChoice;
extern int returnToMap;
extern int meadCollected;
extern int touchingMead;
extern int bountyStarted;
extern int bountyKilled;
extern int bountyCompleted;
extern int letterStarted;
extern int letterRecieved;
extern int letterCompleted;
extern int bossDead;
extern int battleViewDefeated;
extern int boughtKey;
extern int dungeonKeys;

// cheat
extern int cheatActive;
extern char cheatCode[4];
extern char cheatEnteredCode[];

#define KEYSNEEDED 3

extern int inMode4;

extern ANISPRITE arrows[];
#define TOTALSCREENARROWS 4

// methods
void initializeGlobal();


void initalizeMapViewButtons();

void updateGlobal();

void drawGlobal();

void drawButtons(int hOff, int vOff);

void drawNumber(int value, int col, int row);

void resetGlobal();