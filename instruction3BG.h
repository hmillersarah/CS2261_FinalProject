
//{{BLOCK(instruction3BG)

//======================================================================
//
//	instruction3BG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 324 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10368 + 2048 = 12928
//
//	Time-stamp: 2023-04-18, 23:09:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION3BG_H
#define GRIT_INSTRUCTION3BG_H

#define instruction3BGTilesLen 10368
extern const unsigned short instruction3BGTiles[5184];

#define instruction3BGMapLen 2048
extern const unsigned short instruction3BGMap[1024];

#define instruction3BGPalLen 512
extern const unsigned short instruction3BGPal[256];

#endif // GRIT_INSTRUCTION3BG_H

//}}BLOCK(instruction3BG)
