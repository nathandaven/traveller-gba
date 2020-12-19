
//{{BLOCK(map)

//======================================================================
//
//	map, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 1010 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 32320 + 8192 = 41024
//
//	Time-stamp: 2020-11-24, 16:40:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 32320
extern const unsigned short mapTiles[16160];

#define mapMapLen 8192
extern const unsigned short mapMap[4096];

#define mapPalLen 512
extern const unsigned short mapPal[256];

#endif // GRIT_MAP_H

//}}BLOCK(map)
