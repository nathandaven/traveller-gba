#include "myLib.h"
#include "text.h"
#include "text.h"
#include "title.h"
#include "townView.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "background.h"
#include "townCollision.h"
//#include "town1.h"
//#include "collisionTown1.h"
#include "global.h"
#include <math.h>
#include "time.h"

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

int playerShootCooldown;

int savedWorldRow;
int savedWorldCol;
int savedvOff;
int savedhOff;

int playerTookDamage;
int damageTimer;
int playerIsMoving;
int playerShootCooldown;

char villagerNames[8][10] = {"Farquad:", "Linus:", "Dovakihn:", "Fredrick:", "Salvador:", "Bungus:", "Leonardo:", "George:"};
char villagerGreetings[6][20] = {
    "I took an arrow in the knee!\0", 
    "How do you do on this hot day?\0", 
    "Happen to seen my sweet roll? \0", 
    "Need me a horse.... \0", 
    "*groans*\0"
    };


char storedText[41];

VILLAGER villagers[TOTALVILLAGERS];

// story helper flags
int hasTalkedToQuestGiver;



// extern objects
ANISPRITE player;
ANISPRITE arrows[TOTALSCREENARROWS];
ANISPRITE bow;
//int showBow;


// sets up the town based on the struct
void setUpTown(TOWN town) {
    

}

// initializes game
void initTownView() {

    //textViewChoice = -1;

    // moved to state switch

/*     if (cheatActive) {
        currentTown.villagerCount = 8;
    } */

    vOff = 0;
    hOff = 0;

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG3VOFF = vOff;
    REG_BG3HOFF = hOff;


    initTownViewPlayer();
    initTownViewButtons();
    initTownViewArrows();
    initTownViewVillagers();
}


// initializes player
void initTownViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = SCREENHEIGHT - 33;
    player.worldCol = 20;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;


}

void resetTownView() {
    for (int i = 0; i < TOTALVILLAGERS; i++) {
        VILLAGER pain;
        villagers[i] = pain;
    }

    playerShootCooldown = 0;

    savedWorldRow = 0;
    savedWorldCol = 0;
    savedvOff = 0;
    savedhOff = 0;

    playerTookDamage = 0;
    damageTimer = 0;
    playerIsMoving = 0;
    playerShootCooldown = 0;
}

