
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 461 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14752 + 2048 = 17312
//
//	Time-stamp: 2020-12-01, 22:02:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 14752
extern const unsigned short instructionsTiles[7376];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)
