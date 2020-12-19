
//{{BLOCK(walls)

//======================================================================
//
//	walls, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 16 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 512 + 2048 = 3072
//
//	Time-stamp: 2020-11-24, 11:08:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WALLS_H
#define GRIT_WALLS_H

#define wallsTilesLen 512
extern const unsigned short wallsTiles[256];

#define wallsMapLen 2048
extern const unsigned short wallsMap[1024];

#define wallsPalLen 512
extern const unsigned short wallsPal[256];

#endif // GRIT_WALLS_H

//}}BLOCK(walls)
