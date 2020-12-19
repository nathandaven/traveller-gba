#include "myLib.h"
#include "title.h"
#include "dungeonView.h"
#include "spritesheet.h"
#include "pause.h"

#include "global.h"

#include "time.h"

#include "dungeon.h"
#include "dungeonCollision.h"


// sounds
#include "sound.h"
#include "arrowShot.h"
#include "enemyDie.h"
#include "enemyHit.h"
#include "playerHit.h"
#include "walking.h"
#include "playerJump.h"
#include "mainTheme.h"


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

int screenPan;

int savedWorldRow;
int savedWorldCol;
int savedvOff;
int savedhOff;

int playerTookDamage;
int damageTimer;
int playerShootCooldown;


// for sound
int playerIsMoving;
int storedMusicDuration;


VILLAGER enemies[TOTALENEMIES];
VILLAGER boss;

ANISPRITE mead;
ANISPRITE rainingMeads[10];
int rainingMeadTimer;
int meadTimerStarted;

// extern objects
ANISPRITE player;
ANISPRITE arrows[TOTALSCREENARROWS];
ANISPRITE bow;
//int showBow;

// initializes game
void initDungeonView() {

    // moved to state switch

    textViewChoice = -1;

    vOff = 0;
    hOff = 0;

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    for (int i = 0; i < 10; i++) {
        rainingMeads[i].width = 16;
        rainingMeads[i].height = 16;
        rainingMeads[i].rdel = 1;
        rainingMeads[i].cdel = 1;
        rainingMeads[i].worldRow = 0;
        rainingMeads[i].worldCol = (SCREENWIDTH /10)*i;
        rainingMeads[i].hide = 1;        
    }

    meadTimerStarted = 0;
    rainingMeadTimer = 0;

    mead.width = 16;
    mead.height = 16;
    mead.rdel = 1;
    mead.cdel = 1;
    mead.worldRow = 392;
    mead.worldCol = 370;
    mead.hide = 1;

    initDungeonViewPlayer();
    initDungeonViewEnemies();
    initDungeonViewButtons();
    initDungeonViewArrows();
}


// initializes player
void initDungeonViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 70 + vOff;
    player.worldCol = SCREENWIDTH/2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;


}

void initDungeonViewEnemies() {

    // locations

    // hostiles
    enemies[0].sprite.worldRow = 400;
    enemies[0].sprite.worldCol = 380;
    enemies[0].type = GOBLIN;
    enemies[0].doesWander = 1;

    enemies[1].sprite.worldRow = (MAPHEIGHT) - 80;
    enemies[1].sprite.worldCol = 400;
    enemies[1].type = GOBLIN;
    enemies[1].doesWander = 1;


    enemies[2].sprite.worldRow = (MAPHEIGHT) - 80;
    enemies[2].sprite.worldCol = 420;
    enemies[2].type = HOSTILE;
    enemies[2].doesWander = 1;


    enemies[3].sprite.worldRow = 70;
    enemies[3].sprite.worldCol = 272;
    enemies[3].type = HOSTILE;
    enemies[3].doesWander = 0;
    enemies[3].isHostile = 1;
    enemies[3].isStationary = 1;

    enemies[4].sprite.worldRow = 292;
    enemies[4].sprite.worldCol = 280;
    enemies[4].type = HOSTILE;
    enemies[4].doesWander = 0;

    // boss
    enemies[5].sprite.worldRow = (MAPHEIGHT) - 80;
    enemies[5].sprite.worldCol = 450;
    enemies[5].type = BOSS;
    enemies[5].doesWander = 0;
    // location


    //enemies[0].sprite.worldRow = 280;
    //enemies[0].sprite.worldCol = 240;


    for(int i = 0; i < TOTALENEMIES; i++) {
        enemies[i].sprite.width = 16;
        enemies[i].sprite.height = 16;
        enemies[i].sprite.rdel = 1;
        enemies[i].sprite.cdel = 1;
        //enemies[i].sprite.worldRow = (MAPHEIGHT) - 80;
        //enemies[i].sprite.worldCol = 300 + 70*i;
        enemies[i].sprite.aniCounter = 0;
        enemies[i].sprite.curFrame = 0;
        enemies[i].sprite.numFrames = 3;

        // randomizes the direction
        enemies[i].sprite.direction = 1;
        enemies[i].isMoving = 0;
        enemies[i].isHostile = 0;

        enemies[i].sprite.hide = 0;


        switch(enemies[i].type) {
            // ranged enemy
            case (HOSTILE):
                    //enemies[i].sprite.worldCol = 440;
                    //enemies[i].sprite.worldRow = SCREENHEIGHT - 33;

                    //enemies[i].doesWander = 0;
                    enemies[i].health = 3; 


                    enemies[i].shootCounter = 20+(20*i);

                    for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
                        enemies[i].hostileArrows[j].width = 16;
                        enemies[i].hostileArrows[j].height = 16;
                        enemies[i].hostileArrows[j].rdel = 1;
                        enemies[i].hostileArrows[j].cdel = 1;
                        enemies[i].hostileArrows[j].worldRow = enemies[i].sprite.worldRow;
                        enemies[i].hostileArrows[j].worldCol = enemies[i].sprite.worldCol;
                        enemies[i].hostileArrows[j].hide = 1;
                        enemies[i].hostileArrows[j].direction = 1;

                    }

                    // bow
                    enemies[i].bow.width = 16;
                    enemies[i].bow.height = 16;
                    enemies[i].bow.rdel = 1;
                    enemies[i].bow.cdel = 1;
                    enemies[i].bow.worldRow = enemies[i].sprite.worldRow;
                    enemies[i].bow.worldCol = enemies[i].sprite.worldCol;
                    enemies[i].bow.hide = 1;
                    break;
                break;
            case(GOBLIN):
                    //enemies[i].doesWander = 1;
                enemies[i].health = 3; 

                break;

            case(BOSS):
                enemies[i].health = 6; 

                enemies[i].sprite.width = 32;
                enemies[i].sprite.height = 32;
                    //enemies[i].doesWander = 1;
                break;
        }

    }


}

