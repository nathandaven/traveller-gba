
//{{BLOCK(sandGround)

//======================================================================
//
//	sandGround, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 73 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2336 + 2048 = 4896
//
//	Time-stamp: 2020-11-24, 00:04:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SANDGROUND_H
#define GRIT_SANDGROUND_H

#define sandGroundTilesLen 2336
extern const unsigned short sandGroundTiles[1168];

#define sandGroundMapLen 2048
extern const unsigned short sandGroundMap[1024];

#define sandGroundPalLen 512
extern const unsigned short sandGroundPal[256];

#endif // GRIT_SANDGROUND_H

//}}BLOCK(sandGround)
