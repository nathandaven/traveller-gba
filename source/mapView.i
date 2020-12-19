# 1 "mapView.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mapView.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 70 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 91 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int direction;
    int velocity;
    int horVelocity;
    int didDamage;
} ANISPRITE;
# 208 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 219 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 259 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 295 "myLib.h"
typedef void (*ihp)(void);
# 315 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);






typedef struct {

    int type;
    int health;


    ANISPRITE sprite;


    int doesWander;
    int movementCounter;
    int isMoving;
    int timeToMove;
    int timeToRun;
    int timeToWait;


    int randomSpeech;


    int merchantType;


    int isStationary;
    int isHostile;
    int shootCounter;
    int attackedPlayer;
    int hasWaited;
    ANISPRITE hostileArrows[6];
    ANISPRITE bow;
    int damageCooldown;
    int canJump;
    int againstWallLeft;
    int againstWallRight;
    int isJumping;
    int triedJumping;

    int moneyDrop;

    int distanceToRun;
    int distanceToAttack;
    int waitingTime;


    int questType;
    int drawIcon;




} VILLAGER;


typedef struct {
    char collisionMapColor;
    int villagerCount;


    int enemyDefeated;

    int questTownType;
    int merchantTownType;

    int floorRow;
    int index;

    int isDungeon;
# 402 "myLib.h"
} TOWN;
# 2 "mapView.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
void drawString4Double(int col, int row, char *str, char *str2, unsigned char colorIndex);
# 3 "mapView.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
void drawString4Double(int col, int row, char *str, char *str2, unsigned char colorIndex);
# 4 "mapView.c" 2
# 1 "title.h" 1
# 22 "title.h"
extern const unsigned short titleTiles[3120];


extern const unsigned short titleMap[1024];


extern const unsigned short titlePal[256];
# 5 "mapView.c" 2
# 1 "mapView.h" 1


enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
# 17 "mapView.h"
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern int canTravel;


void initMapView();
void initMapViewPlayer();
void resumeMapView();
void updateMapView();
void updateMapViewPlayer();
void drawMapView();
void animatePlayer();
void drawMapView();
void drawMapViewPlayer();
# 6 "mapView.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "mapView.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[2240];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 8 "mapView.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[3072];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 9 "mapView.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1568];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 10 "mapView.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[16];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 11 "mapView.c" 2
# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[16160];


extern const unsigned short mapMap[4096];


extern const unsigned short mapPal[256];
# 12 "mapView.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[262144];
# 13 "mapView.c" 2
# 1 "global.h" 1
volatile extern int playerHealth;
volatile extern int playerMoney;
volatile extern int playerArrows;
volatile extern int playerShootSpeed;
extern int playerHasBow;


extern TOWN currentTown;
extern TOWN towns[6];

extern ANISPRITE aButton;
extern ANISPRITE bButton;







enum {
    NONE,
    BOWGIVER,
    BOUNTY,
    BOUNTYDEST,
    LETTERGIVER,
    LETTERDEST
};


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


extern int cheatActive;
extern char cheatCode[4];
extern char cheatEnteredCode[];



extern int inMode4;

extern ANISPRITE arrows[];



void initializeGlobal();


void initalizeMapViewButtons();

void updateGlobal();

void drawGlobal();

void drawButtons(int hOff, int vOff);

void drawNumber(int value, int col, int row);

void resetGlobal();
# 14 "mapView.c" 2


# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void pauseSoundA();
void pauseSoundB();
void unpauseSound();
void stopSound();
void stopSoundA();
void stopSoundB();
# 53 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 17 "mapView.c" 2
# 1 "arrowShot.h" 1


extern const unsigned int arrowShot_sampleRate;
extern const unsigned int arrowShot_length;
extern const signed char arrowShot_data[];
# 18 "mapView.c" 2
# 1 "enemyDie.h" 1


extern const unsigned int enemyDie_sampleRate;
extern const unsigned int enemyDie_length;
extern const signed char enemyDie_data[];
# 19 "mapView.c" 2
# 1 "enemyHit.h" 1


extern const unsigned int enemyHit_sampleRate;
extern const unsigned int enemyHit_length;
extern const signed char enemyHit_data[];
# 20 "mapView.c" 2
# 1 "playerHit.h" 1


