#include "myLib.h"
#include "text.h"
#include "text.h"
#include "title.h"
#include "mapView.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "background.h"
#include "map.h"
#include "collisionmap.h"
#include "global.h"

// sounds
#include "sound.h"
#include "arrowShot.h"
#include "enemyDie.h"
#include "enemyHit.h"
#include "playerHit.h"
#include "walking.h"

int hOff;
int vOff;

int savedhOff;
int savedvOff;
int savedRow;
int savedCol;

int canTravel;

//for sound
int playerIsMoving;

// TODO - DUNGEON
int canTravelDungeon;
int messageShown;

int randomEncounterCounter;




OBJ_ATTR shadowOAM[128];

// extern objects
ANISPRITE player;


// initializes game
void initMapView() {


    waitForVBlank();

    randomEncounterCounter = 1;

    textViewChoice = -1;
    //vOff = 96;
    //hOff = 9;

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;


    initMapViewPlayer();
    initMapViewButtons();
}

// initializes player
void initMapViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;

}

// initializes a/b buttons
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
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;

    hOff = 0;
    vOff = 0;

    player.worldCol = SCREENWIDTH / 2;
    player.worldRow = SCREENHEIGHT / 2;
}

void resumeMapView() {
    

    waitForVBlank();


    vOff = savedvOff;
    hOff = savedhOff;

    REG_BG0VOFF = savedvOff;
    REG_BG0HOFF = savedhOff;


    player.worldRow = savedRow;
    player.worldCol = savedCol;

    initMapViewButtons();
}


// updates data for game
void updateMapView() {


    savedvOff = vOff;
    savedhOff = hOff;
    savedRow = player.worldRow;
    savedCol = player.worldCol;

    updateMapViewPlayer();

    randomEncounterCounter++;

    // checks if enemys in all of the towns are defeated -- OLD WIN
/*     canTravelDungeon = 1;
    for (int i = 0; i < TOTALTOWNS-1; i++) {
        if(towns[i].enemyDefeated == 0) {
            canTravelDungeon = 0;
        }
    } */

    // new win
    if (dungeonKeys >= 3) {
        canTravelDungeon = 1;
    }

    // checks for dungeon opening
    if (canTravelDungeon && !messageShown && playerHasBow) {
        messageShown = 1;
        goToTextView("", "A rumble appears from the dungeon..", "", "", "Back");
    }
    
}