void initDungeonViewArrows() {
    for (int i = 0; i < TOTALSCREENARROWS; i++) {
        arrows[i].width = 16;
        arrows[i].height = 16;
        arrows[i].rdel = 1;
        arrows[i].cdel = 1;
        arrows[i].worldRow = player.worldRow;
        arrows[i].worldCol = player.worldCol;
        arrows[i].hide = 1;
    }

    // bow
    bow.width = 16;
    bow.height = 16;
    bow.rdel = 1;
    bow.cdel = 1;
    bow.worldRow = player.worldRow;
    bow.worldCol = player.worldCol;
    bow.hide = 1;
}


// initializes a/b buttons
void initDungeonViewButtons() {
    aButton.width = 16;
    aButton.height = 16;
    aButton.rdel = 1;
    aButton.cdel = 1;
    aButton.worldRow = player.worldRow-24;
    aButton.worldCol = player.worldCol;
    aButton.hide = 1;

    bButton.width = 16;
    bButton.height = 16;
    bButton.rdel = 1;
    bButton.cdel = 1;
    bButton.worldRow = player.worldRow-24;
    bButton.worldCol = player.worldCol;
    bButton.hide = 1;
}

void resumeDungeonView() {

    waitForVBlank();


    vOff = savedvOff;
    hOff = savedhOff;

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG3VOFF = vOff;
    REG_BG3HOFF = hOff;

    player.worldRow = savedWorldRow;
    player.worldCol = savedWorldCol;

}

// updates data for game
void updateDungeonView() {
    playerTookDamage = 0;
    if (enemies[5].health <=0) {
        bossDead = 1;
    }

    updateMead();

    updateDungeonViewPlayer();
    updateDungeonViewEnemies();
    updateDungeonViewArrows();
    updateDungeonViewHostileArrows();

    if (collision(player.worldCol, player.worldRow, player.width, player.height, mead.worldCol, mead.worldRow, mead.width, mead.height)) {
        touchingMead = 1;
        aButton.hide = 0;
    } else {
        touchingMead = 0;
        aButton.hide = 1;
    }


    // was having mega issues with player taking way too much damage at once, this gives it a cool down
    if (damageTimer > 0) {
        damageTimer--;
    }
    if (playerTookDamage && damageTimer < 1) {
        playerHealth -= 1;
        playerTookDamage = 0;
        damageTimer = 60;
        playSoundB(playerHit_data, playerHit_length, 0);

    }



}

void updateMead() {



    if ((bossDead) && !meadCollected) {
        //mead.worldCol = enemies[5].sprite.worldCol;
        //mead.worldRow = enemies[5].sprite.worldRow;
        if (!meadTimerStarted && rainingMeadTimer == 0) {
            meadTimerStarted = 1;
            playSoundA(mainTheme_data, mainTheme_length, 1);
        }

        if (meadTimerStarted) {
            rainingMeadTimer++;
            
            // starts a new mead
/*             if (rainingMeadTimer / 20 == 0) {
                for (int i = 0; i < 10; i++) {
                    if (rainingMeads[i].hide == 1) {
                        rainingMeads[i].hide = 0;
                        break;
                    }
                }
            } */

            if (rainingMeadTimer / 80 == 0) {
                for (int i = 0; i < 10; i++) {
                    int random = rand()%10;
                    if (rainingMeads[i].hide == 1) {
                        rainingMeads[i].hide = 0;
                        break;
                    }
                }
            }

            // gravity for mead
            for (int i = 0; i < 10; i++) {


                if (rainingMeads[i].hide == 0) {
                    //if (rainingMeads[i].worldRow > SCREENHEIGHT) {
                        rainingMeads[i].velocity = (int) rainingMeads[i].velocity + (GRAVITY*.05);
                        // gravity arithmetic

                        rainingMeads[i].worldRow = (int) rainingMeads[i].worldRow - round(rainingMeads[i].velocity*.1);
                        //rainingMeads[i].worldRow += mead.rdel;

                    } else {
                        rainingMeads[i].velocity = 0;
                        //rainingMeads[i].hide = 0;
                        rainingMeads[i].worldRow = 0;
                    }

/*                 if (rainingMeads[i].worldRow - round(rainingMeads[i].velocity*.1) >= SCREENHEIGHT) {
                    rainingMeads[i].worldRow = 0;
                    rainingMeads[i].velocity = 0;
                    rainingMeads[i].hide = 1;
                } */
                
            }
        } 

        if (rainingMeadTimer > 450 ) {
            mead.hide = 0;
            meadTimerStarted = 0;


            if (((dungeonCollisionBitmap[(int) (mead.worldRow + mead.height - round(mead.velocity*.1)) * MAPWIDTH +
                mead.worldCol])
                && (dungeonCollisionBitmap[(int) (mead.worldRow + mead.height - round(mead.velocity*.1)) * MAPWIDTH
                + (mead.worldCol + mead.width - mead.cdel)]))) {

                    mead.velocity = (int) mead.velocity + (GRAVITY*.08);
                    // gravity arithmetic
                    mead.worldRow = (int) mead.worldRow - round(mead.velocity*.1);


            } else {
                mead.velocity = 0;
            }
        }
    }    
}

