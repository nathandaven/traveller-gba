/* 

Traveller: The Quest for Mead by Nathan Davenport
Version: Final (v1)

Instructions on how to play and some more info can be found in the README.TXT attached.
Thanks!!!       

 */


#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "title.h"
#include "mapView.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "map.h"
#include "global.h"

#include <string.h>

#include "instructions.h"

#include "textViewBackground.h"
#include "buildingsBackgroundA.h"

#include "dungeon.h"
#include "dungeonCollision.h"

#include "sound.h"

#include "snowGround.h"
#include "snowSky.h"
#include "mountainGround.h"
#include  "mountainSky.h"
#include "sandGround.h"
#include "sandSky.h"
#include "walls.h"
#include "wallsWood.h"

#include "sandBuildingsSmall.h"
#include "sandBuildingsLarge.h"
#include "mountainBuildingsSmall.h"
#include "mountainBuildingsMedium.h"
#include "mountainBuildingsLarge.h"
#include "battleSky.h"

//themes
#include "mainTheme.h"
#include "mapTheme.h"
#include "townThemeA.h"
#include "dungeonTheme.h"
#include "menuActivate.h"
#include "playerDie.h"
#include "gameWin.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToMapView();
void mapView();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


// States
enum
{
    START,
    INSTRUCTIONS,
    MAPVIEW,
    TOWNVIEW,
    BATTLEVIEW,
    DUNGEONVIEW,
    CHEAT,
    TEXTVIEW,
    MERCHANTVIEW,
    PAUSE,
    WIN,
    LOSE
};
int state;

int currentGameState;

int dungeonUnlocked;
int playerReady;

char moneyBuffer[10];

int backgroundTimer;

// cheat variables 
int cheatHelperVar;
int failedCheat;
int doingCheat;
int cheatAnswers[4];

int aEnabled;
int bEnabled;

ANISPRITE tempPlayer;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case MAPVIEW:
            mapView();
            break;
        case TOWNVIEW:
            townView();
            break;
        case BATTLEVIEW:
            battleView();
            break;
        case DUNGEONVIEW:
            dungeonView();
            break;
        case TEXTVIEW:
            textView();
            break;
        case MERCHANTVIEW:
            merchantView();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{

    // button input
    buttons = BUTTONS;
    oldButtons = 0;

    // audio setup
    setupSounds();
    setupInterrupts();

    initializeGlobal();

    goToStart();
}


/// Sets up the start state
void goToStart() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites


    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    // palette
	DMANow(3, titlePal, PALETTE, titlePalLen / 2);

    // background 01-- moving background
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    DMANow(3, mountainSkyTiles, &CHARBLOCK[0], mountainSkyTilesLen / 2);
    DMANow(3, mountainSkyMap, &SCREENBLOCK[25], mountainSkyMapLen / 2);

    // background 0 -- text
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
	DMANow(3, titleTiles, &CHARBLOCK[1], titleTilesLen / 2);
	DMANow(3, titleMap, &SCREENBLOCK[29], titleMapLen / 2);

    stopSound();

    playSoundB(menuActivate_data, menuActivate_length, 0);

    playSoundA(mainTheme_data, mainTheme_length, 1);
    
    waitForVBlank();
    state = START;
}

// Runs every frame of the start state
void start() {

    backgroundTimer++;

    REG_BG1HOFF = backgroundTimer/4;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}


/// Sets up the start state
void goToInstructions() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites

    // palette
	DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);

    

    // background 0 -- text
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
	DMANow(3, instructionsTiles, &CHARBLOCK[1], instructionsTilesLen / 2);
	DMANow(3, instructionsMap, &SCREENBLOCK[29], instructionsMapLen / 2);

    playSoundB(menuActivate_data, menuActivate_length, 0);



    // initialize player sprite
    tempPlayer.width = 16;
    tempPlayer.height = 16;
    tempPlayer.rdel = 1;
    tempPlayer.cdel = 1;
    tempPlayer.worldRow = 135;
    tempPlayer.worldCol = 213;
    tempPlayer.aniCounter = 0;
    tempPlayer.curFrame = 0;
    tempPlayer.numFrames = 3;
    tempPlayer.aniState = SPRITERIGHT;
    tempPlayer.hide = 0;

    // spritesheet
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, shadowOAM, OAM, 128 * 4);

    hideSprites();

    waitForVBlank();
    state = INSTRUCTIONS;
}

