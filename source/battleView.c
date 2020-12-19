#include "myLib.h"
#include "text.h"
#include "title.h"
#include "battleView.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "background.h"
#include "townCollision.h"
//#include "town1.h"
//#include "collisionBattle1.h"
#include "global.h"

#include "time.h"


#include "textViewBackground.h"


// backgrounds
/* #include "snowGround.h"
#include "snowSky.h"
#include "mountainGround.h"
#include  "mountainSky.h"
#include "sandGround.h"
#include "sandSky.h"
#include "walls.h" */

// sounds
#include "sound.h"
#include "arrowShot.h"
#include "enemyDie.h"
#include "enemyHit.h"
#include "playerHit.h"
#include "walking.h"
#include "playerJump.h"
#include "menuActivate.h"

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

int floorRow = 16;

int savedWorldRow;
int savedWorldCol;
int savedvOff;
int savedhOff;

int playerTookDamage;
int damageTimer;
int playerIsMoving;
int playerShootCooldown;


int enemiesDefeated;
int battleValue;
int randomSeed;

int inMode4;

char buffer[20];

int totalEnemies;

VILLAGER enemies[4];



// extern objects
ANISPRITE player;
ANISPRITE arrows[TOTALSCREENARROWS];
ANISPRITE bow;
//int showBow;


// initializes game
void initBattleView() {

    srand(playerHealth*(playerMoney+5));

    //totalEnemies = ( rand() % 3) + 5;
    totalEnemies = 3;
    // moved to state switch
    if ((rand() % 3) + 3 < 3) {
        totalEnemies = 2;
        
    }

    if ((rand() % 3) + 3 < 1) {
        totalEnemies = 4;
        
    }

    textViewChoice = -1;

    srand(playerHealth*(playerMoney+5)*(player.worldCol+5));

    battleValue = ( rand() % 3) + 3;

    enemiesDefeated = 0;
    battleViewDefeated = 0;


    vOff = 0;
    hOff = 0;

/*     REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff; */
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG3VOFF = vOff;
    REG_BG3HOFF = hOff;


    initBattleViewPlayer();
    initBattleViewButtons();
    initBattleViewArrows();
    initBattleViewEnemies();
}


// initializes player
void initBattleViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = SCREENHEIGHT - 33;
    player.worldCol = 40;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;


}