void initTownViewVillagers() {

    // town graphics

        // per town

        if (currentTown.index < 3)
            villagers[0].type = DOCTOR;
        else
            villagers[0].type = NORMIE;

        if (currentTown.questTownType == BOUNTYDEST && bountyStarted && !bountyKilled) {
                villagers[1].type = HOSTILE;
                villagers[1].doesWander = 1;

                }        
        else {
            villagers[1].type = NORMIE;
            villagers[1].doesWander = 1;
        }

        if (currentTown.index == 0) {
            villagers[3].type = QUESTGIVER;
            villagers[3].questType = BOWGIVER;
            villagers[3].doesWander = 0;
            villagers[3].sprite.worldCol = 140;
        }

        //villagers[3].merchantType = BOWUPGRADE;
        //villagers[3].type = MERCHANT;

        if (currentTown.questTownType != NONE) {
            villagers[2].type = QUESTGIVER;
            villagers[2].questType = currentTown.questTownType;
        } else
            villagers[2].type = NORMIE;

        
        if (currentTown.villagerCount  > 5) {            
            villagers[3].type = MERCHANT;

            if (currentTown.merchantTownType == BOWUPGRADE) {
                villagers[3].merchantType = BOWUPGRADE;
                villagers[3].doesWander = 0;
                villagers[3].sprite.worldCol = 152; 
            }
            if (currentTown.merchantTownType == KEY) {
                villagers[3].merchantType = KEY;
            }
        }

        if (!currentTown.enemyDefeated) {
            villagers[1].health = 3;
            villagers[1].sprite.hide = 0;
            
        } else {
            villagers[1].sprite.hide = 1;
        }




        for (int i = 0; i < currentTown.villagerCount; i++) {
            srand(100*i + time(NULL));

            if (cheatActive) {
                villagers[i].isHostile = 1;
                villagers[i].type = HOSTILE;
                villagers[i].health = 3;
            }

            villagers[i].sprite.width = 16;
            villagers[i].sprite.height = 16;
            villagers[i].sprite.rdel = 1;
            villagers[i].sprite.cdel = 1;
            villagers[i].sprite.worldRow = SCREENHEIGHT - currentTown.floorRow - 16;//SCREENHEIGHT - towns[i].floorRow - 16;
            villagers[i].sprite.worldCol = 150 + ((500/(currentTown.villagerCount+1))*i);//256 + (120-(rand()%120));
            villagers[i].sprite.aniCounter = 0;
            villagers[i].sprite.curFrame = 0;
            villagers[i].sprite.numFrames = 3;

            // randomizes the direction
            villagers[i].sprite.direction = 1;
            villagers[i].isMoving = 0;
            villagers[i].isHostile = 0;

            villagers[i].health = 3;

            if (villagers[i].sprite.worldCol > MAPWIDTH-20) {
                villagers[i].sprite.worldCol = 500 - (20*i);
            }

            //chat data
    /*         villagers[i].name = villagerNames[i];
            villagers[i].greetingText = villagerGreetings[i];
            villagers[i].playerText = "";
            villagers[i].optionA = "";
            villagers[i].optionB = "Leave"; */

            srand(player.worldCol + playerMoney + dungeonKeys + currentTown.villagerCount + playerHealth + i);
            villagers[i].randomSpeech = ( rand() % 6);

            // enables blood thirsty mode and player can kill all villagers


            switch(villagers[i].type) {
                case NORMIE:
                    villagers[i].doesWander = 1;
                    break;
                case MERCHANT:
                    villagers[i].doesWander = 1;
                    //villagers[i].sprite.worldCol = 180;
                    //villagers[i].sprite.worldRow = SCREENHEIGHT - 35;
                
                    //villagers[i].sprite.worldCol = 250;//256 + (120-(rand()%120));
                    break;
                case DOCTOR:
                    villagers[i].doesWander = 1;
                    //villagers[i].sprite.worldCol = 114;
                    //villagers[i].sprite.worldRow = SCREENHEIGHT - towns[i].floorRow - 16;

                    //villagers[i].sprite.worldRow = SCREENHEIGHT - 35;
                
                    //villagers[i].sprite.worldCol = 250;//256 + (120-(rand()%120));
                    break;
                case QUESTGIVER:
                    ///villagers[i].sprite.worldCol = 240;
                    villagers[i].doesWander = 1;

                    switch  (currentTown.questTownType) {
                        case BOWGIVER:

                            break;
                        case BOUNTY:
                            villagers[i].doesWander = 0;

                            villagers[i].sprite.worldCol = 300;
                            break;

                    }


                    break;
                case HOSTILE:

                    //villagers[i].doesWander = 0;
                    //villagers[i].sprite.worldCol = 440;
                    //villagers[i].sprite.worldRow = SCREENHEIGHT - 33;
                    villagers[i].health = 3;


                    villagers[i].doesWander = 1;


                    for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
                        villagers[i].hostileArrows[j].width = 16;
                        villagers[i].hostileArrows[j].height = 16;
                        villagers[i].hostileArrows[j].rdel = 1;
                        villagers[i].hostileArrows[j].cdel = 1;
                        villagers[i].hostileArrows[j].worldRow = villagers[i].sprite.worldRow;
                        villagers[i].hostileArrows[j].worldCol = villagers[i].sprite.worldCol;
                        villagers[i].hostileArrows[j].hide = 1;
                        villagers[i].hostileArrows[j].direction = 1;

                    }

                    // bow
                    villagers[i].bow.width = 16;
                    villagers[i].bow.height = 16;
                    villagers[i].bow.rdel = 1;
                    villagers[i].bow.cdel = 1;
                    villagers[i].bow.worldRow = villagers[i].sprite.worldRow;
                    villagers[i].bow.worldCol = villagers[i].sprite.worldCol;
                    villagers[i].bow.hide = 1;
                    break;
            }


        }

        if (currentTown.index == 0) {
            villagers[3].doesWander = 0;
            villagers[3].sprite.worldCol = 140;
        }
        if (currentTown.villagerCount  > 5) {            

            if (currentTown.merchantTownType == BOWUPGRADE) {
                villagers[3].doesWander = 0;
                villagers[3].sprite.worldCol = 152; 
            }
            if (currentTown.merchantTownType == KEY) {
                villagers[3].merchantType = KEY;
            }
        }
}