// Runs every frame of the start state
void instructions() {

    backgroundTimer++;
    REG_BG1HOFF = backgroundTimer/4;

    if(tempPlayer.aniCounter % 20 == 0) {
        tempPlayer.curFrame = (tempPlayer.curFrame + 1) % tempPlayer.numFrames;
    }
    tempPlayer.aniCounter++;

    //drawing jumping player
    shadowOAM[0].attr0 = (ROWMASK & tempPlayer.worldRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & tempPlayer.worldCol) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tempPlayer.aniState * 2, tempPlayer.curFrame * 2);

    

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);


    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_B) || BUTTON_PRESSED(BUTTON_SELECT)) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
        DMANow(3, shadowOAM, OAM, 128 * 4);
        hideSprites();
        doingCheat = 0;
        textViewChoice = -1;
        hideSprites();
        initMapView();
        goToMapView();
    }
}

// Sets up the game state
void goToMapView() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, mapPal, PALETTE, mapPalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    DMANow(3, mapTiles, &CHARBLOCK[1], mapTilesLen / 2);
    DMANow(3, mapMap, &SCREENBLOCK[28], mapMapLen / 2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    playSoundB(menuActivate_data, menuActivate_length, 0);

    if(soundA.data != mapTheme_data)
        playSoundA(mapTheme_data, mapTheme_length, 1);

    currentGameState = MAPVIEW;
    state = MAPVIEW;
}

// Runs every frame of the game state
void mapView() {

    if (textViewChoice == 1 && doingCheat && !cheatActive)  {
        doingCheat = 0;
        cheatActive = 1;
        playerHealth = 10;
        playerShootSpeed = 60;
        playerMoney = 66;
        dungeonKeys = 6;
    }

    if (playerReady && textViewChoice) {
        //goToWin();
        goToDungeonView();
        initDungeonView();
    }

    // game
    updateMapView();
    drawMapView();

    if (textViewChoice == 1) {
        textViewChoice = -1;
        //resumeBattleView();
        initBattleView();
        goToBattleView();
    } 

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_A) && canTravel > 0) {
        if (canTravel == 69) {
            doingCheat = 1;
            textViewChoice = -1;
            goToTextView("", "Activate gruelsome mode?", "", "Yes", "No");

        } else if (canTravel == 6) {
            doingCheat = 0;
            dungeonUnlocked = 1;
            goToTextView("", "There is no turning back.", "Are you ready for this battle?", "Yes", "No");
            playerReady = 1;

            if (textViewChoice == 1) {
                //goToWin();
                goToDungeonView();
                initDungeonView();
            } 
        } else {
            doingCheat = 0;
            currentTown = towns[canTravel-1];
            initTownView();
            goToTownView();
        }
    }
}

