# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
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
# 2 "sound.c" 2
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
# 3 "sound.c" 2

void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = 11025;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = (((59.727)*length)/11025);
        soundA.vBlankCount = 0;
}


void playSoundB( const signed char* sound, int length, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = 11025;
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.duration = (((59.727)*length)/11025);
        soundB.vBlankCount = 0;
}

void setupInterrupts()
{
    *(unsigned short*)0x4000208 = 0;

    *((ihp*)0x03007FFC) = interruptHandler;

    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

    *(unsigned short*)0x4000208 = 0;

    if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {

            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    dma[1].cnt = 0;
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    dma[2].cnt = 0;
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                }
            }
        }

        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }

    *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {


    soundA.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);


    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void pauseSoundA() {

    soundA.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
}

void pauseSoundB() {

    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSound() {


    soundA.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);


    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000106 = (1<<7);

}

void stopSound() {

    pauseSound();


    dma[0].cnt = 0;


    dma[1].cnt = 0;

}

void stopSoundA() {
    pauseSoundA();


    dma[0].cnt = 0;
}

void stopSoundB() {
    pauseSoundB();


    dma[1].cnt = 0;
}
