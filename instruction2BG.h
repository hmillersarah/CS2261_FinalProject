
//{{BLOCK(instruction2BG)

//======================================================================
//
//	instruction2BG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 236 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7552 + 2048 = 10112
//
//	Time-stamp: 2023-04-16, 15:14:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION2BG_H
#define GRIT_INSTRUCTION2BG_H

#define instruction2BGTilesLen 7552
extern const unsigned short instruction2BGTiles[3776];

#define instruction2BGMapLen 2048
extern const unsigned short instruction2BGMap[1024];

#define instruction2BGPalLen 512
extern const unsigned short instruction2BGPal[256];

#endif // GRIT_INSTRUCTION2BG_H

//}}BLOCK(instruction2BG)