// Handle every-frame actions of the player
void updateMapViewPlayer() {

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;

    playerIsMoving = 0;

    if(BUTTON_HELD(BUTTON_UP)) {
        playerIsMoving = 1;
        if (player.worldRow - vOff > 0 && (collisionmapBitmap[(player.worldRow - player.rdel) * MAPWIDTH + player.worldCol])
            && (collisionmapBitmap[(player.worldRow - player.rdel) * MAPWIDTH +
                (player.worldCol + player.width - player.cdel)])) {

            player.worldRow -= player.rdel;
            aButton.worldRow -= player.rdel;
            bButton.worldRow -= player.rdel;

            if (vOff > 0 && player.worldRow - vOff < SCREENHEIGHT / 2) {
                vOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        playerIsMoving = 1;
        if (player.worldRow - vOff + player.height < SCREENHEIGHT &&
            (collisionmapBitmap[(player.worldRow + player.height) * MAPWIDTH +
                player.worldCol])
            && (collisionmapBitmap[(player.worldRow + player.height) * MAPWIDTH
                + (player.worldCol + player.width - player.cdel)])) {

            player.worldRow += player.rdel;
            aButton.worldRow += player.rdel;
            bButton.worldRow += player.rdel;

            if (vOff + SCREENHEIGHT < MAPHEIGHT && player.worldRow - vOff >= SCREENHEIGHT / 2) {
                vOff++;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        playerIsMoving = 1;
        if (player.worldCol - hOff > 0 && (collisionmapBitmap[player.worldRow * MAPWIDTH
            + (player.worldCol - player.cdel)])
            && (collisionmapBitmap[(player.worldRow + player.height - player.rdel) * MAPWIDTH
            + (player.worldCol - player.cdel)])) {

            player.worldCol -= player.cdel;
            aButton.worldCol -= player.cdel;
            bButton.worldCol -= player.cdel;


            if (hOff > 0 && player.worldCol - hOff < SCREENWIDTH / 2) {
                hOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        playerIsMoving = 1;
        if (player.worldCol - hOff + player.width < SCREENWIDTH && (collisionmapBitmap[player.worldRow * MAPWIDTH +
                (player.worldCol + player.width)])
            && (collisionmapBitmap[(player.worldRow + player.height - player.rdel) * MAPWIDTH +
                (player.worldCol + player.width)])) {

            player.worldCol += player.cdel;
            aButton.worldCol += player.cdel;
            bButton.worldCol += player.cdel;


            if (hOff + SCREENWIDTH < MAPWIDTH && player.worldCol - hOff >= SCREENWIDTH / 2) {
                hOff++;
            }
        }
    }

    // walking sound
    if (!soundB.isPlaying  && playerIsMoving) {
        playSoundB(walking_data, walking_length, 1);
    } else {
        if (!playerIsMoving && soundB.data == walking_data)
            pauseSoundB();     
    }

    unsigned short collisionColorLeft = player.worldRow - vOff > 0 && (collisionmapBitmap[(player.worldRow - player.rdel) * MAPWIDTH + player.worldCol]);
    unsigned short collisionColorRight = (collisionmapBitmap[(player.worldRow - player.rdel) * MAPWIDTH +
                (player.worldCol + player.width - player.cdel)]);


    // checks if player enocunters a town        
    if (collisionColorLeft == COLOR(0,0,31) || collisionColorRight == COLOR(0,0,31)) { //blue
            aButton.hide = 0;
            canTravel = 1;
            currentTown = towns[0];

    } else if (collisionColorLeft == COLOR(0,0,30) || collisionColorRight == COLOR(0,0,30)) { //blue
            aButton.hide = 0;
            canTravel = 2;
            currentTown = towns[1];


    } else if (collisionColorLeft == COLOR(0,0,29) || collisionColorRight == COLOR(0,0,29)) { //blue
            aButton.hide = 0;
            canTravel = 3;
            currentTown = towns[2];

    } else if (collisionColorLeft == COLOR(0,31,0) || collisionColorRight == COLOR(0,31,0)) { //green
            aButton.hide = 0;
            canTravel = 4;
            currentTown = towns[3];

    } else if (collisionColorLeft == COLOR(0,30,0) || collisionColorRight == COLOR(0,30,0)) { //green
            aButton.hide = 0;
            canTravel = 5;
            currentTown = towns[4];

    } else if (!cheatActive && collisionColorLeft == COLOR(31,0,31) || collisionColorRight == COLOR(31,0,31)) { // PURPLE -- CHEAT
            aButton.hide = 0;
            textViewChoice = -1;
            canTravel = 69;



    } else if (canTravelDungeon && (collisionColorLeft == RED || collisionColorRight == RED)) {
            // dungeon, final win
            //canTravelDungeon = 1;
            canTravel = 6;
            aButton.hide = 0;
            currentTown = towns[5];
    

    } else {
            aButton.hide = 1;
            canTravel = 0;

            // random battles
            // checks to see if player has bow or has accepted the warning
            if (playerHasBow) {
                if (randomEncounterCounter % 600 == 0) {
                    //textViewChoice = -1;
                    battleViewDefeated = 0;
                    battleViewChoice = 0;
                    pauseSound();
                    goToTextView("", "A group of goblin raiders approach.", "", "Battle", "Flee");

                }

                if (!battleViewDefeated && textViewChoice == 1) {
                    randomEncounterCounter = 1;
                    //resumeBattleView();
                    initBattleView();
                    goToBattleView();
                } 

                // random chance if the player can escape a battle
                if (!battleViewDefeated && textViewChoice == 0  && rand() % 2 == 0) {
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

// Handle player animation states
void animateMapViewPlayer() {

    // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        player.aniState = SPRITEBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        player.aniState = SPRITEFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = SPRITELEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = SPRITERIGHT;

    // If the player aniState is idle, frame is player standing
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
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    //drawGlobal();
}

// Draw the player
void drawMapViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }
}



