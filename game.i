# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
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
# 6 "game.c" 2
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
# 7 "game.c" 2
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

# 8 "game.c" 2


# 1 "damagesound.h" 1



# 3 "damagesound.h"
extern const unsigned int damagesound_sampleRate;
extern const unsigned int damagesound_length;
extern const signed char damagesound_data[];
# 11 "game.c" 2
# 1 "hitsound.h" 1


extern const unsigned int hitsound_sampleRate;
extern const unsigned int hitsound_length;
extern const signed char hitsound_data[];
# 12 "game.c" 2
# 1 "dyesound.h" 1


extern const unsigned int dyesound_sampleRate;
extern const unsigned int dyesound_length;
extern const signed char dyesound_data[];
# 13 "game.c" 2


OBJ_ATTR shadowOAM[128];


int hOff;
int vOff;
int time;


int energyNum1;
int energyNum2;
int energyNum3;


int platformNum1;
int platformNum2;


inline unsigned char colorAt(int x, int y) {
    return collisionMap[((y) * (256) + (x))];
}





void updateGame() {

    time++;


    updatePlayer();


    for (int i = 0; i < 4; i++) {

        if (ink[i].active == 1) {
            updateInks(&ink[i]);

        } else {
            resetInks(&ink[i]);
        }
    }


    for (int i = 0; i < 12; i++) {
        updatePlatforms(&platform[i]);
    }


    if (currLvl == LVL2 || currLvl == LVL4) {

        for (int i = 0; i < 4; i++) {
            updateGuards(&guard[i]);
        }
    }


    if (currLvl == LVL3 || currLvl == LVL4) {

        for (int i = 0; i < 5; i++) {
            updateObstacles(&obstacle[i]);
        }
    }


    if (player.respawning == 1) {

        if (time % 20 == 0) {
            player.respawning = 0;
        }
    }


    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && (cheat == ON)) {
        changeColorCheat();
    }


    updateEnergy();


    if ((paintedPlatforms == 12) && (gateOpen == 0)) {

        openGate();

        gateOpen = 1;
    }


    enterGate();
}


void updatePlayer() {

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;


    animate(&player);


    if (player.respawning == 0) {


        if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && (player.canJump == 1)) {

            player.yDirection = UP;

            player.direction = UP;

            player.prevY = player.y;

            player.canJump = 0;

            score -= 1;
        }


        if ((player.yDirection == UP)) {
            if (

                (colorAt(leftX, topY - player.dy) == 1) &&
                (colorAt(rightX, topY - player.dy) == 1) &&

                (player.y > (player.prevY - 45))
                )
            {

                player.y -= player.dy;
            } else {


                player.yDirection = DOWN;

                player.direction = DOWN;
            }
        }


        if ((!(~(oldButtons) & ((1<<7))) && (~(buttons) & ((1<<7))))) {

            player.yDirection = DOWN;

            player.direction = DOWN;

            player.prevY = player.y;

            player.isDropping = 1;
        }


        if ((player.isDropping == 0) && (player.yDirection == DOWN)) {

            if (

                (colorAt(leftX, bottomY + player.dy) == 1) &&
                (colorAt(rightX, bottomY + player.dy) == 1)
            ) {

                player.y += player.dy;
            } else {

                player.canJump = 1;

                player.direction = NONE;
            }

        } else if ((player.isDropping == 1) && (player.yDirection == DOWN)) {

            if (


                (colorAt(leftX, bottomY + player.dy)) &&
                (colorAt(rightX, bottomY + player.dy)) &&

                (player.y < (player.prevY + 16))
            ) {

                player.y += player.dy;
            } else {

                player.isDropping = 0;
            }
        }


        if ((~(buttons) & ((1<<5)))) {
            if (

                (colorAt(leftX - player.dx, topY) == 1) &&
                (colorAt(leftX - player.dy, bottomY) == 1)
                )
            {
                player.x -= player.dx;
                player.direction = LEFT;
            }
        }

        if ((~(buttons) & ((1<<4)))) {
            if (

                (colorAt(rightX + player.dx, topY) == 1) &&
                (colorAt(rightX + player.dy, bottomY) == 1)
                )
            {
                player.x += player.dx;
                player.direction = RIGHT;
            }
        }
    }


    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;


    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 256 - 240) hOff = 256 - 240;
    if (vOff > 256 - 160) vOff = 256 - 160;
}