// Handle every-frame actions of the player
void updateDungeonViewPlayer() {
    initDungeonViewButtons();

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;
    int canJump = 1;

    unsigned short collisionColorLeft = player.worldRow - vOff > 0 && (dungeonCollisionBitmap[(player.worldRow - player.rdel) * MAPWIDTH + player.worldCol]);
    unsigned short collisionColorRight = (dungeonCollisionBitmap[(player.worldRow - player.rdel) * MAPWIDTH +
                (player.worldCol + player.width - player.cdel)]);

    if (collisionColorLeft == RED || collisionColorRight == RED) {
        playerHealth = 0;
    }
    if (((dungeonCollisionBitmap[(int) (player.worldRow + player.height  - round(player.velocity*0.1)) * MAPWIDTH +
            player.worldCol])
        && (dungeonCollisionBitmap[(int) (player.worldRow + player.height - round(player.velocity*0.1)) * MAPWIDTH
            + (player.worldCol + player.width - player.cdel)]))) {

        player.velocity = (int) player.velocity + (GRAVITY*.08);
        canJump = 0;
        
        // gravity arithmetic
        player.worldRow = (int) player.worldRow - round(player.velocity*.1);
        aButton.worldRow = (int) aButton.worldRow - round(player.velocity*.1);
        bButton.worldRow = (int) bButton.worldRow - round(player.velocity*.1);

        if (player.worldRow - vOff + player.height > (SCREENHEIGHT - 35) &&  (vOff + SCREENHEIGHT < MAPHEIGHT - 10)) {
            //vOff += 1;
            vOff = (int) vOff - round(player.velocity*.1);
        }
    } else {
        
        player.velocity = 0;
    
        canJump = 1;
    }

    // setup for walking sound
    playerIsMoving = 0;

    if(BUTTON_HELD(BUTTON_LEFT)) {
        playerIsMoving = 1;
        player.direction = -1;
        if (player.worldCol - hOff > 0 && (dungeonCollisionBitmap[player.worldRow * MAPWIDTH
            + (player.worldCol - player.cdel)])
            && (dungeonCollisionBitmap[(player.worldRow + player.height - player.rdel) * MAPWIDTH
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
        player.direction = 1;
        if (player.worldCol - hOff + player.width < SCREENWIDTH && (dungeonCollisionBitmap[player.worldRow * MAPWIDTH +
                (player.worldCol + player.width)])
            && (dungeonCollisionBitmap[(player.worldRow + player.height - player.rdel) * MAPWIDTH +
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
        playSoundB(walking_data, walking_length, 0);
    } else {
        if (!playerIsMoving && soundB.data == walking_data)
            pauseSoundB();
            
    }

    // JUMPING FUNCTIONALITY
    if (BUTTON_PRESSED(BUTTON_UP) && canJump) {
        player.worldRow-= 4;
        aButton.worldCol--;
        bButton.worldCol--;
		player.velocity = 40;
        playSoundB(playerJump_data, playerJump_length, 0);
	}

    playerShootCooldown--;
    if (playerShootCooldown <= 0) {
        playerShootCooldown = 0;
    }
    // TODO - SHOOTING ARROWS
    if (playerHasBow && BUTTON_PRESSED(BUTTON_B) && playerShootCooldown < 2) { //playerHasBow && playerArrows > 0 && 
        for (int i = 0; i < TOTALSCREENARROWS; i++) {
            if (arrows[i].hide) {
                arrows[i].hide = 0;
                arrows[i].worldRow = player.worldRow - 2;
                arrows[i].worldCol = player.worldCol;
                arrows[i].velocity = 10;
                arrows[i].horVelocity = 80;
                arrows[i].didDamage = 0;   

                arrows[i].direction = player.direction;

                playerShootCooldown = PLAYERSHOOTTHRESHHOLD - playerShootSpeed;

                break;
            }
        }
        playSoundB(arrowShot_data, arrowShot_length, 0);
   
    }

    // player interactions
    for (int i = 0; i < TOTALENEMIES; i++) {
        switch(enemies[i].type) {
            case (BOSS):
            // temp giving boss GOBLIN ai
                if (enemies[i].health <= 0) {
                    bossDead = 1;
                }
            case(GOBLIN):
                if (enemies[i].health > 0 && collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow,
                    enemies[i].sprite.width, enemies[i].sprite.height, player.worldCol, player.worldRow, player.width, player.height)) {
                        playerTookDamage = 1;
                        enemies[i].attackedPlayer = 1;
                        enemies[i].timeToRun = 60;

                        //break;
                }
                break;
            case(HOSTILE):
                for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
                    // TODO - collision w player
                    if (enemies[i].hostileArrows[j].hide == 0 && collision(enemies[i].hostileArrows[j].worldCol, enemies[i].hostileArrows[j].worldRow,
                        enemies[i].hostileArrows[j].width, enemies[i].hostileArrows[j].height, player.worldCol, player.worldRow, player.width, player.height)) {
                            enemies[i].hostileArrows[j].hide = 1;   
                            playerTookDamage = 1;
        
                            //break;
                    }
                    
                } 
                break;
        }

    }
    savedWorldCol = player.worldCol;
    savedWorldRow = player.worldRow;

    animateDungeonViewPlayer();
}

// Handle player animation states
void animateDungeonViewPlayer() {

    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;

    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = SPRITELEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = SPRITERIGHT;

    if (player.aniState == SPRITEIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}


void updateDungeonViewArrows() {

    // player arrows
    bow.hide = 1;
    for (int i = 0; i < TOTALSCREENARROWS; i++) {

        // collision map and screen edge destruction handling
        if ((arrows[i].worldRow - vOff + arrows[i].height < SCREENHEIGHT &&
                (dungeonCollisionBitmap[(arrows[i].worldRow + arrows[i].height) * MAPWIDTH +
                    arrows[i].worldCol])
                && (dungeonCollisionBitmap[(arrows[i].worldRow + arrows[i].height) * MAPWIDTH
                    + (arrows[i].worldCol + arrows[i].width - arrows[i].cdel)]))) {

                // gravity arithmetic
                arrows[i].worldRow = (int) arrows[i].worldRow - (arrows[i].velocity*.1);
                // hides bow if arrow is being shot
                bow.hide = 0;
                if (arrows[i].direction == 1) {
                    arrows[i].worldCol = (int) arrows[i].worldCol + round(arrows[i].horVelocity*.1);
                } else {
                    arrows[i].worldCol = (int) arrows[i].worldCol - round(arrows[i].horVelocity*.1);                   
                }
                arrows[i].velocity = (int) arrows[i].velocity + (GRAVITY*.05);

        } else {
            arrows[i].hide = 1;
            arrows[i].worldRow = 4;
            arrows[i].worldCol = 4;

        }
        if (arrows[i].worldCol < 1 || arrows[i].worldCol > MAPWIDTH-16) {
            arrows[i].hide = 1;
        }
    }

    // updating bow location
    if (player.direction == 1) {
        bow.worldCol = player.worldCol + 5;
    } else {
        bow.worldCol = player.worldCol - 5;
    } 
    bow.worldRow = player.worldRow;

}


void updateDungeonViewHostileArrows() {
    int playerTookDamage = 0;
    for (int i = 0; i < TOTALENEMIES; i++) {
        // player arrows
        enemies[i].bow.hide = 1;

        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {

            // collision map and screen edge destruction handling
            if ((enemies[i].hostileArrows[j].worldRow - vOff + enemies[i].hostileArrows[j].height < SCREENHEIGHT &&
                    (dungeonCollisionBitmap[(enemies[i].hostileArrows[j].worldRow + enemies[i].hostileArrows[j].height) * MAPWIDTH +
                        enemies[i].hostileArrows[j].worldCol])
                    && (dungeonCollisionBitmap[(enemies[i].hostileArrows[j].worldRow + enemies[i].hostileArrows[j].height) * MAPWIDTH
                        + (enemies[i].hostileArrows[j].worldCol + enemies[i].hostileArrows[j].width - enemies[i].hostileArrows[j].cdel)]))) {

                    // gravity arithmetic
                    enemies[i].hostileArrows[j].worldRow = (int) enemies[i].hostileArrows[j].worldRow - round(enemies[i].hostileArrows[j].velocity*.1);
                    // hides bow if arrow is being shot
                    enemies[i].bow.hide = 0;
                    if (enemies[i].sprite.direction == 1) {
                        enemies[i].hostileArrows[j].worldCol++;                   

                        //enemies[i].hostileArrows[j].direction = 1;
                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol + round(enemies[i].hostileArrows[j].horVelocity*.1);
                    } else {
                        //enemies[i].hostileArrows[j].direction = -1;
                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol - round(enemies[i].hostileArrows[j].horVelocity*.1);                   
                        //enemies[i].hostileArrows[j].worldCol--;                   
                    }

                    enemies[i].hostileArrows[j].velocity = (int) enemies[i].hostileArrows[j].velocity + (GRAVITY*.1);

            } else {
                enemies[i].hostileArrows[j].hide = 1;
            }

            if (enemies[i].hostileArrows[j].worldCol < 1 || enemies[i].hostileArrows[j].worldCol > MAPWIDTH-16) {
                enemies[i].hostileArrows[j].hide = 1;
            }
        }

        // updating bow location
        if (enemies[i].sprite.direction == 1) {
            enemies[i].bow.worldCol = enemies[i].sprite.worldCol + 5;
        } else {
            enemies[i].bow.worldCol = enemies[i].sprite.worldCol - 5;
        } 
        enemies[i].bow.worldRow = enemies[i].sprite.worldRow;
    }
    
}

// villager ai
void updateDungeonViewEnemies() {
    int willShoot;

    for (int i = 0; i < TOTALENEMIES; i++) {
        int showButton = 0;

        int oldWorldRow = enemies[i].sprite.worldRow;
        int oldWorldCol = enemies[i].sprite.worldCol;

        // collision map and screen edge destruction handling
        if (((dungeonCollisionBitmap[(int) (enemies[i].sprite.worldRow + enemies[i].sprite.height - round(enemies[i].sprite.velocity*.1)) * MAPWIDTH +
            enemies[i].sprite.worldCol])
            && (dungeonCollisionBitmap[(int) (enemies[i].sprite.worldRow + enemies[i].sprite.height - round(enemies[i].sprite.velocity*.1)) * MAPWIDTH
            + (enemies[i].sprite.worldCol + enemies[i].sprite.width - enemies[i].sprite.cdel)]))) {


                enemies[i].sprite.velocity = (int) enemies[i].sprite.velocity + (GRAVITY*.08);
                enemies[i].canJump = 0;

                // gravity arithmetic
                enemies[i].sprite.worldRow = (int) enemies[i].sprite.worldRow - round(enemies[i].sprite.velocity*.1);

                //
                enemies[i].isJumping = 1;

        } else {
            enemies[i].sprite.velocity = 0;
            //enemies[i].canJump = 1;
            enemies[i].isJumping = 0;
        }

        // CHECKING FOR WALL COLLISIONS
        //left
        if (enemies[i].sprite.worldCol - hOff > 0 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * MAPWIDTH
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * MAPWIDTH
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])) {

            enemies[i].againstWallLeft = 0;

        }  else {
            enemies[i].againstWallLeft = 1;            
        }
 

        // right
        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < SCREENWIDTH && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * MAPWIDTH +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * MAPWIDTH +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])) {

            enemies[i].againstWallRight = 0;

        } else {
            enemies[i].againstWallRight = 1;            
        }


        // hides if off screen

        if ((enemies[i].sprite.worldCol - hOff > SCREENWIDTH || enemies[i].sprite.worldCol - hOff < 0 || 
            enemies[i].sprite.worldRow - vOff > SCREENHEIGHT || enemies[i].sprite.worldRow - vOff < 0)) {
            enemies[i].sprite.hide = 1;
        } else {
            enemies[i].sprite.hide = 0;
        }

        // makes enemy hostile if clsoe enough to player
        if (abs(enemies[i].sprite.worldRow- player.worldRow) < 50 && abs(enemies[i].sprite.worldCol - player.worldCol) < 120) {
            enemies[i].isHostile = 1;
            //enemies[i].doesWander = 0;
        } else {
            enemies[i].isHostile = 0;
            //enemies[i].doesWander = 1;
        }




        // random movement AI
        if (enemies[i].doesWander) { //&& !enemies[i].notHostile
            // sets movement interval
            if(enemies[i].movementCounter % ((rand()%40) + 100) == 0 && !enemies[i].isMoving) {
                enemies[i].timeToMove = 60 + (4*i);
                enemies[i].isMoving = 1;
                //currentTown.villagers[i].sprite.direction = -1;

                if (rand() % 100 > 60) {
                    enemies[i].sprite.direction *= -1;
                }
            }

            for (int j = 0; j < TOTALENEMIES; j++) {
                if (i != j) {
                    if (collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width, enemies[i].sprite.height,
                        enemies[j].sprite.worldCol, enemies[j].sprite.worldRow, enemies[j].sprite.width, enemies[j].sprite.height) && !enemies[i].isMoving) {
                            enemies[i].timeToMove = 60;
                            enemies[i].isMoving = 1;                        
                    }
                }
            }
        }


        if (enemies[i].damageCooldown >= 0) {
            enemies[i].damageCooldown--;
        } else {
            enemies[i].damageCooldown = 0;
        }

        int tookDamage = 0;


        // checking for collision w player arrows
        for (int j = 0; j < TOTALSCREENARROWS; j++) {
            if (enemies[i].health > 0) {
                if (!arrows[j].didDamage && (collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width,
                    enemies[i].sprite.height, arrows[j].worldCol, arrows[j].worldRow, arrows[j].width, arrows[j].height) )) {
                    
                    arrows[j].hide = 1;   
                    arrows[j].didDamage = 1;   
                    arrows[j].worldCol = 0;   
                    arrows[j].worldRow = 0;   
                    arrows[j].hide = 1;   
                    playSoundB(enemyHit_data, enemyHit_length, 0);

                }
            }

            if (arrows[j].didDamage && enemies[i].damageCooldown < 2 ) {
                arrows[j].didDamage = 0;
                enemies[i].health -= 1;
                enemies[i].damageCooldown = 10;
                if (enemies[i].health <= 0 ) {
                    enemies[i].sprite.hide = 1;
                }
            }
        }


        // AI applied to each enemy type
        switch(enemies[i].type) {
            // ranged enemies
            case (HOSTILE):
                // attack ai
                if (enemies[i].isHostile && enemies[i].health > 0) {
                    enemies[i].shootCounter++;
                    willShoot = 1;

                    int distanceToKeep = 80;
                    int distanceToAvoid = 40;
                    int distanceFromPlayer = enemies[i].sprite.worldCol - player.worldCol;

                    enemies[i].timeToWait--;

                    // movement ai
                    if (enemies[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToKeep) {
                        enemies[i].isMoving++;
                        enemies[i].timeToMove = 20 + (4*i);
                        enemies[i].isMoving = 1;
                        if (distanceFromPlayer > 0) {
                            //enemies[i].sprite.worldCol--;
                            enemies[i].sprite.direction = -1;

                        } else {
                            //enemies[i].sprite.worldCol++;
                            enemies[i].sprite.direction = 1;
                        }

                    } else {
                        if (abs(distanceFromPlayer) < distanceToAvoid) {
                            if (!enemies[i].hasWaited) {
                                willShoot = 0;
                                enemies[i].timeToWait = 20;
                                enemies[i].hasWaited = 1;
                            }
                            if (distanceFromPlayer > 0) {
                                //enemies[i].sprite.worldCol--;
                                enemies[i].sprite.direction = -1;

                            } else {
                                //enemies[i].sprite.worldCol++;
                                enemies[i].sprite.direction = 1;
                            }
                        }
                    }
                 

                    // shooting an arrow
                    // random chance
                    if (willShoot && enemies[i].shootCounter % (40*(i+1))< 1) {
                        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {   

                            if (enemies[i].hostileArrows[j].hide) {
                                enemies[i].hostileArrows[j].hide = 0;
                                enemies[i].hostileArrows[j].worldRow = enemies[i].sprite.worldRow - 3;
                                enemies[i].hostileArrows[j].worldCol = enemies[i].sprite.worldCol;
                                enemies[i].hostileArrows[j].velocity = 10;
                                enemies[i].hostileArrows[j].horVelocity = 80;
                                enemies[i].hostileArrows[j].didDamage = 0;   

                                enemies[i].hostileArrows[j].direction = enemies[i].sprite.direction;

                                break;
                            }
                        }
                    //playSoundB(arrowShot_data, arrowShot_length, 0);

                    }
                }
            break; 

            case (BOSS):
            // temp giving boss GOBLIN ai
            case (GOBLIN):
                // attack ai - melee
                if (enemies[i].isHostile && enemies[i].health > 0) {
                    enemies[i].shootCounter++;
                    //enemies[i] = 1;


                    int waitingTime = 100 + 5*i;
                    int distanceToAttack = 0;
                    int distanceToRun = 50 + 3*i;
                    int distanceFromPlayer = enemies[i].sprite.worldCol - player.worldCol;

                    enemies[i].timeToWait--;
                    enemies[i].timeToRun--;
                    
/*                     if (!enemies[i].hasWaited && enemies[i].timeToWait < 3 && enemies[i].timeToRun < 3 && enemies[i].attackedPlayer) {
                        enemies[i].timeToWait = 140;
                    } */

                    if (enemies[i].hasWaited && enemies[i].timeToWait < 3 && enemies[i].timeToRun < 3 && enemies[i].attackedPlayer) {
                        enemies[i].attackedPlayer = 0;
                        enemies[i].hasWaited = 0;
                    }

                    // waiting
                    if (enemies[i].timeToWait > 3 & !enemies[i].hasWaited && enemies[i].attackedPlayer) {
                        enemies[i].isMoving = 0;
                        enemies[i].timeToMove = 0;
                        if (enemies[i].timeToWait < 5) {
                            enemies[i].hasWaited = 1;
                        }

                    } else {
                        //movement ai
                        // going to player
                        if (enemies[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToAttack && !enemies[i].attackedPlayer) {
                            enemies[i].isMoving++;
                            enemies[i].timeToMove = 20 + (4*i);
                            enemies[i].isMoving = 1;
                            if (distanceFromPlayer > 0) {
                                enemies[i].sprite.direction = -1;

                            } else {
                                enemies[i].sprite.direction = 1;
                            }
                        } 

                        //running from player
                        if (enemies[i].timeToWait < 3 && enemies[i].timeToRun > 3 && abs(distanceFromPlayer) < distanceToRun && enemies[i].attackedPlayer) {
                            enemies[i].isMoving++;
                            enemies[i].timeToMove = distanceToRun  +4*i;
                            enemies[i].isMoving = 1;
                            //enemies[i].sprite.direction *= -1;
                            if (distanceFromPlayer > 0) {
                                enemies[i].sprite.direction = 1;
                            } else {
                                enemies[i].sprite.direction = -1;
                            }
                        } else {
                            // starts the waiting logic
                            if (!enemies[i].hasWaited && enemies[i].timeToWait < 3 && enemies[i].timeToRun < 3 && enemies[i].attackedPlayer) {
                                enemies[i].timeToWait = waitingTime;
                            }
                        }
                    }
                }
                break;
        }    
        


        // CHECKING FOR WALL COLLISIONS
        //left
        if (enemies[i].sprite.worldCol - hOff > 0 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * MAPWIDTH
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * MAPWIDTH
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])) {

            enemies[i].againstWallLeft = 1;


        }  else {
            enemies[i].againstWallLeft = 0;            
        }
 

        // right
        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < MAPWIDTH && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * MAPWIDTH +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * MAPWIDTH +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])) {

            enemies[i].againstWallRight = 1;

        } else {
            enemies[i].againstWallRight = 0;            
        }

        if (!(enemies[i].againstWallLeft && enemies[i].againstWallRight)) {
            // JUMPING FUNCTIONALITY
            //enemies[i].timeToMove = 0;
            //enemies[i].movementCounter  = 0;
            //enemies[i].sprite.direction = enemies[i].sprite.direction*-1;


            enemies[i].canJump = 1;
        } else {
            enemies[i].canJump = 0;
        }

        if (enemies[i].canJump && !enemies[i].isJumping && !enemies[i].triedJumping) {
            enemies[i].sprite.worldRow-= 1;
            enemies[i].sprite.velocity = 40;
            enemies[i].isJumping = 1;
            enemies[i].canJump = 0;
            enemies[i].triedJumping = 1;
            //enemies[i].timeToMove = 40;
            //enemies[i].isMoving = 1;
        } else {
            //enemies[i].sprite.direction = enemies[i].sprite.direction*-1;
            //enemies[i].timeToMove = 40;
            //enemies[i].isMoving = 0;
            //enemies[i].triedJumping = 0;
        }

        if (enemies[i].triedJumping && !enemies[i].isJumping) {
            enemies[i].sprite.direction *= -1;
            enemies[i].triedJumping = 0;
       }


        // movement ai
        if (enemies[i].isMoving && !enemies[i].isStationary) {
            //if (!(enemies[i].againstWallLeft || enemies[i].againstWallRight))
                enemies[i].sprite.worldCol += (enemies[i].sprite.direction*enemies[i].sprite.cdel);
            enemies[i].timeToMove--;
            enemies[i].timeToRun--;
            //enemies[i].isMoving = 0;
        }
        if (enemies[i].sprite.worldCol <= 1  || enemies[i].sprite.worldCol > MAPWIDTH - 16) {
            enemies[i].sprite.direction = enemies[i].sprite.direction*-1;
        }