// Sets up the game state
void goToTownView() {
    hideSprites();
    
    playSoundB(menuActivate_data, menuActivate_length, 0);

    //pallette
    unsigned short *palettes[5] = {mountainBuildingsMediumPal, mountainBuildingsSmallPal, sandBuildingsSmallPal, mountainBuildingsLargePal, sandBuildingsLargePal};
    // bg 3 - sky
    unsigned short *skyTiles[5] = {snowSkyTiles, mountainSkyTiles, sandSkyTiles, mountainSkyTiles, sandSkyTiles};
    int skyTilesLengths[5] = {snowSkyTilesLen, mountainSkyTilesLen, sandSkyTilesLen, mountainSkyTilesLen, sandSkyTilesLen};
    unsigned short *skyMaps[5] = {snowSkyMap, mountainSkyMap, sandSkyMap, mountainSkyMap, sandSkyMap};

    // bg 2 - wall
/*     unsigned short *wallTiles;
    unsigned short *wallMap; */

    // bg 1 - ground
    unsigned short *groundTiles[5] = {snowGroundTiles, mountainGroundTiles, sandGroundTiles, mountainGroundTiles, sandGroundTiles};
    int groundTilesLengths[5] = {snowGroundTilesLen, mountainGroundTilesLen, sandGroundTilesLen, mountainGroundTilesLen, sandGroundTilesLen};
    unsigned short *groundMaps[5] = {snowGroundMap, mountainGroundMap, sandGroundMap, mountainGroundMap, sandGroundMap};

    // bg 0 - buildings
    unsigned short *buildingTiles[5] = {mountainBuildingsMediumTiles, mountainBuildingsSmallTiles, sandBuildingsSmallTiles, mountainBuildingsLargeTiles, sandBuildingsLargeTiles};
    int buildingTilesLengths[5] = {mountainBuildingsMediumTilesLen, mountainBuildingsSmallTilesLen, sandBuildingsSmallTilesLen, mountainBuildingsLargeTilesLen, sandBuildingsLargeTilesLen};
    unsigned short *buildingMaps[5] = {mountainBuildingsMediumMap, mountainBuildingsSmallMap, sandBuildingsSmallMap, mountainBuildingsLargeMap, sandBuildingsLargeMap};



    // town, ground, wall, sky

    // enable backgrounds and sprites
    REG_DISPCTL = MODE0 | BG3_ENABLE | BG2_ENABLE | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;

    //DMANow(3, currentTown.buildingsBackgroundPallete, PALETTE, currentTown.buildingsBackgroundPalleteLen / 2);
    DMANow(3, palettes[canTravel-1], PALETTE, 256 / 2);
    //DMANow(3, buildingsBackgroundAPal, PALETTE, buildingsBackgroundAPalLen / 2);

    // backround 3 - sky
    //DMANow(3, townSkyPal, PALETTE, townSkyPalLen / 2);
    REG_BG2CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);
    DMANow(3, skyTiles[canTravel-1], &CHARBLOCK[2], skyTilesLengths[canTravel-1] / 2);
    DMANow(3, skyMaps[canTravel-1], &SCREENBLOCK[29], sandSkyMapLen / 2); //4096

    // background 2 - wall
    REG_BG3CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(3) | BG_SCREENBLOCK(31);
    DMANow(3, wallsTiles, &CHARBLOCK[3], wallsTilesLen / 2);
    DMANow(3, wallsMap, &SCREENBLOCK[31], wallsMapLen / 2);

    // background 1 -- ground
    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);
    DMANow(3, groundTiles[canTravel-1], &CHARBLOCK[1], groundTilesLengths[canTravel-1] / 2);
    DMANow(3, groundMaps[canTravel-1], &SCREENBLOCK[28], mountainGroundMapLen / 2); //2048

    // new background 0 -- town
    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    DMANow(3, buildingTiles[canTravel-1], &CHARBLOCK[0], buildingTilesLengths[canTravel-1] / 2);
    DMANow(3, buildingMaps[canTravel-1], &SCREENBLOCK[25], mountainBuildingsLargeMapLen / 2);

    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if(soundA.data != townThemeA_data)
        playSoundA(townThemeA_data, townThemeA_length, 1);

    //hOff = 0;

    currentGameState = TOWNVIEW;
    state = TOWNVIEW;
}

// Runs every frame of the game state
void townView() {

    // game
    updateTownView();
    drawTownView();

    updateGlobal();

    if (playerHealth <= 0) {
        goToLose();
        playerHealth = 3;
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }


    // temporary
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        towns[canTravel-1] = currentTown;
        resumeMapView();
        goToMapView();    
        }

}

