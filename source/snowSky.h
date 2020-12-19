
//{{BLOCK(snowSky)

//======================================================================
//
//	snowSky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 432 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 13824 + 4096 = 18432
//
//	Time-stamp: 2020-11-23, 23:29:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SNOWSKY_H
#define GRIT_SNOWSKY_H

#define snowSkyTilesLen 13824
extern const unsigned short snowSkyTiles[6912];

#define snowSkyMapLen 4096
extern const unsigned short snowSkyMap[2048];

#define snowSkyPalLen 512
extern const unsigned short snowSkyPal[256];

#endif // GRIT_SNOWSKY_H

//}}BLOCK(snowSky)