extern const unsigned int playerHit_sampleRate;
extern const unsigned int playerHit_length;
extern const signed char playerHit_data[];
# 21 "mapView.c" 2
# 1 "walking.h" 1


extern const unsigned int walking_sampleRate;
extern const unsigned int walking_length;
extern const signed char walking_data[];
# 22 "mapView.c" 2

int hOff;
int vOff;

int savedhOff;
int savedvOff;
int savedRow;
int savedCol;

int canTravel;


int playerIsMoving;


int canTravelDungeon;
int messageShown;

int randomEncounterCounter;




OBJ_ATTR shadowOAM[128];


ANISPRITE player;



void initMapView() {


    waitForVBlank();

    randomEncounterCounter = 1;

    textViewChoice = -1;



    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;


    initMapViewPlayer();
    initMapViewButtons();
}


void initMapViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 160 / 2 - player.width / 2 + vOff;
    player.worldCol = 240 / 2 - player.height / 2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;

}


void initMapViewButtons() {
    aButton.width = 16;
    aButton.height = 16;
    aButton.rdel = 1;
    aButton.cdel = 1;
    aButton.worldRow = player.worldRow+20;
    aButton.worldCol = player.worldCol;
    aButton.hide = 1;

    bButton.width = 16;
    bButton.height = 16;
    bButton.rdel = 1;
    bButton.cdel = 1;
    bButton.worldRow = player.worldRow+20;
    bButton.worldCol = player.worldCol;
    bButton.hide = 1;
}

void resetMapView() {
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    hOff = 0;
    vOff = 0;

    player.worldCol = 240 / 2;
    player.worldRow = 160 / 2;
}

void resumeMapView() {


    waitForVBlank();


    vOff = savedvOff;
    hOff = savedhOff;

    (*(volatile unsigned short *)0x04000012) = savedvOff;
    (*(volatile unsigned short *)0x04000010) = savedhOff;


    player.worldRow = savedRow;
    player.worldCol = savedCol;

    initMapViewButtons();
}



void updateMapView() {


    savedvOff = vOff;
    savedhOff = hOff;
    savedRow = player.worldRow;
    savedCol = player.worldCol;

    updateMapViewPlayer();

    randomEncounterCounter++;
# 160 "mapView.c"
    if (dungeonKeys >= 3) {
        canTravelDungeon = 1;
    }


    if (canTravelDungeon && !messageShown && playerHasBow) {
        messageShown = 1;
        goToTextView("", "A rumble appears from the dungeon..", "", "", "Back");
    }

}



