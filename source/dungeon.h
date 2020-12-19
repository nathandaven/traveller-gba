
//{{BLOCK(dungeon)

//======================================================================
//
//	dungeon, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 193 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 6176 + 8192 = 14880
//
//	Time-stamp: 2020-12-02, 01:06:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_DUNGEON_H
#define GRIT_DUNGEON_H

#define dungeonTilesLen 6176
extern const unsigned short dungeonTiles[3088];

#define dungeonMapLen 8192
extern const unsigned short dungeonMap[4096];

#define dungeonPalLen 512
extern const unsigned short dungeonPal[256];

#endif // GRIT_DUNGEON_H

//}}BLOCK(dungeon)
