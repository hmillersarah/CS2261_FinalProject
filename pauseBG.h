
//{{BLOCK(pauseBG)

//======================================================================
//
//	pauseBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 282 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9024 + 2048 = 11584
//
//	Time-stamp: 2023-04-18, 23:09:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBGTilesLen 9024
extern const unsigned short pauseBGTiles[4512];

#define pauseBGMapLen 2048
extern const unsigned short pauseBGMap[1024];

#define pauseBGPalLen 512
extern const unsigned short pauseBGPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBG)
