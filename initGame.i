# 1 "initGame.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "initGame.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "initGame.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "initGame.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "initGame.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int color;

    int minX;
    int maxX;

    int prevY;
    int isDropping;
    int canJump;
    int yDirection;
    int respawning;
} SPRITE;
# 5 "initGame.c" 2
# 1 "game.h" 1
# 17 "game.h"
extern SPRITE player;
extern SPRITE platform[12];
extern SPRITE ink[4];
extern SPRITE obstacle[5];
extern SPRITE guard[4];
extern SPRITE gate;


OBJ_ATTR shadowOAM[128];
extern int hOff;
extern int vOff;


extern int currLvl;
extern unsigned char* collisionMap;


extern int TID1;
extern int TID2;
extern int TID3;
extern int tilemodX;
extern int tilemodY;


extern int platformNum1;
extern int platformNum2;
extern int totalPlatformsNum1;
extern int totalPlatformsNum2;


extern int energyNum1;
extern int energyNum2;
extern int energyNum3;


extern int scoreNum1;
extern int scoreNum2;
extern int scoreNum3;


extern int paintedPlatforms;
extern int lvlComplete;
extern int score;
extern int gateOpen;


extern int totalScore;
extern int cheat;


typedef enum {UP, DOWN, RIGHT, LEFT, NONE} DIRECTION;
typedef enum {GRAY, RED, BLUE, YELLOW, GREEN, ORANGE, PURPLE} COLOR;
typedef enum {LVL1, LVL2, LVL3, LVL4} LEVEL;
typedef enum {OFF = 12, ON = 14} CHEAT;



void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void resetPlayer();
void drawPlayer();

void initPlatformsLvl1();
void initPlatformsLvl2();
void initPlatformsLvl3();
void initPlatformsLvl4();
void updatePlatforms(SPRITE* p);
void drawPlatforms();
void drawPlatformCnt();

void initInksLvl1();
void initInksLvl2();
void initInksLvl3();
void initInksLvl4();
void updateInks(SPRITE* i);
void resetInks(SPRITE* i);
void changeColor(SPRITE* i);
void drawInks();

void changeColor(SPRITE* i);
void changeColorCheat();

void initObstaclesLvl3();
void initObstaclesLvl4();
void updateObstacles(SPRITE* o);
void drawObstacles();

void updateEnergy();
void drawEnergy();

void initGuardsLvl2();
void initGuardsLvl4();
void updateGuards(SPRITE* g);
void drawGuards();

void animate(SPRITE* s);

void initGate();
void openGate();
void enterGate();
# 6 "initGame.c" 2
# 1 "sound.h" 1



typedef struct {
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
} SONG;

SONG song;
extern int songPaused;

typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;


void playStartSong();
void playGameSong();

void playSong(unsigned int sampleRate, unsigned int length, const signed char* data);

void setupInterrupts();
void interruptHandler();

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void stopSounds();
void pauseSounds();
void unpauseSounds();
# 7 "initGame.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 8 "initGame.c" 2


# 1 "lvl1ColMap.h" 1
# 21 "lvl1ColMap.h"

# 21 "lvl1ColMap.h"
extern const unsigned short lvl1ColMapBitmap[32768];


extern const unsigned short lvl1ColMapPal[256];
# 11 "initGame.c" 2
# 1 "lvl2CollMap.h" 1
# 21 "lvl2CollMap.h"
extern const unsigned short lvl2CollMapBitmap[32768];


extern const unsigned short lvl2CollMapPal[256];
# 12 "initGame.c" 2
# 1 "lvl3CollMap.h" 1
# 21 "lvl3CollMap.h"
extern const unsigned short lvl3CollMapBitmap[32768];


extern const unsigned short lvl3CollMapPal[256];
# 13 "initGame.c" 2
# 1 "lvl4CollMap.h" 1
# 21 "lvl4CollMap.h"
extern const unsigned short lvl4CollMapBitmap[32768];


extern const unsigned short lvl4CollMapPal[256];
# 14 "initGame.c" 2


# 1 "bitsong.h" 1


extern const unsigned int bitsong_sampleRate;
extern const unsigned int bitsong_length;
extern const signed char bitsong_data[];
# 17 "initGame.c" 2


SPRITE player;
SPRITE platform[12];
SPRITE ink[4];
SPRITE obstacle[5];
SPRITE guard[4];
SPRITE gate;



unsigned char* collisionMap;

int paintedPlatforms;

int lvlComplete;

int score;


int totalPlatformsNum1;
int totalPlatformsNum2;


int TID1;
int TID2;
int TID3;
int tilemodX;
int tilemodY;


