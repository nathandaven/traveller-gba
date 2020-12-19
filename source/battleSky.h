
//{{BLOCK(battleSky)

//======================================================================
//
//	battleSky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 209 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 6688 + 4096 = 11296
//
//	Time-stamp: 2020-11-27, 17:10:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BATTLESKY_H
#define GRIT_BATTLESKY_H

#define battleSkyTilesLen 6688
extern const unsigned short battleSkyTiles[3344];

#define battleSkyMapLen 4096
extern const unsigned short battleSkyMap[2048];

#define battleSkyPalLen 512
extern const unsigned short battleSkyPal[256];

#endif // GRIT_BATTLESKY_H

//}}BLOCK(battleSky)