void goToBattleView() {
    hideSprites();
    
    //playSoundB(menuActivate_data, menuActivate_length, 0);

    // enable backgrounds and sprites
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    //DMANow(3, currentTown.buildingsBackgroundPallete, PALETTE, currentTown.buildingsBackgroundPalleteLen / 2);
    DMANow(3, battleSkyPal, PALETTE, battleSkyPalLen / 2);
    //DMANow(3, buildingsBackgroundAPal, PALETTE, buildingsBackgroundAPalLen / 2);

    // backround 3 - sky
    //DMANow(3, townSkyPal, PALETTE, townSkyPalLen / 2);
    REG_BG2CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);
    DMANow(3, battleSkyTiles, &CHARBLOCK[2], battleSkyTilesLen / 2);
    DMANow(3, battleSkyMap, &SCREENBLOCK[29], battleSkyMapLen / 2); //4096


    // background 1 -- ground
    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);
    DMANow(3, mountainGroundTiles, &CHARBLOCK[1], mountainGroundTilesLen / 2);
    DMANow(3, mountainGroundMap, &SCREENBLOCK[28], mountainGroundMapLen / 2); //2048

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // ! - NEED NEW SOUNDS
    if(soundA.data != dungeonTheme_data)
        playSoundA(dungeonTheme_data, dungeonTheme_length, 1);

    //hOff = 0;



    currentGameState = BATTLEVIEW;
    state = BATTLEVIEW;
}

// Runs every frame of the game state
void battleView() {
    // game
    if (!battleViewDefeated) {
        updateBattleView();
        drawBattleView();
        updateGlobal();


        if (playerHealth <= 0) {
            goToLose();
            playerHealth = 3;
        }

        if (BUTTON_PRESSED(BUTTON_START) && (!inMode4)) {
            goToPause();
        }
    } else {
        flipPage();
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        resumeMapView();
        goToMapView();   
        //flipPage(); 
            
    }
}

void goToDungeonView() {
    hideSprites();

    // enable backgrounds and sprites
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, dungeonPal, PALETTE, dungeonPalLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    DMANow(3, dungeonTiles, &CHARBLOCK[1], dungeonTilesLen / 2);
    DMANow(3, dungeonMap, &SCREENBLOCK[28], dungeonMapLen / 2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    playSoundB(menuActivate_data, menuActivate_length, 0);


    if(soundA.data != dungeonTheme_data)
        playSoundA(dungeonTheme_data, dungeonTheme_length, 1);

    //hOff = 0;

    currentGameState = DUNGEONVIEW;
    state = DUNGEONVIEW;
}

void dungeonView() {

    // game
    updateDungeonView();
    drawDungeonView();

    updateGlobal();

    if (playerHealth <= 0) {
        goToLose();
        playerHealth = 3;
    }

    if (touchingMead) {
        if (BUTTON_PRESSED(BUTTON_A)) {
            meadCollected = 1;
        }
    }

    if (bossDead && meadCollected) {
        goToWin();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (BUTTON_PRESSED(BUTTON_B)) {
        //goToTextView("player text", "opposing text", "Gamer:", "say hi", "leave");
    }

    // temporary
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        resumeMapView();
        goToMapView();    
        }
}

// using mode 4 in order to live draw text instaed of many backgrounds
void goToTextView(char playerText[], char opposingText[], char name[], char optionA[], char optionB[]) {
    //playSoundB(menuActivate_data, menuActivate_length, 0);
    
    // makes A or b buttons not work if button is empty
    if (optionA == "") {
        aEnabled = 0;
    } else {
        aEnabled = 1;
    }

    if (optionB == "") {
        bEnabled = 0;
    } else {
        bEnabled = 1;
    }
    //strtok(opposingText, "\0")
    // calculating kength of text string
    int length = 0;
    while (opposingText[length] != "\0") {
        length++;
    }


    textViewChoice = -1;
    hideSprites();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    DMANow(3, textViewBackgroundPal, PALETTE, 256);
    drawFullscreenImage4(textViewBackgroundBitmap);

    // created a white color in the pallette, up to change later (15)

    drawString4(16, 16, name, 15);
    drawString4(16, 16*2, opposingText, 15);

/*     drawString4(16, 16, name, 15);
    drawString4(16, 16*4, additionalText, 15); */

    drawString4(16, 16*7, "You: ",15);
    drawString4(16, 16*8, playerText,15);

    drawString4(11*16 + 2, 109, optionA, 15);
    drawString4(11*16 + 2, 109 + 24, optionB, 15);



    waitForVBlank();
    flipPage();
    state = TEXTVIEW;
}

void textView() {
    //textViewChoice = -1;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_A) && aEnabled) {
        playSoundB(menuActivate_data, menuActivate_length, 0);
        textViewChoice = 1;
        flipPage();
        drawFullscreenImage4(textViewBackgroundBitmap);
        flipPage();
        switch (currentGameState)
            {
            case MAPVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
                resumeMapView();
                goToMapView();
                break;
            case TOWNVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
                goToTownView();
                break;
            case DUNGEONVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;
                initDungeonView();
                goToDungeonView();
                break;
            case BATTLEVIEW:
                REG_DISPCTL = MODE0 | BG3_ENABLE| BG1_ENABLE | SPRITE_ENABLE;
                //initBattleView();
                goToBattleView();
                break;
            }
    }

    if (BUTTON_PRESSED(BUTTON_B) && bEnabled) {
        textViewChoice = 0;
        flipPage();
        drawFullscreenImage4(textViewBackgroundBitmap);
        flipPage();
        switch (currentGameState)
            {
            case MAPVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
                resumeMapView();
                goToMapView();
                break;
            case TOWNVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE |  SPRITE_ENABLE;
                goToTownView();
                break;
            case DUNGEONVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;
                initDungeonView();
                goToDungeonView();
                break;
            case BATTLEVIEW:
                REG_DISPCTL = MODE0 | BG3_ENABLE| BG1_ENABLE | SPRITE_ENABLE;
                //initBattleView();
                goToBattleView();
                break;
            }
    }

}