int gateOpen;





void initGame() {

    hideSprites();


    switch (currLvl) {
        case LVL1:

            collisionMap = (unsigned char*) lvl1ColMapBitmap;


            initInksLvl1();
            initPlatformsLvl1();


            score = 80;
            break;
        case LVL2:

            collisionMap = (unsigned char*) lvl2CollMapBitmap;


            initPlatformsLvl2();
            initInksLvl2();
            initGuardsLvl2();


            score = 80;
            break;
        case LVL3:

            collisionMap = (unsigned char*) lvl3CollMapBitmap;


            initPlatformsLvl3();
            initInksLvl3();
            initObstaclesLvl3();


            score = 90;
            break;
        case LVL4:

            collisionMap = (unsigned char*) lvl4CollMapBitmap;


            initPlatformsLvl4();
            initInksLvl4();
            initGuardsLvl4();
            initObstaclesLvl4();


            score = 130;
            break;
    }



    initPlayer();

    initGate();



    gateOpen = 0;

    paintedPlatforms = 0;

    lvlComplete = 0;



    totalPlatformsNum1 = 1;
    totalPlatformsNum2 = 2;


    stopSounds();

    playSong(bitsong_sampleRate, bitsong_length, bitsong_data);
}


void initPlayer() {

    player.width = 16;
    player.height = 16;

    player.prevY = player.y;

    player.dx = 4;
    player.dy = 8;

    player.direction = NONE;
    player.color = GRAY;

    player.yDirection = DOWN;

    player.isDropping = 0;

    player.canJump = 1;

    player.x = 20;

    player.timeUntilNextFrame = 10;
    player.numOfFrames = 3;

    player.respawning = 0;


    if (currLvl == LVL2) {
        player.y = 24;
    } else {
        player.y = 216;
    }
}


void initGate() {

    gate.height = 24;
    gate.width = 24;


    switch (currLvl) {
        case LVL1:

            gate.x = 216;
            gate.y = 208;

            gate.color = BLUE;


            TID1 = 304;
            TID2 = 336;
            TID3 = 368;

            tilemodX = 26;
            tilemodY = 26;
            break;
        case LVL2:

            gate.x = 216;
            gate.y = 208;

            gate.color = YELLOW;


            TID1 = 432;
            TID2 = 464;
            TID3 = 496;

            tilemodX = 26;
            tilemodY = 26;
            break;
        case LVL3:

            gate.x = 216;
            gate.y = 16;

            gate.color = PURPLE;


            TID1 = 560;
            TID2 = 592;
            TID3 = 624;

            tilemodX = 26;
            tilemodY = 1;
            break;
        case LVL4:

            gate.x = 144;
            gate.y = 80;

            gate.color = RED;


            TID1 = 688;
            TID2 = 720;
            TID3 = 752;

            tilemodX = 17;
            tilemodY = 10;
            break;
    }
}





void initInksLvl1() {

    for (int i = 0; i < 4; i++) {

        ink[i].width = 8;
        ink[i].height = 8;

        ink[i].active = 1;


        switch (i) {
            case 0:
                ink[i].color = GRAY;
                ink[i].x = 200;
                ink[i].y = 220;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 75;
                ink[i].y = 155;
                break;
            case 2:
                ink[i].color = YELLOW;
                ink[i].x = 152;
                ink[i].y = 57;
                break;
            case 3:
                ink[i].color = RED;
                ink[i].x = 128;
                ink[i].y = 216;
        }
    }
}


void initPlatformsLvl1() {

    for (int i = 0; i < 12; i++) {

        platform[i].height = 8;
        platform[i].width = 32;

        platform[i].active = 0;


        int colorPicker = rand() % 3;
        switch (colorPicker) {
            case 0:
                platform[i].color = GREEN;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
        }


        if (i < 2) {
            platform[i].x = 8;
        } else if (i < 4) {
            platform[i].x = 64;
        } else if (i < 6) {
            platform[i].x = 120;
        } else if (i < 9) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }


        if (i == 0 || i == 4 || i == 6) {
            platform[i].y = 72;
        } else if (i == 2 || i == 10) {
            platform[i].y = 104;
        } else if (i == 1 || i == 7) {
            platform[i].y = 136;
        } else if (i == 3 || i == 11) {
            platform[i].y = 168;
        } else if (i == 5 || i == 8) {
            platform[i].y = 200;
        } else {
            platform[i].y = 40;
        }
    }
}