void animate(SPRITE* s) {

    if (s->timeUntilNextFrame % 10 == 0) {
        s->frame = (s->frame + 1) % s->numOfFrames;
    }


    while (s->timeUntilNextFrame != 0) {
        s->timeUntilNextFrame--;
    }


    if (s->timeUntilNextFrame == 0) {
        s->timeUntilNextFrame = 10;
    }
}


void updateInks(SPRITE* i) {

    if (collision(player.x, player.y, player.width, player.height, i->x, i->y, i->width, i->height)) {

        changeColor(i);

        i->active = 0;

        playSoundA(dyesound_data, dyesound_length, 0);
    }
}


void resetInks(SPRITE* i) {

    if (time % 100 == 0) {
        i->active = 1;
    }
}


void changeColor(SPRITE* i) {

    if (i->color == GRAY) {

        player.color = GRAY;

    } else if (player.color == GRAY) {

        player.color = i->color;
    } else {

        if (player.color == BLUE) {

            if (i->color == YELLOW) {
                player.color = GREEN;

            } else if (i->color == RED) {
                player.color = PURPLE;
            }

        } else if (player.color == YELLOW) {

            if (i->color == BLUE) {
                player.color = GREEN;

            } else if (i->color == RED) {
                player.color = ORANGE;
            }

        } else if (player.color == RED) {

            if (i->color == BLUE) {
                player.color = PURPLE;

            } else if (i->color == YELLOW) {
                player.color = ORANGE;
            }
        }
    }
}


void changeColorCheat() {
    switch (player.color) {
        case GRAY:
            player.color = RED;
            break;
        case RED:
            player.color = ORANGE;
            break;
        case ORANGE:
            player.color = YELLOW;
            break;
        case YELLOW:
            player.color = GREEN;
            break;
        case GREEN:
            player.color = BLUE;
            break;
        case BLUE:
            player.color = PURPLE;
            break;
        case PURPLE:
            player.color = GRAY;
            break;
    }
}


void updatePlatforms(SPRITE* p) {

    if (collision(player.x, player.y, player.width, player.height, p->x, (p->y - 1), p->width, 1)) {

        if ((p->active == 0) && (player.color == p->color)) {

            p->active = 1;

            paintedPlatforms++;
        }
    }


    platformNum1 = paintedPlatforms / 10;
    platformNum2 = paintedPlatforms % 10;
}


void openGate() {

    int currTID;

    for (int j = 0; j < 3; j++) {

        switch (j) {
            case 0:
                currTID = TID1;
                break;
            case 1:
                currTID = TID2;
                break;
            case 2:
                currTID = TID3;
                break;
        }

        for (int i = 0; i < 4; i++) {



            ((screenblock *)0x6000000)[31].tilemap[((tilemodY) * (32) + ((tilemodX + i)))] = (((currTID + i) & 0x3FF));
        }


        tilemodY += 1;
    }
}


void enterGate() {

    if (collision(player.x, player.y, player.width, player.height, gate.x, gate.y, gate.width, gate.height)) {

        if ((paintedPlatforms == 12) && (player.color == gate.color)) {

            lvlComplete = 1;
        }
    }
}


void updateObstacles(SPRITE* o) {

    int leftX = o->x;
    int rightX = o->x + o->width - 1;
    int topY = o->y;
    int bottomY = o->y + o->height - 1;


    animate(o);


    if (o->direction == UP) {

        if ((colorAt(leftX, topY - o->dy) == 1) &&
            (colorAt(rightX, topY - o->dy) == 1)) {

                o->y -= o->dy;
        } else {

            o->direction = DOWN;
        }
    }


    if (o->direction == DOWN) {

        if ((colorAt(leftX, bottomY + o->dy) == 1) &&
            (colorAt(rightX, bottomY + o->dy) == 1)) {

                o->y += o->dy;
        } else {

            o->direction = UP;
        }
    }


    if (o->direction == RIGHT) {

        if ((colorAt(rightX + o->dx, topY) == 1) &&
            (colorAt(rightX + o->dy, bottomY) == 1)) {

                o->x += o->dx;
        } else {

            o->direction = LEFT;
        }
    }


    if (o->direction == LEFT) {

        if ((colorAt(leftX - o->dx, topY) == 1) &&
            (colorAt(leftX - o->dy, bottomY) == 1)) {

                o->x -= o->dx;
        } else {

            o->direction = RIGHT;
        }
    }


    if (collision(player.x, player.y, player.width, player.height, o->x, o->y, o->width, o->height)) {

        playSoundA(hitsound_data, hitsound_length, 0);

        score -= 5;

        resetPlayer();
    }
}