/*         if (enemies[i].timeToRun == 0) {
            //enemies[i].sprite.direction *= -1;
            enemies[i].timeToRun == 0;
            enemies[i].isMoving = 0;
        } */

        if (enemies[i].timeToMove == 0) {
            //enemies[i].sprite.direction *= -1;
            enemies[i].timeToMove == 0;
            enemies[i].isMoving = 0;
        }
        enemies[i].movementCounter++;
    


        if (enemies[i].health <= 0) {
            //enemies[i].sprite.hide = 1;
        }

    }



    animateDungeonViewVillagers();
}

// updates the sprite animations based on direction
void animateDungeonViewVillagers() {
    for (int i = 0; i < TOTALENEMIES; i++) {

        if(!enemies[i].isMoving && !enemies[i].isHostile)
            enemies[i].sprite.aniState = SPRITEFRONT;
        enemies[i].sprite.prevAniState = enemies[i].sprite.aniState;
        enemies[i].sprite.aniState = SPRITEIDLE;

        if(!enemies[i].isStationary && enemies[i].sprite.aniCounter % 20 == 0) {
            enemies[i].sprite.curFrame = (enemies[i].sprite.curFrame + 1) % enemies[i].sprite.numFrames;
        }

        if(enemies[i].sprite.direction == -1 && enemies[i].isMoving)
            enemies[i].sprite.aniState = SPRITELEFT;
        if(enemies[i].sprite.direction == 1 && enemies[i].isMoving)
            enemies[i].sprite.aniState = SPRITERIGHT;

        if (enemies[i].sprite.aniState == SPRITEIDLE) {

            enemies[i].sprite.curFrame = 0;
            enemies[i].sprite.aniCounter = 0;
            enemies[i].sprite.aniState = enemies[i].sprite.prevAniState;
        } else {
            enemies[i].sprite.aniCounter++;
        }
    }

    
}