void initTownViewArrows() {
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
void initTownViewButtons() {
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

void resumeTownView() {

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
void updateTownView() {
    playerTookDamage = 0;


    updateTownViewPlayer();
    updateTownViewVillagers();
    updateTownViewArrows();
    updateTownViewHostileArrows();

    // was having mega issues with player taking way too much damage at once, this gives it a cool down
    if (damageTimer > 0) {
        damageTimer--;
    }
    if (playerTookDamage && damageTimer < 1) {
        playerHealth -= 1;
        playerTookDamage = 0;
        damageTimer = 80;
        playSoundB(playerHit_data, playerHit_length, 0);
    }

}

// Handle every-frame actions of the player
void updateTownViewPlayer() {
    initTownViewButtons();

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;

    playerIsMoving = 0;

    int canJump = 1;

/*     if ((player.worldRow - vOff > 0 && (currentTown.buildingsCollisionMap[(player.worldRow - player.rdel) * MAPWIDTH + player.worldCol])
        && (currentTown.buildingsCollisionMap[(player.worldRow - player.rdel) * MAPWIDTH +
            (player.worldCol + player.width - player.cdel)]))) {

        //player.worldRow -= player.rdel;

        if (vOff > 0 && player.worldRow - vOff < SCREENHEIGHT / 2) {
            vOff--;
        }
    } */
    if ((player.worldRow - vOff + player.height - (int) round(player.velocity*0.1) < SCREENHEIGHT - currentTown.floorRow)) {

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
        if (player.worldCol - hOff > 0 && (int) (player.worldRow + player.height- round(player.velocity*0.1) > currentTown.floorRow)) {

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
        if (player.worldCol - hOff + player.width < SCREENWIDTH && (int) (player.worldRow + player.height- round(player.velocity*0.1) > currentTown.floorRow)) {

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
    

    // TODO - talking to villagers

    aButton.hide = 1;
    for (int i = 0; i < currentTown.villagerCount; i++) {
        // player arrows
        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
            villagers[i].bow.hide = 1;

            // TODO - collision w player
            if (villagers[i].hostileArrows[j].hide == 0) {
                if (villagers[i].hostileArrows[j].hide == 0 && collision(villagers[i].hostileArrows[j].worldCol, villagers[i].hostileArrows[j].worldRow,
                    villagers[i].hostileArrows[j].width, villagers[i].hostileArrows[j].height, player.worldCol, player.worldRow, player.width, player.height)) {
                        villagers[i].hostileArrows[j].hide = 1;   
                        playerTookDamage = 1;
                        //break;
                }
            }
        } 

        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width, villagers[i].sprite.height)) {
            
            if (!villagers[i].isHostile) {
                aButton.hide = 0;
            }

            switch (villagers[i].type) {
                case NORMIE:

                    //"I took an arrow in the knee!\0", 
                    //"How do you do on this hot day?\0", 
                    //"Happen to seen my sweet roll? \0", 
                    //"Need me a horse.... \0", 
                    //"*groans*\0"

                    if (BUTTON_PRESSED(BUTTON_A)) {
                        playSoundB(menuActivate_data, menuActivate_length, 0);
                        if (i == 0) {
                            goToTextView("", "I took an arrow in the knee!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 1) {
                            goToTextView("", "How do you do on this hot day?", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 2) {
                            goToTextView("", "Happen to see my sweet roll?", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 3) {
                            goToTextView("", "Legend says 2020 will be hexed!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }else if (i== 4) {
                            goToTextView("", "No lollygaggin!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }else if (i == 5) {
                            goToTextView("", "Love me a good Nord...", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else  {
                            goToTextView("", "*groans*", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }
                    }
                    textViewChoice = -1;
                    break;
            case QUESTGIVER:
                switch  (villagers[i].questType) {
                    case BOWGIVER:

                        if (!playerHasBow && BUTTON_PRESSED(BUTTON_A)) {
                            playSoundB(menuActivate_data, menuActivate_length, 0);
                            hasTalkedToQuestGiver = 1;
                            goToTextView("", "Hey there traveller!", "Old Man", "Yes?", "Leave");
                        }

                        if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                            hasTalkedToQuestGiver = 2;
    
                            goToTextView("Take the bow?", "You'll need this for your travels.", "Old Man", "Take", "Leave");

                        }
                        if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                            hasTalkedToQuestGiver = 3;
                            playerHasBow = 1;
                            hasTalkedToQuestGiver = 0;
                            textViewChoice = -1;
    
                            goToTextView("Tip: press B to shoot!", "Hopefully you'll make use of it.", "Old Man", "", "Leave");

                        }
                        if (textViewChoice == 0 && hasTalkedToQuestGiver == 2) {
                            hasTalkedToQuestGiver = 0;
                            textViewChoice = -1;
                            goToTextView("", "Fine! Good riddance.", "Old Man", "", "Leave");

                        }




                        if (BUTTON_PRESSED(BUTTON_A) && playerHasBow)
                            goToTextView("", "Good luck out there!", "Old Man", "", "Leave");


                        break;
                    case BOUNTY:


                        // interactions
                        if (!bountyCompleted) {
                            if (!bountyStarted) {
                                if (BUTTON_PRESSED(BUTTON_A)) {
                                    hasTalkedToQuestGiver = 1;
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "I have a quest.", "Debt Collector", "Yes?", "Leave");
                                }

                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                    hasTalkedToQuestGiver = 2;
                                    goToTextView("", "I need a man killed.", "Debt Collector", "More", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                                    hasTalkedToQuestGiver = 3;
                                    goToTextView("Accept the quest?", "He's in the sand outskirts.", "Debt Collector", "Accept", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 3) {
                                    hasTalkedToQuestGiver = 0;
                                    bountyStarted = 1;

                                    goToTextView("Quest accepted.", "Counting on you traveller!", "Debt Collector", "", "Leave");
                                }

                            } else {
                                if (bountyKilled) {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        bountyCompleted = 1;
                                        playerMoney += 10;
                                        dungeonKeys++;
                                        goToTextView("Earned 10 gold & a key!", "Thank you for your services.", "Debt Collector", "Take", "");
                                    }
                                } else {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Counting on you traveller!", "Debt Collector", "", "Leave");
                                    }
                                }

                            }

                        } else {
                            if (BUTTON_PRESSED(BUTTON_A)) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "I owe you one traveller.", "Debt Collector", "", "Leave");
                                }
                        }
                        break;
                    case LETTERGIVER:

                        if (!letterCompleted) {
                            if (!letterStarted) {
                                if (BUTTON_PRESSED(BUTTON_A)) {
                                    hasTalkedToQuestGiver = 1;
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "I don't know what to do!", "Sister", "What?", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                    hasTalkedToQuestGiver = 2;
                                    goToTextView("", "I need a letter to my brother NOW!", "Sister", "Help", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                                    hasTalkedToQuestGiver = 3;
                                    goToTextView("Accept the quest?", "He's in the small east town.", "Sister", "Accept", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 3) {
                                    hasTalkedToQuestGiver = 0;
                                    letterStarted = 1;
                                    goToTextView("Quest accepted.", "Oh boy! Thank you so much!", "Sister", "", "Leave");
                                }

                            } else {
                                if (letterRecieved) {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        letterCompleted = 1;
                                        dungeonKeys++;
                                        goToTextView("Earned a key!", "Thank you! Take this.", "Sister", "Take", "");
                                    }
                                } else {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Has he gotten it yet??", "Sister", "", "Leave");
                                    }
                                }
                            }

                        } else {
                            if (BUTTON_PRESSED(BUTTON_A)) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "You're the best!!", "Sister", "", "Leave");
                                }
                        }
                        break;
                    case LETTERDEST:

                        if (letterStarted) {
                            if (!letterCompleted) {
                                if (!letterRecieved) {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        playerMoney += 5;
                                        hasTalkedToQuestGiver = 1;

                                        goToTextView("Earned 5 gold!", "Thank you! I don't have much but.", "Brother", "Take", "");

                                    }
                                    if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                        hasTalkedToQuestGiver = 0;
                                        letterRecieved = 1;
                                        goToTextView("", "Can you take this back to her?", "Brother", "Yes!", "");
                                    }
                                } else {
                                    if (BUTTON_PRESSED(BUTTON_A)) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Again, thank you so much.", "Brother", "", "Leave");
                                    }
                                }

                            } else {
                                if (BUTTON_PRESSED(BUTTON_A)) {
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "You're the best!!", "Brother", "", "Leave");
                                    }
                            }
                        } else {
                            if (BUTTON_PRESSED(BUTTON_A)) {
                                goToTextView("", "Do I know you?", "Brother", "", "Leave");
                            }
                        }

                        break;
                }      
                textViewChoice = -1;
                break;
            case MERCHANT:
                switch (villagers[i].merchantType) {
                    case BOWUPGRADE:
                        if (BUTTON_PRESSED(BUTTON_A)) {
                            playSoundB(menuActivate_data, menuActivate_length, 0);
                            goToMerchantView("", "I can upgrade your bow for 15 gold!", "Weaponsmith", "Upgrade", "Leave");
                        }

                        if (textViewChoice == 1) {
                        /* goToTextView("this worked if u see this", villagers[i].greetingText,
                            villagers[i].name, villagers[i].optionA, villagers[i].optionB); */
                            if (playerMoney >= 15) {
                                playerShootSpeed += 10;
                                playerMoney -= 15;
                                goToMerchantView("Bow speed increased.", "Your bow should feel brand new!", "Shopkeep", "", "Leave");
                            } else {
                                goToTextView("Not enough money!", "I can upgrade your bow for 15 gold!", "Weaponsmith", "", "Leave");
                            }
                        }   
                        break;
                    case KEY:

                        // interactions

                        if (!boughtKey) {
                            if (BUTTON_PRESSED(BUTTON_A)) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToMerchantView("Buy key for 10 gold?", "I found this relic in the sand.", "Scavenger", "Buy", "Leave");
                            }
                            if (textViewChoice == 1) {
                            /* goToTextView("this worked if u see this", villagers[i].greetingText,
                                villagers[i].name, villagers[i].optionA, villagers[i].optionB); */
                                if (playerMoney >= 10) {
                                    dungeonKeys++;
                                    boughtKey = 1;
                                    playerMoney -= 10;
                                    goToMerchantView("Key found!", "Hope you can use for that!", "Scavenger", "", "Leave");
                                } else {
                                    goToTextView("Not enough money!", "I found this relic in the sand.", "Scavenger", "", "Leave");
                                }
                            }   
                        } else {
                            if (BUTTON_PRESSED(BUTTON_A)) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "How's the quest coming along?", "Scavenger", "", "Leave");
                            }
                        }

                        break;
                }
                textViewChoice = -1;
                break;
            case DOCTOR:
                if (BUTTON_PRESSED(BUTTON_A)) {
                    playSoundB(menuActivate_data, menuActivate_length, 0);
                    goToTextView("Price: 3 coin", "Are you feeling unwell?", "Doctor", "Heal up", "Leave");
                }
                if (textViewChoice == 1) {
                /* goToTextView("this worked if u see this", villagers[i].greetingText,
                    villagers[i].name, villagers[i].optionA, villagers[i].optionB); */
                    if (playerMoney >= 3) {
                        playerHealth = 5;
                        playerMoney -= 3;
                        goToTextView("That's the stuff.", "Give yoruself a break next time!", "Doctor", "", "Leave");
                    } else {
                        goToTextView("Not enough money!", "Are you feeling unwell?", "Doctor", "", "Leave");
                    }

                    
                }   
                break;
            case HOSTILE:

                if (cheatActive) {
                    villagers[i].isHostile = 1;
                }


                // interactions

                if (!villagers[i].isHostile) {
                    if (BUTTON_PRESSED(BUTTON_A)) {
                        playSoundB(menuActivate_data, menuActivate_length, 0);
                        goToTextView("", "Got a problem?", "Suspicious Character", "Fight", "Leave");
                    }
                    if (textViewChoice == 1) {
                    /* goToTextView("this worked if u see this", villagers[i].greetingText,
                        villagers[i].name, villagers[i].optionA, villagers[i].optionB); */
                        goToTextView("...", "You'll die!", "Suspicious Character", "", "Engage");
                        villagers[i].isHostile = 1;
                    } 

                }
                //break;
            
            }
        }
        
    }


    savedWorldCol = player.worldCol;
    savedWorldRow = player.worldRow;

    animateTownViewPlayer();
}