void initBattleViewEnemies() {


    srand(playerHealth*(playerMoney+5));
    int random = rand()%totalEnemies;

/*     for (int i = 0; i < totalEnemies; i++) {
        enemies[0].type = GOBLIN;

    }
    for (int i = 0; i < random; i++) {
        //enemies[0].type = HOSTILE;
    } */

    for(int i = 0; i < totalEnemies; i++) {
        // locations
        enemies[i].sprite.worldRow = SCREENHEIGHT - 40;
        enemies[i].sprite.worldCol = 200 + (40*i);
        if (enemies[i].sprite.worldCol > MAPWIDTH)
            enemies[i].sprite.worldCol = 260;

        enemies[i].type = GOBLIN;


        enemies[i].doesWander = 1;


        enemies[i].sprite.width = 16;
        enemies[i].sprite.height = 16;
        enemies[i].sprite.rdel = 1;
        enemies[i].sprite.cdel = 1;

        enemies[i].sprite.aniCounter = 0;
        enemies[i].sprite.curFrame = 0;
        enemies[i].sprite.numFrames = 3;

        // randomizes the direction
        enemies[i].sprite.direction = 1;
        enemies[i].isMoving = 0;
        enemies[i].isHostile = 1;

        enemies[i].sprite.hide = 0;

        enemies[i].moneyDrop = 1;
        


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

            // ended up cutting the skeleton
            case(SKELETON):
                enemies[i].sprite.height = 32;

                enemies[i].health = 5; 

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
            case(GOBLIN):
                    //enemies[i].doesWander = 1;
                enemies[i].health = 3; 
                enemies[i].waitingTime = 10 + 5*i;
                enemies[i].distanceToAttack = 0;
                enemies[i].distanceToRun = 50 + 5*i;

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

void initBattleViewArrows() {
    for (int i = 0; i < TOTALSCREENARROWS; i++) {
        arrows[i].width = 16;
        arrows[i].height = 16;
        arrows[i].rdel = 1;
        arrows[i].cdel = 6;
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
void initBattleViewButtons() {
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

void resumeBattleView() {

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


// updates data for gamez d
void updateBattleView() {
    randomSeed++;

    if (!enemiesDefeated){    
        playerTookDamage = 0;



        updateBattleViewPlayer();
        updateBattleViewVillagers();
        updateBattleViewArrows();
        updateBattleViewHostileArrows();


        enemiesDefeated = 1;
        for (int i = 0; i < totalEnemies; i++) {
            if (enemies[i].health > 0) {
                enemiesDefeated = 0;
                break;
            }
        }

        if (enemiesDefeated) {
            drawEndScreen();
        }

        // was having mega issues with player taking way too much damage at once, this gives it a cool down
        if (damageTimer > 0) {
            damageTimer--;
        }
        if (playerTookDamage && damageTimer < 1) {
            playerHealth -= 1;
            playerTookDamage = 0;
            damageTimer = 30;
            playSoundB(playerHit_data, playerHit_length, 0);
        }
    } else {
        if (BUTTON_PRESSED(BUTTON_A)) {
            playerMoney += battleValue;
            inMode4 = 0;
            battleViewDefeated = 1;
        }
    }
}

// Handle every-frame actions of the player
void updateBattleViewPlayer() {

    initBattleViewButtons();

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;

    playerIsMoving = 0;

    int canJump = 1;

    if ((player.worldRow - vOff + player.height - (int) round(player.velocity*0.1) < SCREENHEIGHT - floorRow)) {

        player.velocity = (int) player.velocity + (GRAVITY*.08);
        canJump = 0;

        // gravity arithmetic
        player.worldRow = (int) player.worldRow - round(player.velocity*.1);
        aButton.worldRow = (int) aButton.worldRow - round(player.velocity*.1);
        bButton.worldRow = (int) bButton.worldRow - round(player.velocity*.1);

    } else {
        canJump = 1;
        player.velocity = 0;

    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        playerIsMoving = 1;
        player.direction = -1;
        if (player.worldCol - hOff > 0 && (int) (player.worldRow + player.height- round(player.velocity*0.1) > floorRow)) {

            player.worldCol -= player.cdel;
            aButton.worldCol -= player.rdel;
            bButton.worldCol -= player.rdel;

            if (hOff > 0 && player.worldCol - hOff < SCREENWIDTH / 2) {
                hOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        playerIsMoving = 1;
        player.direction = 1;
        if (player.worldCol - hOff + player.width < SCREENWIDTH && (int) (player.worldRow + player.height- round(player.velocity*0.1) > floorRow)) {

            player.worldCol += player.cdel;
            aButton.worldCol += player.rdel;
            bButton.worldCol += player.rdel;


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
        player.worldRow--;
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
    for (int i = 0; i < totalEnemies; i++) {
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

    animateBattleViewPlayer();
}

// Handle player animation states
void animateBattleViewPlayer() {

    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;

    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

/*     if(BUTTON_HELD(BUTTON_UP))
        player.aniState = SPRITEBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        player.aniState = SPRITEFRONT; */
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


void updateBattleViewArrows() {

    // player arrows
    bow.hide = 1;
    for (int i = 0; i < TOTALSCREENARROWS; i++) {


        // TODO - handling collision with a hostile villager
        // if the villager is hostile, arrows the player shoots will do damage
        // can't kill peaceful villagers tho
        /* for (int i = 0; i < totalEnemies; i++) {
            if (enemies[i].isHostile) {
                if (arrows[i].hide == 0 && collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width,
                    enemies[i].sprite.height, arrows[i].worldCol, arrows[i].worldRow, arrows[i].width, arrows[i].height)) {
                        enemies[i].health--;
                        arrows[i].hide = 1;
                        if (enemies[i].health <= 0) {
                            enemies[i].sprite.hide = 1;
                        }
                    
                }
            
            
            }
        } */

        // collision map and screen edge destruction handling
        if ((arrows[i].worldRow - vOff + arrows[i].height - (int) round(arrows[i].velocity*0.1) < SCREENHEIGHT - floorRow + 8)) {

                // gravity arithmetic
                arrows[i].worldRow = (int) arrows[i].worldRow - round(arrows[i].velocity*.1);
                // hides bow if arrow is being shot
                bow.hide = 0;
                if (arrows[i].direction == 1) {
                    //arrows[i].worldCol+= arrows[i].cdel; //= (int) arrows[i].worldCol + round(arrows[i].horVelocity*.1);
                    arrows[i].worldCol = (int) arrows[i].worldCol + round(arrows[i].horVelocity*.1);
                } else {
                    //arrows[i].worldCol-= arrows[i].cdel; //= (int) arrows[i].worldCol - round(arrows[i].horVelocity*.1);                   
                    arrows[i].worldCol = (int) arrows[i].worldCol - round(arrows[i].horVelocity*.1);                   
                }



                arrows[i].velocity = (int) arrows[i].velocity + (GRAVITY*.05);

        } else {
            arrows[i].velocity = 0;
            arrows[i].horVelocity = 0;
            arrows[i].hide = 1;
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


void updateBattleViewHostileArrows() {
    int playerTookDamage = 0;
    for (int i = 0; i < totalEnemies; i++) {
        // player arrows
        enemies[i].bow.hide = 1;

        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {

            // TODO - collision w player
/*             if (enemies[i].isHostile) {
                if (enemies[i].hostileArrows[j].hide == 0 && collision(player.worldCol, player.worldRow, player.width, player.height,enemies[i].hostileArrows[j].worldCol,
                    enemies[i].hostileArrows[j].worldRow, enemies[i].hostileArrows[j].width, enemies[i].hostileArrows[j].height)) {
                        enemies[i].hostileArrows[j].hide = 1;   
                        playerTookDamage = 1;
                }
            } */

            // collision map and screen edge destruction handling
            if ((enemies[i].hostileArrows[j].worldRow - vOff + enemies[i].hostileArrows[j].height - (int) round(enemies[i].hostileArrows[j].velocity*0.1) < SCREENHEIGHT - floorRow + 8)) {

                    // gravity arithmetic
                    enemies[i].hostileArrows[j].worldRow = (int) enemies[i].hostileArrows[j].worldRow - round(enemies[i].hostileArrows[j].velocity*.1);
                    // hides bow if arrow is being shot
                    enemies[i].bow.hide = 0;
                    if (enemies[i].sprite.direction == 1) {
                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol + round(enemies[i].hostileArrows[j].horVelocity*.1);
                    } else {
                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol - round(enemies[i].hostileArrows[j].horVelocity*.1);                   
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

/*     if (playerTookDamage) {
        playerHealth--;

    } */
    
}

// villager ai
void updateBattleViewVillagers() {
    int willShoot;

    for (int i = 0; i < totalEnemies; i++) {
        int showButton = 0;

        int oldWorldRow = enemies[i].sprite.worldRow;
        int oldWorldCol = enemies[i].sprite.worldCol;

        // collision map and screen edge destruction handling
        if ((enemies[i].sprite.worldRow - vOff + enemies[i].sprite.height - (int) round(enemies[i].sprite.velocity*0.1) < SCREENHEIGHT - floorRow)) {


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
        if (enemies[i].sprite.worldCol - hOff > 0 ) {

            enemies[i].againstWallLeft = 0;

        }  else {
            enemies[i].againstWallLeft = 1;            
        }
 

        // right
        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < MAPWIDTH) {

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
        if (abs(enemies[i].sprite.worldRow- player.worldRow) < 50 && abs(enemies[i].sprite.worldCol - player.worldCol) < 140) {
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
                enemies[i].timeToMove = 70 + (4*i);
                enemies[i].isMoving = 1;
                //currentTown.villagers[i].sprite.direction = -1;

                if (rand() % 100 > 60) {
                    enemies[i].sprite.direction *= -1;
                }
            }

            for (int j = 0; j < totalEnemies; j++) {
                if (i != j) {
                    if (collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width, enemies[i].sprite.height,
                        enemies[j].sprite.worldCol, enemies[j].sprite.worldRow, enemies[j].sprite.width, enemies[j].sprite.height) && !enemies[i].isMoving) {
                            enemies[i].timeToMove =  55 - (2*i);
                            enemies[i].isMoving = 1;  
                            if (rand() % 100 > 60) {
                                //enemies[i].sprite.direction *= -1;
                            }                      
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
                    //playerMoney += enemies[i].moneyDrop;
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


/*                     int waitingTime = 10 + 5*i;
                    int distanceToAttack = 0;
                    int distanceToRun = 50 + 5*i; */
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
                        if (enemies[i].timeToWait < 3 && abs(distanceFromPlayer) > enemies[i].distanceToAttack && !enemies[i].attackedPlayer) {
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
                        if (enemies[i].timeToWait < 3 && enemies[i].timeToRun > 3 && abs(distanceFromPlayer) < enemies[i].distanceToRun && enemies[i].attackedPlayer) {
                            enemies[i].isMoving++;
                            //srand(player.worldCol + 5);
                            enemies[i].timeToMove = enemies[i].distanceToRun  +(rand()%5);
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
                                enemies[i].timeToWait = enemies[i].waitingTime + rand()%50;
                            }
                        }
                    }
                }
                break;
        }    
        


        // CHECKING FOR WALL COLLISIONS
        //left
        if (enemies[i].sprite.worldCol - hOff > 0) {

            enemies[i].againstWallLeft = 1;


        }  else {
            enemies[i].againstWallLeft = 0;            
        }
 

        // right
        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < SCREENWIDTH) {

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
        if (enemies[i].isMoving) {
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


    animateBattleViewVillagers();
}

// updates the sprite animations based on direction
void animateBattleViewVillagers() {
    for (int i = 0; i < totalEnemies; i++) {

        if(!enemies[i].isMoving && !enemies[i].isHostile)
            enemies[i].sprite.aniState = SPRITEFRONT;
        enemies[i].sprite.prevAniState = enemies[i].sprite.aniState;
        enemies[i].sprite.aniState = SPRITEIDLE;

        if(enemies[i].sprite.aniCounter % 20 == 0) {
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




void drawBattleView() {

    if (!enemiesDefeated) {
        drawBattleViewPlayer();

        drawBattleViewVillagers();

        drawBattleViewArrows();

        drawBattleViewHostileArrows();

        drawButtons(hOff, vOff);

        drawGlobal();

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);

        // parallax
        REG_BG0HOFF = hOff;
        REG_BG1HOFF = hOff;
        REG_BG2HOFF = hOff/2;

    } else {
        waitForVBlank();
    }


}

// this was causing a ton of pain so i moved this transtion into battleview
void drawEndScreen() {
    inMode4 = 1;
    hideSprites();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    DMANow(3, textViewBackgroundPal, PALETTE, 256);
    drawFullscreenImage4(textViewBackgroundBitmap);

    sprintf(buffer, "You gained %d gold.", battleValue);

    // created a white color in the pallette, up to change later (15)
    drawString4(16, 16, "You defeated the attack!", 15);
    drawString4(16, 16*2, buffer, 15);

    drawString4(11*16 + 2, 109, "Leave", 15);
    drawString4(11*16 + 2, 109 + 24, "", 15);

    waitForVBlank();
    flipPage();
}

// Draw the player
void drawBattleViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }



}

void drawBattleViewVillagers() {
    for (int i = 0; i < totalEnemies; i++) {
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

            case SKELETON:
                shadowOAM[10+i].attr0 = (ROWMASK & enemies[i].sprite.worldRow - vOff) | ATTR0_TALL;
                shadowOAM[10+i].attr1 = (COLMASK & enemies[i].sprite.worldCol - hOff) | ATTR1_SMALL;
                if (enemies[i].sprite.direction == 1) {
                    shadowOAM[10+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(
                        26 + enemies[i].sprite.curFrame * 2 , 6 + enemies[i].sprite.aniState * 2);
                } else {
                    shadowOAM[10+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(
                        26 + enemies[i].sprite.curFrame * 2 , 10 + enemies[i].sprite.aniState * 2);
                }

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

// drawing the bow and arrows, helper for drawBattleViewVillagers
void drawBattleViewHostileArrows() {
    for (int i = 0; i < totalEnemies; i++) {


        //if (enemies[i].sprite.hide == 0 && enemies[i].isHostile) {
            int drawBow = 0;
            for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
                if (enemies[i].hostileArrows[j].hide) {
                    shadowOAM[45+i*j].attr0 |= ATTR0_HIDE;
                } else {
                    drawBow = 1;
                    shadowOAM[45+i*j].attr0 = (ROWMASK & enemies[i].hostileArrows[j].worldRow - vOff) | ATTR0_SQUARE;
                    shadowOAM[45+i*j].attr1 = (COLMASK & enemies[i].hostileArrows[j].worldCol - hOff) | ATTR1_SMALL;
                    if (enemies[i].hostileArrows[j].direction == 1) {
                        shadowOAM[45+i*j].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[45+i*j].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 10);
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
            
        //}

    }
    
}

// drawing the bow and arrows
void drawBattleViewArrows() {
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
    if (bow.hide || drawBow == 0) {
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