void resetPlayer() {

    player.direction = NONE;


    player.canJump = 1;


    player.x = 20;
    player.y = 216;

    if (currLvl == LVL2) {
        player.y = 24;
    }



    player.prevY = player.y;


    player.respawning = 1;
}


void updateEnergy() {

    energyNum1 = (score / 10) / 10;

    energyNum2 = (score / 10) % 10;

    energyNum3 = (score % 10);
}


void updateGuards(SPRITE* g) {

    if (player.y == g->y) {

        g->dx = 2;

        if (player.x > g->x) {

            if (g->x <= g->maxX - 1) {

                g->x += g->dx;
                g->direction = RIGHT;
            }

        } else if (player.x < g->x) {

            if (g->x >= g->minX + 1) {

                g->x -= g->dx;
                g->direction = LEFT;
            }
        }
    } else {

        g->dx = 1;

        if (g->direction == RIGHT) {

            if (g->x <= g->maxX - 1) {

                    g->x += g->dx;
            } else {

                g->direction = LEFT;
            }
        }


        if (g->direction == LEFT) {

            if (g->x >= g->minX + 1) {

                    g->x -= g->dx;
            } else {

                g->direction = RIGHT;
            }
        }
    }


    animate(g);


    if ((g->active == 1) && (collision(g->x, g->y, g->width, g->height, player.x, player.y, player.width, player.height))) {

        if ((player.direction == DOWN) && (player.color == g->color)) {

            playSoundA(damagesound_data, damagesound_length, 0);

            g->active = 0;

        } else {

            playSoundA(hitsound_data, hitsound_length, 0);

            score -= 5;

            resetPlayer();
        }
    }
}





void drawGame() {

    drawPlayer();

    drawInks();

    drawPlatforms();


    if (currLvl == LVL2 || currLvl == LVL4) {
        drawGuards();
    }


    if (currLvl == LVL3 || currLvl == LVL4) {
        drawObstacles();
    }


    drawEnergy();
    drawPlatformCnt();


    waitForVBlank();

    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM) / 2);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void drawPlayer() {


    if (player.respawning == 1) {

        (*(unsigned short *)0x400004c) = ((1&0xF) << 8) | ((1&0xF) << 12);
        shadowOAM[10].attr0 = (1<<12) | (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);;

    } else {
        shadowOAM[10].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
    }


    if (player.direction == LEFT) {

        shadowOAM[10].attr1 = (1<<14) | ((player.x - hOff) & 0x1FF) | (1<<12);
    } else {
        shadowOAM[10].attr1 = (1<<14) | ((player.x - hOff) & 0x1FF);
    }




    shadowOAM[10].attr2 = (((player.color) & 0xF) << 12) | ((((player.frame * 2)) * 32 + ((player.direction * 2))) & 0x3FF);
}


void drawGuards() {

    for (int i = 0; i < 4; i++) {

        if (guard[i].active) {

            if (((guard[i].y - vOff < 160) && (guard[i].y - vOff > 0)) && ((guard[i].x - hOff < 240) && (guard[i].x - hOff > 0))) {

                shadowOAM[11 + i].attr0 = (0<<13) | (2<<14) | ((guard[i].y - vOff) & 0xFF);

                if (guard[i].direction == LEFT) {
                    shadowOAM[11 + i].attr1 = (0<<14) | ((guard[i].x - hOff) & 0x1FF) | (1<<12);
                } else {
                    shadowOAM[11 + i].attr1 = (0<<14) | ((guard[i].x - hOff) & 0x1FF);
                }


                shadowOAM[11 + i].attr2 = (((guard[i].color) & 0xF) << 12) | (((guard[i].frame * 2) * 32 + (10)) & 0x3FF);

            } else {
                shadowOAM[11 + i].attr0 = (2<<8);
            }

        } else {
            shadowOAM[11 + i].attr0 = (2<<8);
        }
    }
}


