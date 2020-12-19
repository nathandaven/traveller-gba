
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "myLib.h"
#include "text.h"
#include "title.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "background.h"
#include "map.h"
#include "global.h"
//#include "time.h"

//backgrounds

#include "buildingsBackgroundA.h"
#include "townCollision.h"
#include "dungeon.h"
#include "dungeonCollision.h"

ANISPRITE aButton;
ANISPRITE bButton;


// A is 1, B is 0
int textViewChoice;
int merchantViewChoice;
int battleViewChoice;
int returnToMap;

TOWN currentTown;
TOWN towns[TOTALTOWNS];

int randomSeed;

// PLAYER DATA
volatile int playerHealth;
volatile int playerMoney;
volatile int playerArrows;
volatile int playerShootSpeed;

// story variables
int playerHasBow;
int bossDead;
int meadCollected;
int boughtKey;
int bountyStarted;
int bountyKilled;
int bountyCompleted;
int letterStarted;
int letterRecieved;
int letterCompleted;
int dungeonKeys;

int touchingMead;

// battle
int battleViewDefeated;

char cheatCode[4] = {'M', 'E', 'A', 'D'};
char cheatEnteredCode[];
int cheatActive;


//OBJ_ATTR shadowOAM[128];

// this class is used for drawn ui elements that are found on all view screens to save wasted code
void initializeGlobal() {
    srand((unsigned) time(NULL)/2);

    playerHealth = 5;
    playerMoney = 0;
    playerHasBow = 0;

    // for gui designing
    //playerHasBow = 1;
    //dungeonKeys = 3;
    //playerShootSpeed = 20;

    //TOWN temp;
    //currentTown = temp;



    //blues
    towns[0].villagerCount = 4;
    towns[1].villagerCount = 3;
    towns[2].villagerCount = 2;

    // greens
    towns[3].villagerCount = 6;
    towns[4].villagerCount = 6;


    //towns[3].merchantTownType = BOWUPGRADE;
    //towns[4].merchantTownType = KEY;
    

    for (int town = 0; town < TOTALTOWNS; town++) {

        towns[town].index = town;
        towns[town].merchantTownType = BOWUPGRADE;
        

        switch(town) {
            case 0:
                //starter city - snow
                // bow quest giver
                //towns[town].villagers[0].type = DOCTOR;
                towns[town].questTownType = LETTERGIVER;
                towns[town].floorRow = 16;

                break;
            case 1:
                // small mountain town
                towns[town].questTownType = LETTERDEST;
                towns[town].floorRow = 13;

                break;
            case 2:
                // small sand town
                towns[town].questTownType = BOUNTYDEST;
                towns[town].floorRow = 16;

                break;
            case 3:
                // big mountain city
                towns[town].questTownType = BOUNTY;
                towns[town].merchantTownType = BOWUPGRADE;
                towns[town].floorRow = 14;

                break;
            case 4:
                // big sand city
                towns[town].questTownType = NONE;
                towns[town].merchantTownType = KEY;
                towns[town].floorRow = 16;

                break;

        }
    }


}

void resetGlobal() {
    TOWN pain;
    TOWN pains[TOTALTOWNS];

    textViewChoice = 0;
    merchantViewChoice = 0;
    battleViewChoice = 0;
    returnToMap = 0;

    currentTown = pain;

    randomSeed = 0;

// PLAYER DATA
    playerHealth = 0;
    playerMoney = 0;
    playerArrows = 0;
    playerShootSpeed = 0;

// story variables
    playerHasBow = 0;
    bossDead = 0;
    meadCollected = 0;
    boughtKey = 0;
    bountyStarted = 0;
    bountyKilled = 0;
    bountyCompleted = 0;
    letterStarted = 0;
    letterRecieved = 0;
    letterCompleted = 0;
    dungeonKeys = 0;

    touchingMead = 0;

    //attle
    battleViewDefeated = 0;

    cheatActive = 0;
}

void updateGlobal() {
    randomSeed = rand();

}

void drawGlobal() {
    // drawing health
    if (cheatActive) {
        for (int i = 1; i <= 10; i++) {
            shadowOAM[103+i].attr0 |= ATTR0_HIDE;
        }
    } else {
        for (int i = 1; i <= 5; i++) {
            shadowOAM[103+i].attr0 |= ATTR0_HIDE;
        }
    }


    for (int i = 1; i <= playerHealth; i++) {
        shadowOAM[103+i].attr0 = ROWMASK & 4 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[103+i].attr1 = COLMASK & 4 + 9*(i-1) | ATTR1_SMALL;
        shadowOAM[103+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(4, 6);
    }

    // drawing money
    shadowOAM[97].attr0 = ROWMASK & 4 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[97].attr1 = COLMASK & SCREENWIDTH - 46 | ATTR1_SMALL;
    shadowOAM[97].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(6, 10);
    drawNumber(playerMoney, SCREENWIDTH - 34, 4);

    // drawing bow icon
    if (playerHasBow) {
        shadowOAM[96].attr0 = ROWMASK & 4 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[96].attr1 = COLMASK & SCREENWIDTH - 62 | ATTR1_SMALL;
        shadowOAM[96].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 8);
    } else {
        shadowOAM[96].attr0 |= ATTR0_HIDE;
    }
    // drawing bow upgrades
    for (int i = 0; i < playerShootSpeed/10; i++) {
        if (playerHasBow) {
            shadowOAM[95-i].attr0 = ROWMASK & 4 | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[95-i].attr1 = COLMASK & SCREENWIDTH - 72 - (i*10) | ATTR1_SMALL;
            shadowOAM[95-i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 8);
        } else {
            shadowOAM[95-i].attr0 |= ATTR0_HIDE;
        }
    }

    // drawing keys
    for (int i = 0; i < dungeonKeys; i++) {
        shadowOAM[80+i].attr0 = ROWMASK & 16 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[80+i].attr1 = COLMASK & 6 + (i*15) | ATTR1_SMALL;
        shadowOAM[80+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(6, 6);
    }


}

// Draw the player
void drawButtons(int hOff, int vOff) {

    if (aButton.hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[1].attr0 = (ROWMASK & aButton.worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & aButton.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 6);
    }

    if (bButton.hide) {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[2].attr0 = (ROWMASK & bButton.worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & bButton.worldCol - hOff)| ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 6);
    }
}

// from 0 to 9
void drawNumber(int value, int col, int row) {
    shadowOAM[99].attr0 |= ATTR0_HIDE;
    shadowOAM[98].attr0 |= ATTR0_HIDE;

    if (value < 0) {
        value = 0;
    }

    if (value > 9) {
        shadowOAM[98].attr0 = ROWMASK & row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[98].attr1 = COLMASK & col + 10 | ATTR1_SMALL;
        shadowOAM[98].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(0 + (value%10)*2, 30);       

        shadowOAM[99].attr0 = ROWMASK & row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[99].attr1 = COLMASK & col | ATTR1_SMALL;
        shadowOAM[99].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(0 + ((int) value/10)*2, 30);   
    } else {
        shadowOAM[99].attr0 = ROWMASK & row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[99].attr1 = COLMASK & col | ATTR1_SMALL;
        shadowOAM[99].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(0 + value*2, 30);        
    }


}