// using mode 4 in order to live draw text instaed of many backgrounds
void goToMerchantView(char playerText[], char opposingText[], char name[], char optionA[], char optionB[]) {
    //textViewChoice = -1;

    hideSprites();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    DMANow(3, textViewBackgroundPal, PALETTE, 256);
    drawFullscreenImage4(textViewBackgroundBitmap);

    // created a white color in the pallette, up to change later (15)

    drawString4(16, 16, name, 15);
    drawString4(16, 16*2, opposingText, 15);

    //drawString4(16, 16*7, "You: ",15);
    //drawString4(16, 16*8, "this is merchant view",15);

    // draws players current money
    sprintf(moneyBuffer, "Coins: %d", playerMoney);
    drawString4(16, 16*8, moneyBuffer,15);

    drawString4(16, 16*7, playerText,15);

    drawString4(11*16 + 2, 109, optionA, 15);
    drawString4(11*16 + 2, 109 + 24, optionB, 15);

    drawString4(11*16 + 2, 109 + 24, optionB, 15);

    waitForVBlank();
    flipPage();
    state = MERCHANTVIEW;
}

void merchantView() {
    textViewChoice = -1;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_A)) {
        playSoundB(menuActivate_data, menuActivate_length, 0);
        textViewChoice = 1;
        flipPage();
        drawFullscreenImage4(textViewBackgroundBitmap);
        flipPage();
        switch (currentGameState)
            {
            case MAPVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
                goToMapView();
                break;
            case TOWNVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
                goToTownView();
                break;
            case DUNGEONVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;
                initDungeonView();
                goToDungeonView();
                break;
            case BATTLEVIEW:
                REG_DISPCTL = MODE0 | BG3_ENABLE| BG1_ENABLE | SPRITE_ENABLE;
                initBattleView();
                goToBattleView();
                break;
            }
    }

    if (BUTTON_PRESSED(BUTTON_B)) {
        textViewChoice = 0;
        flipPage();
        drawFullscreenImage4(textViewBackgroundBitmap);
        flipPage();
        switch (currentGameState)
            {
            case MAPVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
                goToMapView();
                break;
            case TOWNVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE |  SPRITE_ENABLE;
                goToTownView();
                break;
            case DUNGEONVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;
                initDungeonView();
                goToDungeonView();
                break;
            case BATTLEVIEW:
                REG_DISPCTL = MODE0 | BG3_ENABLE| BG1_ENABLE | SPRITE_ENABLE;
                initBattleView();
                goToBattleView();
                break;
            }
    }

}

