
//{{BLOCK(instruction4BG)

//======================================================================
//
//	instruction4BG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 224 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7168 + 2048 = 9728
//
//	Time-stamp: 2023-04-16, 14:49:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION4BG_H
#define GRIT_INSTRUCTION4BG_H

#define instruction4BGTilesLen 7168
extern const unsigned short instruction4BGTiles[3584];

#define instruction4BGMapLen 2048
extern const unsigned short instruction4BGMap[1024];

#define instruction4BGPalLen 512
extern const unsigned short instruction4BGPal[256];

#endif // GRIT_INSTRUCTION4BG_H

//}}BLOCK(instruction4BG)