// Handle player animation states
void animateTownViewPlayer() {

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


void updateTownViewArrows() {

    // player arrows
    bow.hide = 1;
    for (int i = 0; i < TOTALSCREENARROWS; i++) {


        // TODO - handling collision with a hostile villager
        // if the villager is hostile, arrows the player shoots will do damage
        // can't kill peaceful villagers tho
        /* for (int i = 0; i < currentTown.villagerCount; i++) {
            if (villagers[i].isHostile) {
                if (arrows[i].hide == 0 && collision(villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width,
                    villagers[i].sprite.height, arrows[i].worldCol, arrows[i].worldRow, arrows[i].width, arrows[i].height)) {
                        villagers[i].health--;
                        arrows[i].hide = 1;
                        if (villagers[i].health <= 0) {
                            villagers[i].sprite.hide = 1;
                        }
                    
                }
            
            
            }
        } */

        // collision map and screen edge destruction handling
        if ((arrows[i].worldRow - vOff + arrows[i].height - (int) round(arrows[i].velocity*0.1) < SCREENHEIGHT - currentTown.floorRow + 8)) {

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


void updateTownViewHostileArrows() {
    int playerTookDamage = 0;
    for (int i = 0; i < currentTown.villagerCount; i++) {
        // player arrows
        villagers[i].bow.hide = 1;

        for (int j = 0; j < TOTALHOSTILEARROWS; j++) {

            // TODO - collision w player
/*             if (villagers[i].isHostile) {
                if (villagers[i].hostileArrows[j].hide == 0 && collision(player.worldCol, player.worldRow, player.width, player.height,villagers[i].hostileArrows[j].worldCol,
                    villagers[i].hostileArrows[j].worldRow, villagers[i].hostileArrows[j].width, villagers[i].hostileArrows[j].height)) {
                        villagers[i].hostileArrows[j].hide = 1;   
                        playerTookDamage = 1;
                }
            } */

            // collision map and screen edge destruction handling
            if ((villagers[i].hostileArrows[j].worldRow - vOff + villagers[i].hostileArrows[j].height - (int) round(villagers[i].hostileArrows[j].velocity*0.1) < SCREENHEIGHT - currentTown.floorRow + 8)) {

                    // gravity arithmetic
                    villagers[i].hostileArrows[j].worldRow = (int) villagers[i].hostileArrows[j].worldRow - round(villagers[i].hostileArrows[j].velocity*.1);
                    // hides bow if arrow is being shot
                    villagers[i].bow.hide = 0;
                    if (villagers[i].sprite.direction == 1) {
                        villagers[i].hostileArrows[j].worldCol = (int) villagers[i].hostileArrows[j].worldCol + round(villagers[i].hostileArrows[j].horVelocity*.1);
                    } else {
                        villagers[i].hostileArrows[j].worldCol = (int) villagers[i].hostileArrows[j].worldCol - round(villagers[i].hostileArrows[j].horVelocity*.1);                   
                    }

                    villagers[i].hostileArrows[j].velocity = (int) villagers[i].hostileArrows[j].velocity + (GRAVITY*.1);

            } else {
                villagers[i].hostileArrows[j].hide = 1;
            }

            if (villagers[i].hostileArrows[j].worldCol < 1 || villagers[i].hostileArrows[j].worldCol > MAPWIDTH-16) {
                villagers[i].hostileArrows[j].hide = 1;
            }


        }

        // updating bow location
        if (villagers[i].sprite.direction == 1) {
            villagers[i].bow.worldCol = villagers[i].sprite.worldCol + 5;
        } else {
            villagers[i].bow.worldCol = villagers[i].sprite.worldCol - 5;
        } 
        villagers[i].bow.worldRow = villagers[i].sprite.worldRow;
    }

/*     if (playerTookDamage) {
        playerHealth--;

    } */
    
}

// villager ai
void updateTownViewVillagers() {
    //srand(time);
    int showButton = 0;
    int willShoot;
    int villagerTookDamage = 0;



    for (int i = 0; i < currentTown.villagerCount; i++) {
        if (cheatActive) {
            villagers[i].isHostile = 1;
        }
        // checks if enemy is dead
        if (villagers[i].health <= 0) {
            villagers[i].sprite.hide = 1;
            towns[currentTown.index].enemyDefeated = 1;
            currentTown.enemyDefeated = 1;
        }

        if (villagers[i].doesWander) {
            // sets movement interval

            if(villagers[i].movementCounter % ((rand()%40) + 180) == 0 && !villagers[i].isMoving) {
                villagers[i].timeToMove = 30 + (2*i);
                villagers[i].isMoving = 1;
                //villagers[i].sprite.direction = -1;

                if (rand() % 100 > 60) {
                    villagers[i].sprite.direction *= -1;
                    //villagers[i].sprite.direction = villagers[i].sprite.direction;
                }
            }

            for (int j = 0; j < currentTown.villagerCount; j++) {
                if (i != j) {
                    if (collision(villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width, villagers[i].sprite.height,
                        villagers[j].sprite.worldCol, villagers[j].sprite.worldRow, villagers[j].sprite.width, villagers[j].sprite.height) && !villagers[i].isMoving) {
                            villagers[i].timeToMove = 55 - (2*i);
                            villagers[i].isMoving = 1;                        

                            if (rand() % 100 > 50) {
                                villagers[i].sprite.direction *= -1;
                                //villagers[i].sprite.direction = villagers[i].sprite.direction;
                            }
                    }
                }
            }
        }
        
        switch(villagers[i].type) {
        case (MERCHANT): 
            break;
        case (DOCTOR): 
            break;
        case (NORMIE):   
            // random movement AI
            //int randomseed = 100*rand();

            break;
        case QUESTGIVER:
            switch  (currentTown.questTownType) {
                case BOWGIVER:

                    break;
                case BOUNTY:
                    break;

            }


            break;
        case (HOSTILE):

        if (villagers[i].damageCooldown > 0) {
            villagers[i].damageCooldown--;
        }

        if (villagers[i].health <= 0) {
            villagers[i].drawIcon = 0;
            villagers[i].sprite.hide = 1;
            //towns[currentTown.index].enemyDefeated = 1;
            //currentTown.enemyDefeated = 1;

            bountyKilled = 1;


        }


        if (villagers[i].damageCooldown >= 0) {
            villagers[i].damageCooldown--;
        } else {
            villagers[i].damageCooldown = 0;
        }

        int tookDamage = 0;


        // checking for collision w player arrows
        for (int j = 0; j < TOTALSCREENARROWS; j++) {
            if (villagers[i].isHostile && villagers[i].health > 0) {
                if (!arrows[j].didDamage && (collision(villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width,
                    villagers[i].sprite.height, arrows[j].worldCol, arrows[j].worldRow, arrows[j].width, arrows[j].height) )) {
                    
                    arrows[j].hide = 1;   
                    arrows[j].didDamage = 1;   
                    arrows[j].worldCol = 0;   
                    arrows[j].worldRow = 0;   
                    arrows[j].hide = 1;   
                    playSoundB(enemyHit_data, enemyHit_length, 0);

                }
            }

            if (arrows[j].didDamage && villagers[i].damageCooldown < 2 ) {
                arrows[j].didDamage = 0;
                villagers[i].health -= 1;
                villagers[i].damageCooldown = 10;
                if (villagers[i].health <= 0 ) {
                    villagers[i].sprite.hide = 1;
                    if (cheatActive) {
                        playerMoney++;
                    }
                    //playerMoney += enemies[i].moneyDrop;
                }
            }
        }

        // checking for collision w player arrows
/*             for (int j = 0; j < TOTALSCREENARROWS; j++) {
                if (villagers[i].isHostile && villagers[i].sprite.hide == 0) {
                    if (arrows[i].didDamage == 0 && (collision(villagers[i].sprite.worldCol - hOff, villagers[i].sprite.worldRow - vOff, villagers[i].sprite.width,
                        villagers[i].sprite.height, arrows[j].worldCol - hOff, arrows[j].worldRow - vOff, arrows[j].width, arrows[j].height) )) {
                        
                        arrows[j].hide = 1;   
                        arrows[j].didDamage = 1;   
                        if (villagers[i].damageCooldown <=0 ) {
                            //villagerTookDamage = 1;
                            villagers[i].health -= 1;
                            villagers[i].damageCooldown = 10;
                            playSoundB(enemyHit_data, enemyHit_length, 0);
                        }

                    }
                }
            }
            if (villagerTookDamage) {
                villagerTookDamage = 0;
                villagers[i].health -= 1;
                if (cheatActive) {
                    playerMoney++;
                }
            } */


            // attack ai
            if (villagers[i].isHostile && villagers[i].sprite.hide == 0) {
                villagers[i].shootCounter++;
                willShoot = 1;


                int distanceToKeep = 80;
                int distanceToAvoid = 40;
                int distanceFromPlayer = villagers[i].sprite.worldCol - player.worldCol;

                villagers[i].timeToWait--;

                // movement ai
                if (villagers[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToKeep) {
                    villagers[i].isMoving++;
                    villagers[i].timeToMove = 20 + (4*i);
                    villagers[i].isMoving = 1;
                    if (distanceFromPlayer > 0) {
                        //villagers[i].sprite.worldCol--;
                        villagers[i].sprite.direction = -1;

                    } else {
                        //villagers[i].sprite.worldCol++;
                        villagers[i].sprite.direction = 1;
                    }

                } else {
                    if (abs(distanceFromPlayer) < distanceToAvoid) {
                        if (!villagers[i].hasWaited) {
                            willShoot = 0;
                            villagers[i].timeToWait = 20;
                            villagers[i].hasWaited = 1;
                        }
                        if (distanceFromPlayer > 0) {
                            //villagers[i].sprite.worldCol--;
                            villagers[i].sprite.direction = -1;

                        } else {
                            //villagers[i].sprite.worldCol++;
                            villagers[i].sprite.direction = 1;
                        }

                    }

                }

                // shooting an arrow
                // random chance
                if (willShoot && villagers[i].shootCounter % 60 < 3+i) {
                    for (int j = 0; j < TOTALHOSTILEARROWS; j++) {   

                        if (villagers[i].hostileArrows[j].hide) {
                            villagers[i].hostileArrows[j].hide = 0;
                            villagers[i].hostileArrows[j].worldRow = villagers[i].sprite.worldRow - 3;
                            villagers[i].hostileArrows[j].worldCol = villagers[i].sprite.worldCol;
                            villagers[i].hostileArrows[j].velocity = 10;
                            villagers[i].hostileArrows[j].horVelocity = 80;

                            villagers[i].hostileArrows[j].direction = villagers[i].sprite.direction;

                            break;
                        }
                    }
                }
            break;
            }

        
        }    
        
        // movement ai
        if (villagers[i].isMoving) {
            villagers[i].sprite.worldCol += (villagers[i].sprite.direction*villagers[i].sprite.cdel);
            villagers[i].timeToMove--;
        }
        if (villagers[i].sprite.worldCol <= 1  || villagers[i].sprite.worldCol > MAPWIDTH - 16) {
            villagers[i].sprite.direction = villagers[i].sprite.direction*-1;
        }



        if (villagers[i].timeToMove == 0) {
            //villagers[i].sprite.direction *= -1;
            villagers[i].timeToMove == 0;
            villagers[i].isMoving = 0;
        }
        villagers[i].movementCounter++;
        

    }

    animateTownViewVillagers();
}

// updates the sprite animations based on direction
void animateTownViewVillagers() {
    for (int i = 0; i < currentTown.villagerCount; i++) {

        if(!villagers[i].isMoving && !villagers[i].isHostile)
            villagers[i].sprite.aniState = SPRITEFRONT;
/*         if (villagers[i].isHostile) {
            if (villagers[i].sprite.direction)
                villagers[i].sprite.aniState = SPRITELEFT;
            else
                villagers[i].sprite.aniState = SPRITERIGHT;
        } */
        villagers[i].sprite.prevAniState = villagers[i].sprite.aniState;
        villagers[i].sprite.aniState = SPRITEIDLE;

        if(villagers[i].sprite.aniCounter % 20 == 0) {
            villagers[i].sprite.curFrame = (villagers[i].sprite.curFrame + 1) % villagers[i].sprite.numFrames;
        }

        if(villagers[i].sprite.direction == -1 && villagers[i].isMoving)
            villagers[i].sprite.aniState = SPRITELEFT;
        if(villagers[i].sprite.direction == 1 && villagers[i].isMoving)
            villagers[i].sprite.aniState = SPRITERIGHT;

        if (villagers[i].sprite.aniState == SPRITEIDLE) {

            villagers[i].sprite.curFrame = 0;
            villagers[i].sprite.aniCounter = 0;
            villagers[i].sprite.aniState = villagers[i].sprite.prevAniState;
        } else {
            villagers[i].sprite.aniCounter++;
        }
    }

    
}


void drawTownView() {

    drawTownViewPlayer();

    drawTownViewVillagers();

    drawTownViewArrows();

    drawTownViewHostileArrows();

    drawButtons(hOff, vOff);

    drawGlobal();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // parallax
    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff/2;
}

// Draw the player
void drawTownViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    }



}

void drawTownViewVillagers() {
    for (int i = 0; i < currentTown.villagerCount; i++) {
        if (villagers[i].sprite.hide) {
            shadowOAM[10+i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[10+i].attr0 = (ROWMASK & villagers[i].sprite.worldRow - vOff) | ATTR0_SQUARE;
            shadowOAM[10+i].attr1 = (COLMASK & villagers[i].sprite.worldCol - hOff) | ATTR1_SMALL;



            // draws correct sprite for each character type
            switch(villagers[i].type) {
            case NORMIE:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    8 + villagers[i].sprite.aniState * 2, villagers[i].sprite.curFrame * 2);
                break;
            case MERCHANT:
                // quest icon
                switch (villagers[i].merchantType) {
                    case BOWUPGRADE:
                        if (playerShootSpeed < 50) {
                            villagers[i].drawIcon = 1;
                        }
                        break;
                    case KEY:
                        if (!boughtKey) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }
                        break;
                }


                shadowOAM[10+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(
                    8 + villagers[i].sprite.aniState * 2, 18 + villagers[i].sprite.curFrame * 2);
                // drawing coin icon if goods avaliable
                if (villagers[i].drawIcon) {
                    shadowOAM[91].attr0 = ROWMASK & villagers[i].sprite.worldRow - vOff - 20| ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[91].attr1 = COLMASK & villagers[i].sprite.worldCol - hOff | ATTR1_SMALL;
                    shadowOAM[91].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(6, 10);
                } else {
                    shadowOAM[91].attr0 |= ATTR0_HIDE;
                }
                break;
            case QUESTGIVER:
                switch (villagers[i].questType) {
                    case BOWGIVER:
                        if (!playerHasBow) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }
                        // drawing
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(
                            8 + villagers[i].sprite.aniState * 2, 24 + villagers[i].sprite.curFrame * 2);
                        break;
                    case BOUNTY:
                        // quest icon
                        if ((!bountyCompleted && !bountyStarted) || (!bountyCompleted && bountyKilled)) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }
                        // drawing
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(
                            0 + villagers[i].sprite.aniState * 2, 24 + villagers[i].sprite.curFrame * 2);
                        break;
                    case LETTERGIVER:
                        // quest icon
                        if (!letterCompleted && (!letterStarted || letterRecieved)) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }
                        // drawing
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(
                            8 + villagers[i].sprite.aniState * 2, 12 + villagers[i].sprite.curFrame * 2);
                        break;
                    case LETTERDEST:
                        // quest icon
                        if (!letterCompleted && !letterRecieved && letterStarted) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }

                        // drawing
                        shadowOAM[10+i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(
                            0 + villagers[i].sprite.aniState * 2, 18 + villagers[i].sprite.curFrame * 2);
                        break;

                }

                // drawing explanation point if quest avaliable
                if (villagers[i].drawIcon) {
                    shadowOAM[90-i].attr0 = ROWMASK & villagers[i].sprite.worldRow - vOff - 20| ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[90-i].attr1 = COLMASK & villagers[i].sprite.worldCol - hOff | ATTR1_SMALL;
                    shadowOAM[90-i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(0, 12);
                } else {
                    shadowOAM[90-i].attr0 |= ATTR0_HIDE;
                }
                break;
            case DOCTOR:
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    8 + villagers[i].sprite.aniState * 2, 6 + villagers[i].sprite.curFrame * 2);

                break;
            case HOSTILE:
                // quest icon
                if (!bountyCompleted && !bountyKilled ) {
                    villagers[i].drawIcon = 1;
                } else {
                    villagers[i].drawIcon = 0;
                }

                if (villagers[i].isHostile) {
                    villagers[i].drawIcon = 0;
                }
                
                shadowOAM[10+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(
                    16 + villagers[i].sprite.aniState * 2, villagers[i].sprite.curFrame * 2);
                //drawTownViewHostileArrows(i);
                if (villagers[i].drawIcon) {
                    shadowOAM[90-i].attr0 = ROWMASK & villagers[i].sprite.worldRow - vOff - 20| ATTR0_4BPP | ATTR0_SQUARE;
                    shadowOAM[90-i].attr1 = COLMASK & villagers[i].sprite.worldCol - hOff | ATTR1_SMALL;
                    shadowOAM[90-i].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(0, 12);
                } else {
                    shadowOAM[90-i].attr0 |= ATTR0_HIDE;
                }
                break;

            }
        }
    }
}

// drawing the bow and arrows, helper for drawTownViewVillagers
void drawTownViewHostileArrows() {
    for (int i = 0; i < currentTown.villagerCount; i++) {


        //if (villagers[i].sprite.hide == 0 && villagers[i].isHostile) {
            int drawBow = 0;
            for (int j = 0; j < TOTALHOSTILEARROWS; j++) {
                if (villagers[i].hostileArrows[j].hide) {
                    shadowOAM[45+i*j].attr0 |= ATTR0_HIDE;
                } else {
                    drawBow = 1;
                    shadowOAM[45+i*j].attr0 = (ROWMASK & villagers[i].hostileArrows[j].worldRow - vOff) | ATTR0_SQUARE;
                    shadowOAM[45+i*j].attr1 = (COLMASK & villagers[i].hostileArrows[j].worldCol - hOff) | ATTR1_SMALL;
                    if (villagers[i].hostileArrows[j].direction == 1) {
                        shadowOAM[45+i*j].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[45+i*j].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 10);
                    }
                }

            }
            //draw bow
            if (villagers[i].bow.hide) {
                    shadowOAM[20+i].attr0 |= ATTR0_HIDE;
            } else {
                if (villagers[i].isHostile && villagers[i].sprite.direction == 1) {
                    shadowOAM[20+i].attr0 = (ROWMASK & villagers[i].bow.worldRow - vOff) | ATTR0_SQUARE;
                    shadowOAM[20+i].attr1 = (COLMASK & villagers[i].bow.worldCol - hOff) | ATTR1_SMALL;
                    shadowOAM[20+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(0, 8);
                } else {
                    shadowOAM[20+i].attr0 = (ROWMASK & villagers[i].bow.worldRow - vOff) | ATTR0_SQUARE;
                    shadowOAM[20+i].attr1 = (COLMASK & villagers[i].bow.worldCol - hOff) | ATTR1_SMALL;
                    shadowOAM[20+i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2, 8);
                }        
            }
            
        //}

    }
    
}

// drawing the bow and arrows
void drawTownViewArrows() {
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