// Sets up the pause state
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE; 
    hideSprites();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    // palette
	DMANow(3, pausePal, PALETTE, pausePalLen / 2);

    // background 01-- moving background
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    DMANow(3, mountainSkyTiles, &CHARBLOCK[0], mountainSkyTilesLen / 2);
    DMANow(3, mountainSkyMap, &SCREENBLOCK[25], mountainSkyMapLen / 2);

    // background 0 -- text
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
	DMANow(3, pauseTiles, &CHARBLOCK[1], pauseTilesLen / 2);
	DMANow(3, pauseMap, &SCREENBLOCK[29], pauseMapLen / 2);

    pauseSound();
    playSoundB(menuActivate_data, menuActivate_length, 0);

    waitForVBlank();
    hideSprites();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    backgroundTimer++;

    REG_BG1HOFF = backgroundTimer/8;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        switch (currentGameState)
            {
            case MAPVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
                goToMapView();
                break;
            case TOWNVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
                goToTownView();
                break;
            case DUNGEONVIEW:
                REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;
                //initDungeonView();
                goToDungeonView();
                break;
            case BATTLEVIEW:
                REG_DISPCTL = MODE0 | BG3_ENABLE| BG1_ENABLE | SPRITE_ENABLE;
                goToBattleView();
                break;
            }
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {

    REG_DISPCTL = MODE0 | BG0_ENABLE; 
    hideSprites();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    // palette
	DMANow(3, winPal, PALETTE, winPalLen / 2);

    // background 01-- moving background
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    DMANow(3, mountainSkyTiles, &CHARBLOCK[0], mountainSkyTilesLen / 2);
    DMANow(3, mountainSkyMap, &SCREENBLOCK[25], mountainSkyMapLen / 2);

    // background 0 -- text
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
	DMANow(3, winTiles, &CHARBLOCK[1], winTilesLen / 2);
	DMANow(3, winMap, &SCREENBLOCK[29], winMapLen / 2);

    stopSound();

    playSoundB(gameWin_data, gameWin_length, 0);

    waitForVBlank();

    state = WIN;
}

// Runs every frame of the win state
void win() {

    backgroundTimer++;

    REG_BG1HOFF = backgroundTimer/8;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();

        // resetting story variables
        dungeonUnlocked = 0;
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
        playerReady = 0;

        for (int i = 0; i < TOTALTOWNS; i++) {
            TOWN town;
            towns[i] = town;
        }

        cheatActive = 0;
        touchingMead = 0;
        meadCollected = 0;

        // reset stats
        playerHealth = 5;
        playerMoney = 0;
        playerShootSpeed = 0;

        // resetting location
        currentGameState = MAPVIEW;
        canTravel = 0;

        resetMapView();
        resetTownView();
        resetGlobal();
        initialize();
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {

    REG_DISPCTL = MODE0 | BG0_ENABLE; 
    hideSprites();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    // palette
	DMANow(3, losePal, PALETTE, losePalLen / 2);

    // background 01-- moving background
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    DMANow(3, mountainSkyTiles, &CHARBLOCK[0], mountainSkyTilesLen / 2);
    DMANow(3, mountainSkyMap, &SCREENBLOCK[25], mountainSkyMapLen / 2);

    // background 0 -- text
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
	DMANow(3, loseTiles, &CHARBLOCK[1], loseTilesLen / 2);
	DMANow(3, loseMap, &SCREENBLOCK[29], loseMapLen / 2);

    stopSound();
    playSoundA(playerDie_data, playerDie_length, 0);


    // penalizes player 3 gold when dead
    playerMoney -= 3;
    if (playerMoney <= 0) {
        playerMoney = 0;
    }

    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    backgroundTimer++;

    REG_BG1HOFF = backgroundTimer/8;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();         
    }
}