void initInksLvl2() {

    for (int i = 0; i < 4; i++) {

        ink[i].width = 8;
        ink[i].height = 8;

        ink[i].active = 1;


        switch (i) {
            case 0:
                ink[i].color = YELLOW;
                ink[i].x = 228;
                ink[i].y = 24;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 16;
                ink[i].y = 84;
                break;
            case 2:
                ink[i].color = GRAY;
                ink[i].x = 200;
                ink[i].y = 180;
                break;
            case 3:
                ink[i].color = RED;
                ink[i].x = 116;
                ink[i].y = 133;
                break;
        }
    }
}

void initPlatformsLvl2() {
    for (int i = 0; i < 12; i++) {

        platform[i].height = 8;
        platform[i].width = 32;

        platform[i].active = 0;


        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
            case 3:
                platform[i].color = PURPLE;
                break;
        }


        if (i < 3) {
            platform[i].x = 48;
        } else if (i < 6) {
            platform[i].x = 104;
        } else if (i < 9) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }


        if (i == 3|| i == 9) {
            platform[i].y = 40;
        } else if (i == 0 || i == 6) {
            platform[i].y = 72;
        } else if (i == 4 || i == 10) {
            platform[i].y = 104;
        } else if (i == 1 || i == 7) {
            platform[i].y = 136;
        } else if (i == 5 || i == 11) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}

void initGuardsLvl2() {
    for (int i = 0; i < 4; i++) {

        guard[i].width = 8;
        guard[i].height = 16;

        guard[i].active = 1;

        guard[i].dx = 1;

        guard[i].timeUntilNextFrame = 10;
        guard[i].numOfFrames = 3;

        switch (i) {
            case 0:

                guard[i].color = ORANGE;

                guard[i].x = 32;
                guard[i].y = 56;

                guard[i].minX = 8;
                guard[i].maxX = 104;

                guard[i].direction = RIGHT;
                break;
            case 1:
                guard[i].color = YELLOW;
                guard[i].x = 32;
                guard[i].y = 88;
                guard[i].minX = 8;
                guard[i].maxX = 56;
                guard[i].direction = LEFT;
                break;
            case 2:
                guard[i].color = GREEN;
                guard[i].x = 216;
                guard[i].y = 184;
                guard[i].minX = 128;
                guard[i].maxX = 240;
                guard[i].direction = RIGHT;
                break;
            case 3:
                guard[i].color = PURPLE;
                guard[i].x = 216;
                guard[i].y = 216;
                guard[i].minX = 8;
                guard[i].maxX = 240;
                guard[i].direction = LEFT;
                break;
        }
    }
}





void initInksLvl3() {

    for (int i = 0; i < 4; i++) {

        ink[i].width = 8;
        ink[i].height = 8;

        ink[i].active = 1;


        switch (i) {
            case 0:
                ink[i].color = YELLOW;
                ink[i].x = 92;
                ink[i].y = 24;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 176;
                ink[i].y = 88;
                break;
            case 2:
                ink[i].color = RED;
                ink[i].x = 36;
                ink[i].y = 152;
                break;
            case 3:
                ink[i].color = GRAY;
                ink[i].x = 204;
                ink[i].y = 216;
                break;
        }
    }
}


void initPlatformsLvl3() {
    for (int i = 0; i < 12; i++) {

        platform[i].height = 8;
        platform[i].width = 32;

        platform[i].active = 0;


        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = BLUE;
                break;
            case 2:
                platform[i].color = ORANGE;
                break;
            case 3:
                platform[i].color = PURPLE;
                break;
        }


        if (i < 3) {
            platform[i].x = 24;
        } else if (i < 6) {
            platform[i].x = 80;
        } else if (i < 9) {
            platform[i].x = 136;
        } else {
            platform[i].x = 192;
        }


        if (i == 0 || i == 6) {
            platform[i].y = 40;
        } else if (i == 3 || i == 9) {
            platform[i].y = 72;
        } else if (i == 1 || i == 7) {
            platform[i].y = 104;
        } else if (i == 4 || i == 10) {
            platform[i].y = 136;
        } else if (i == 2 || i == 8) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}


void initObstaclesLvl3() {

    for (int i = 0; i < 5; i++) {

        obstacle[i].width = 8;
        obstacle[i].height = 8;

        obstacle[i].dx = 4;
        obstacle[i].dy = 4;

        obstacle[i].timeUntilNextFrame = 10;
        obstacle[i].numOfFrames = 3;


        switch (i) {
            case 0:
                obstacle[i].x = 64;
                obstacle[i].y = 120;
                obstacle[i].direction = DOWN;
                break;
            case 1:
                obstacle[i].x = 120;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 2:
                obstacle[i].x = 120;
                obstacle[i].y = 8;
                obstacle[i].direction = DOWN;
                break;
            case 3:
                obstacle[i].x = 8;
                obstacle[i].y = 56;
                obstacle[i].direction = RIGHT;
                break;
            case 4:
                obstacle[i].x = 176;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
        }
    }
}