void drawInks() {

    for (int i = 0; i < 4; i++) {

        if (((ink[i].y - vOff < 160) && (ink[i].y - vOff > 0)) && ((ink[i].x - hOff < 240) && (ink[i].x - hOff > 0))) {

            if (ink[i].active == 1) {

                shadowOAM[32 + i].attr0 = (0<<13) | (0<<14) | ((ink[i].y - vOff) & 0xFF);


            } else {


                (*(unsigned short *)0x4000050) = (1 << 6) | (1 << (0 +8));

                (*(unsigned short *)0x4000052) = (6 & 0x1F) | ((10&0x1F) << 8);

                shadowOAM[32 + i].attr0 = (0<<13) | (0<<14) | ((ink[i].y - vOff) & 0xFF) | (1<<10);
            }

            shadowOAM[32 + i].attr1 = (0<<14) | ((ink[i].x - hOff) & 0x1FF);

            shadowOAM[32 + i].attr2 = (((ink[i].color) & 0xF) << 12) | (((3) * 32 + (11)) & 0x3FF);

        } else {

            shadowOAM[32 + i].attr0 = (2<<8);

        }
    }
}


void drawPlatforms() {

    for (int i = 0; i < 12; i++) {

        if (((platform[i].y - vOff < 160) && (platform[i].y - vOff > 0))) {
            shadowOAM[15 + i].attr0 = (0<<13) | (1<<14) | ((platform[i].y - vOff) & 0xFF);
            shadowOAM[15 + i].attr1 = (1<<14) | ((platform[i].x - hOff) & 0x1FF);

            if (platform[i].active == 0) {


                shadowOAM[15 + i].attr2 = (((platform[i].color) & 0xF) << 12) | (((0) * 32 + (16)) & 0x3FF);

            } else {

                shadowOAM[15 + i].attr2 = (((platform[i].color) & 0xF) << 12) | (((1) * 32 + (16)) & 0x3FF);
            }

        } else {
            shadowOAM[15 + i].attr0 = (2<<8);
        }
    }
}


void drawObstacles() {

    for (int i = 0; i < 5; i++) {

        if (((obstacle[i].y - vOff < 160) && (obstacle[i].y - vOff > 0)) && ((obstacle[i].x - hOff < 240) && (obstacle[i].x - hOff > 0))) {
            shadowOAM[27 + i].attr0 = (0<<13) | (0<<14) | ((obstacle[i].y - vOff) & 0xFF);
            shadowOAM[27 + i].attr1 = (0<<14) | ((obstacle[i].x - hOff) & 0x1FF);

            shadowOAM[27 + i].attr2 = (((0) & 0xF) << 12) | (((obstacle[i].frame) * 32 + (11)) & 0x3FF);

        } else {
            shadowOAM[27 + i].attr0 = (2<<8);
        }
    }
}


void drawEnergy() {

    shadowOAM[3].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
    shadowOAM[3].attr1 = (3<<14) | ((150) & 0x1FF);
    shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((7) * 32 + (12)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[2].attr1 = (0<<14) | ((194) & 0x1FF);
    shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (energyNum1)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[1].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[1].attr1 = (0<<14) | ((199) & 0x1FF);
    shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (energyNum2)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[0].attr1 = (0<<14) | ((204) & 0x1FF);
    shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (energyNum3)) & 0x3FF) | (((0) & 3) << 10);

}


void drawPlatformCnt() {

    shadowOAM[9].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
    shadowOAM[9].attr1 = (3<<14) | ((20) & 0x1FF);
    shadowOAM[9].attr2 = (((0) & 0xF) << 12) | (((7) * 32 + (0)) & 0x3FF) | (((0) & 3) << 10);

    shadowOAM[8].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
    shadowOAM[8].attr1 = (2<<14) | ((84) & 0x1FF);
    shadowOAM[8].attr2 = (((0) & 0xF) << 12) | (((7) * 32 + (8)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[7].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[7].attr1 = (0<<14) | ((22) & 0x1FF);
    shadowOAM[7].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (platformNum1)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[6].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[6].attr1 = (0<<14) | ((27) & 0x1FF);
    shadowOAM[6].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (platformNum2)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[5].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[5].attr1 = (0<<14) | ((36) & 0x1FF);
    shadowOAM[5].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (totalPlatformsNum1)) & 0x3FF) | (((0) & 3) << 10);


    shadowOAM[4].attr0 = (0<<13) | (0<<14) | ((145) & 0xFF);
    shadowOAM[4].attr1 = (0<<14) | ((42) & 0x1FF);
    shadowOAM[4].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (totalPlatformsNum2)) & 0x3FF) | (((0) & 3) << 10);
}