void drawDungeonView() {

    drawDungeonViewPlayer();

    drawDungeonViewVillagers();

    drawDungeonViewArrows();

    drawDungeonViewHostileArrows();

    if (bossDead) {
        // raining mead
        for (int i = 0; i < 10; i++) {
            if (rainingMeads[i].hide || meadTimerStarted == 0) {
                shadowOAM[127-i].attr0 |= ATTR0_HIDE;
            } else {
                // screen pixel based
                shadowOAM[127-i].attr0 = (ROWMASK & rainingMeads[i].worldRow ) | ATTR0_SQUARE;
                shadowOAM[127-i].attr1 = (COLMASK & rainingMeads[i].worldCol) | ATTR1_SMALL;
                shadowOAM[127-i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(2, 12);
            }
        }

        if (mead.hide) {
            shadowOAM[69].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[69].attr0 = (ROWMASK & mead.worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[69].attr1 = (COLMASK & mead.worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[69].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(2, 12);
        }
    }

    drawButtons(hOff, vOff);

    drawGlobal();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Draw the player
void drawDungeonViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }



}

void drawDungeonViewVillagers() {
    for (int i = 0; i < TOTALENEMIES; i++) {
        if (enemies[i].sprite.hide || enemies[i].health <= 0) {
            shadowOAM[10+i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[10+i].attr0 = (ROWMASK & enemies[i].sprite.worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[10+i].attr1 = (COLMASK & enemies[i].sprite.worldCol - hOff) | ATTR1_SMALL;

            // draws correct sprite for each character type
            switch(enemies[i].type) {
            case NORMIE:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    8 + enemies[i].sprite.aniState * 2, enemies[i].sprite.curFrame * 2);
                break;
            case MERCHANT:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    8 + enemies[i].sprite.aniState * 2, 6 + enemies[i].sprite.curFrame * 2);

                break;
            case DOCTOR:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    8 + enemies[i].sprite.aniState * 2, 6 + enemies[i].sprite.curFrame * 2);

                break;
            case HOSTILE:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    16 + enemies[i].sprite.aniState * 2, enemies[i].sprite.curFrame * 2);
                break;
            case GOBLIN:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(
                    24 + enemies[i].sprite.aniState * 2, enemies[i].sprite.curFrame * 2);
                break;
            case BOSS:
                shadowOAM[10+i].attr0 = (ROWMASK & enemies[i].sprite.worldRow - vOff) | ATTR0_SQUARE;
                shadowOAM[10+i].attr1 = (COLMASK & enemies[i].sprite.worldCol - hOff) | ATTR1_MEDIUM;
                if (!enemies[i].isJumping){
                    if (enemies[i].sprite.direction == 1) {
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(16, 6 + enemies[i].sprite.curFrame * 4);
                    } else {
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(20, 6 + enemies[i].sprite.curFrame * 4);

                    }
                } else {
                    if (enemies[i].sprite.direction == 1) {
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(24, 14);
                    } else {
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(28, 14);
                    }
                }
                break;
            }
        }
    }
}