void initInksLvl4() {
    for (int i = 0; i < 4; i++) {

        ink[i].width = 8;
        ink[i].height = 8;

        ink[i].active = 1;


        switch (i) {
            case 0:
                ink[i].color = GRAY;
                ink[i].x = 104;
                ink[i].y = 216;
                break;
            case 1:
                ink[i].color = BLUE;
                ink[i].x = 232;
                ink[i].y = 24;
                break;
            case 2:
                ink[i].color = RED;
                ink[i].x = 16;
                ink[i].y = 24;
                break;
            case 3:
                ink[i].color = YELLOW;
                ink[i].x = 144;
                ink[i].y = 216;
                break;
        }
    }
}


void initPlatformsLvl4() {
    for (int i = 0; i < 12; i++) {

        platform[i].height = 8;
        platform[i].width = 32;

        platform[i].active = 0;


        int colorPicker = rand() % 6;
        switch (colorPicker) {
            case 0:
                platform[i].color = RED;
                break;
            case 1:
                platform[i].color = ORANGE;
                break;
            case 2:
                platform[i].color = YELLOW;
                break;
            case 3:
                platform[i].color = GREEN;
                break;
            case 4:
                platform[i].color = BLUE;
                break;
            case 5:
                platform[i].color = PURPLE;
                break;
        }


        if (i < 2) {
            platform[i].x = 8;
        } else if (i < 4) {
            platform[i].x = 48;
        } else if (i < 5) {
            platform[i].x = 64;
        } else if (i < 8) {
            platform[i].x = 88;
        } else if (i < 10) {
            platform[i].x = 160;
        } else {
            platform[i].x = 216;
        }


        if (i == 4 || i == 8) {
            platform[i].y = 40;
        } else if (i == 0 || i == 5 || i == 10) {
            platform[i].y = 72;
        } else if (i == 2) {
            platform[i].y = 104;
        } else if (i == 1 || i == 6) {
            platform[i].y = 136;
        } else if (i == 3 || i == 9) {
            platform[i].y = 168;
        } else {
            platform[i].y = 200;
        }
    }
}


void initGuardsLvl4() {
    for (int i = 0; i < 4; i++) {

        guard[i].width = 8;
        guard[i].height = 16;

        guard[i].active = 1;

        guard[i].dx = 1;

        guard[i].timeUntilNextFrame = 10;
        guard[i].numOfFrames = 3;

        switch (i) {
            case 0:

                guard[i].color = PURPLE;

                guard[i].x = 64;
                guard[i].y = 24;

                guard[i].minX = 64;
                guard[i].maxX = 184;

                guard[i].direction = RIGHT;
                break;
            case 1:
                guard[i].color = RED;
                guard[i].x = 88;
                guard[i].y = 120;
                guard[i].minX = 88;
                guard[i].maxX = 128;
                guard[i].direction = RIGHT;
                break;
            case 2:
                guard[i].color = GREEN;
                guard[i].x = 240;
                guard[i].y = 216;
                guard[i].minX = 136;
                guard[i].maxX = 240;
                guard[i].direction = LEFT;
                break;
            case 3:
                guard[i].color = ORANGE;
                guard[i].x = 184;
                guard[i].y = 88;
                guard[i].minX = 136;
                guard[i].maxX = 184;
                guard[i].direction = LEFT;
                break;
        }
    }
}


void initObstaclesLvl4() {

    for (int i = 0; i < 5; i++) {

        obstacle[i].width = 8;
        obstacle[i].height = 8;

        obstacle[i].dx = 4;
        obstacle[i].dy = 4;

        obstacle[i].timeUntilNextFrame = 10;
        obstacle[i].numOfFrames = 3;


        switch (i) {
            case 0:
                obstacle[i].x = 40;
                obstacle[i].y = 8;
                obstacle[i].direction = DOWN;
                break;
            case 1:
                obstacle[i].x = 80;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 2:
                obstacle[i].x = 40;
                obstacle[i].y = 224;
                obstacle[i].direction = UP;
                break;
            case 3:
                obstacle[i].x = 80;
                obstacle[i].y = 48;
                obstacle[i].direction = UP;
                break;
            case 4:
                obstacle[i].x = 8;
                obstacle[i].y = 16;
                obstacle[i].direction = RIGHT;
                break;
        }
    }
}