void updateMapViewPlayer() {

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;

    playerIsMoving = 0;

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        playerIsMoving = 1;
        if (player.worldRow - vOff > 0 && (collisionmapBitmap[(player.worldRow - player.rdel) * 512 + player.worldCol])
            && (collisionmapBitmap[(player.worldRow - player.rdel) * 512 +
                (player.worldCol + player.width - player.cdel)])) {

            player.worldRow -= player.rdel;
            aButton.worldRow -= player.rdel;
            bButton.worldRow -= player.rdel;

            if (vOff > 0 && player.worldRow - vOff < 160 / 2) {
                vOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        playerIsMoving = 1;
        if (player.worldRow - vOff + player.height < 160 &&
            (collisionmapBitmap[(player.worldRow + player.height) * 512 +
                player.worldCol])
            && (collisionmapBitmap[(player.worldRow + player.height) * 512
                + (player.worldCol + player.width - player.cdel)])) {

            player.worldRow += player.rdel;
            aButton.worldRow += player.rdel;
            bButton.worldRow += player.rdel;

            if (vOff + 160 < 512 && player.worldRow - vOff >= 160 / 2) {
                vOff++;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        playerIsMoving = 1;
        if (player.worldCol - hOff > 0 && (collisionmapBitmap[player.worldRow * 512
            + (player.worldCol - player.cdel)])
            && (collisionmapBitmap[(player.worldRow + player.height - player.rdel) * 512
            + (player.worldCol - player.cdel)])) {

            player.worldCol -= player.cdel;
            aButton.worldCol -= player.cdel;
            bButton.worldCol -= player.cdel;


            if (hOff > 0 && player.worldCol - hOff < 240 / 2) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        playerIsMoving = 1;
        if (player.worldCol - hOff + player.width < 240 && (collisionmapBitmap[player.worldRow * 512 +
                (player.worldCol + player.width)])
            && (collisionmapBitmap[(player.worldRow + player.height - player.rdel) * 512 +
                (player.worldCol + player.width)])) {

            player.worldCol += player.cdel;
            aButton.worldCol += player.cdel;
            bButton.worldCol += player.cdel;


            if (hOff + 240 < 512 && player.worldCol - hOff >= 240 / 2) {
                hOff++;
            }
        }
    }


    if (!soundB.isPlaying && playerIsMoving) {
        playSoundB(walking_data, walking_length, 1);
    } else {
        if (!playerIsMoving && soundB.data == walking_data)
            pauseSoundB();
    }

    unsigned short collisionColorLeft = player.worldRow - vOff > 0 && (collisionmapBitmap[(player.worldRow - player.rdel) * 512 + player.worldCol]);
    unsigned short collisionColorRight = (collisionmapBitmap[(player.worldRow - player.rdel) * 512 +
                (player.worldCol + player.width - player.cdel)]);



    if (collisionColorLeft == ((0) | (0)<<5 | (31)<<10) || collisionColorRight == ((0) | (0)<<5 | (31)<<10)) {
            aButton.hide = 0;
            canTravel = 1;
            currentTown = towns[0];

    } else if (collisionColorLeft == ((0) | (0)<<5 | (30)<<10) || collisionColorRight == ((0) | (0)<<5 | (30)<<10)) {
            aButton.hide = 0;
            canTravel = 2;
            currentTown = towns[1];


    } else if (collisionColorLeft == ((0) | (0)<<5 | (29)<<10) || collisionColorRight == ((0) | (0)<<5 | (29)<<10)) {
            aButton.hide = 0;
            canTravel = 3;
            currentTown = towns[2];

    } else if (collisionColorLeft == ((0) | (31)<<5 | (0)<<10) || collisionColorRight == ((0) | (31)<<5 | (0)<<10)) {
            aButton.hide = 0;
            canTravel = 4;
            currentTown = towns[3];

    } else if (collisionColorLeft == ((0) | (30)<<5 | (0)<<10) || collisionColorRight == ((0) | (30)<<5 | (0)<<10)) {
            aButton.hide = 0;
            canTravel = 5;
            currentTown = towns[4];

    } else if (!cheatActive && collisionColorLeft == ((31) | (0)<<5 | (31)<<10) || collisionColorRight == ((31) | (0)<<5 | (31)<<10)) {
            aButton.hide = 0;
            textViewChoice = -1;
            canTravel = 69;



    } else if (canTravelDungeon && (collisionColorLeft == ((31) | (0)<<5 | (0)<<10) || collisionColorRight == ((31) | (0)<<5 | (0)<<10))) {


            canTravel = 6;
            aButton.hide = 0;
            currentTown = towns[5];


    } else {
            aButton.hide = 1;
            canTravel = 0;



            if (playerHasBow) {
                if (randomEncounterCounter % 600 == 0) {

                    battleViewDefeated = 0;
                    battleViewChoice = 0;
                    pauseSound();
                    goToTextView("", "A group of goblin raiders approach.", "", "Battle", "Flee");

                }

                if (!battleViewDefeated && textViewChoice == 1) {
                    randomEncounterCounter = 1;

                    initBattleView();
                    goToBattleView();
                }


                if (!battleViewDefeated && textViewChoice == 0 && rand() % 2 == 0) {
                    goToTextView("", "You could not escape!", "", "Battle", "");
                } else {
                    textViewChoice = -1;
                }
            }


    }

    if (player.worldRow >= 120 && !playerHasBow) {
        goToTextView("Hint: go to town", "It's dangerous without a weapon!", "Are you sure you want to leave?", "", "Back");
    }

    if (playerIsMoving && (playerHasBow)) {
        randomEncounterCounter++;

    }



    animateMapViewPlayer();
}


void animateMapViewPlayer() {


    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;


    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))))
        player.aniState = SPRITEBACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))))
        player.aniState = SPRITEFRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        player.aniState = SPRITELEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        player.aniState = SPRITERIGHT;


    if (player.aniState == SPRITEIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void drawMapView() {

    drawMapViewPlayer();
    drawButtons(hOff, vOff);

    drawGlobal();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;


}


void drawMapViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & player.worldRow - vOff) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & player.worldCol - hOff) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((player.curFrame * 2)*32+(player.aniState * 2));
    }
}