// drawing the bow and arrows, helper for drawDungeonViewVillagers
void drawDungeonViewHostileArrows() {
    int counter;

    for (int i = 0; i < TOTALENEMIES; i++) {
        int drawBow = 0;
        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
            counter++;
            if (enemies[i].hostileArrows[j].hide) {
                shadowOAM[45+counter].attr0 |= ATTR0_HIDE;
            } else {
                drawBow = 1;
                shadowOAM[45+counter].attr0 = (ROWMASK & enemies[i].hostileArrows[j].worldRow - vOff) | ATTR0_SQUARE;
                shadowOAM[45+counter].attr1 = (COLMASK & enemies[i].hostileArrows[j].worldCol - hOff) | ATTR1_SMALL;
                if (enemies[i].hostileArrows[j].direction == 1) {
                    shadowOAM[45+counter].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 10);
                } else {
                    shadowOAM[45+counter].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 10);
                }
            }

        }
        //draw bow
        if (enemies[i].bow.hide) {
                shadowOAM[20+i].attr0 |= ATTR0_HIDE;
        } else {
            if (enemies[i].isHostile && enemies[i].sprite.direction == 1) {
                shadowOAM[20+i].attr0 = (ROWMASK & enemies[i].bow.worldRow - vOff) | ATTR0_SQUARE;
                shadowOAM[20+i].attr1 = (COLMASK & enemies[i].bow.worldCol - hOff) | ATTR1_SMALL;
                shadowOAM[20+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 8);
            } else {
                shadowOAM[20+i].attr0 = (ROWMASK & enemies[i].bow.worldRow - vOff) | ATTR0_SQUARE;
                shadowOAM[20+i].attr1 = (COLMASK & enemies[i].bow.worldCol - hOff) | ATTR1_SMALL;
                shadowOAM[20+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 8);
            }        
        }
    }
}

// drawing the bow and arrows
void drawDungeonViewArrows() {
    int drawBow = 0;
    for (int i = 0; i < TOTALSCREENARROWS; i++) {
        if (arrows[i].hide) {
            shadowOAM[35+i].attr0 |= ATTR0_HIDE;
        } else {
            drawBow = 1;
            shadowOAM[35+i].attr0 = (ROWMASK & arrows[i].worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[35+i].attr1 = (COLMASK & arrows[i].worldCol - hOff) | ATTR1_SMALL;
            if (arrows[i].direction == 1) {
                shadowOAM[35+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 10);
            } else {
                shadowOAM[35+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 10);
            }
        }
    }

    //draw bow
    if (bow.hide) {
            shadowOAM[9].attr0 |= ATTR0_HIDE;
    } else {
        if (player.direction == 1) {
            shadowOAM[9].attr0 = (ROWMASK & bow.worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[9].attr1 = (COLMASK & bow.worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[9].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 8);
        } else {
            shadowOAM[9].attr0 = (ROWMASK & bow.worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[9].attr1 = (COLMASK & bow.worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[9].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 8);
        }        
    }
}