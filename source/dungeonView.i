# 1 "dungeonView.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "dungeonView.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 70 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 91 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int direction;
    int velocity;
    int horVelocity;
    int didDamage;
} ANISPRITE;
# 208 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 219 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 259 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 295 "myLib.h"
typedef void (*ihp)(void);
# 315 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);






typedef struct {

    int type;
    int health;


    ANISPRITE sprite;


    int doesWander;
    int movementCounter;
    int isMoving;
    int timeToMove;
    int timeToRun;
    int timeToWait;


    int randomSpeech;


    int merchantType;


    int isStationary;
    int isHostile;
    int shootCounter;
    int attackedPlayer;
    int hasWaited;
    ANISPRITE hostileArrows[6];
    ANISPRITE bow;
    int damageCooldown;
    int canJump;
    int againstWallLeft;
    int againstWallRight;
    int isJumping;
    int triedJumping;

    int moneyDrop;

    int distanceToRun;
    int distanceToAttack;
    int waitingTime;


    int questType;
    int drawIcon;




} VILLAGER;


typedef struct {
    char collisionMapColor;
    int villagerCount;


    int enemyDefeated;

    int questTownType;
    int merchantTownType;

    int floorRow;
    int index;

    int isDungeon;
# 402 "myLib.h"
} TOWN;
# 2 "dungeonView.c" 2
# 1 "title.h" 1
# 22 "title.h"
extern const unsigned short titleTiles[3120];


extern const unsigned short titleMap[1024];


extern const unsigned short titlePal[256];
# 3 "dungeonView.c" 2
# 1 "dungeonView.h" 1

enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
# 26 "dungeonView.h"
extern int hOff;
extern int vOff;
# 40 "dungeonView.h"
void initDungeonView();
void resumeDungeonView();
void initDungeonViewPlayer();
void initDungeonViewVillagers();
void initDungeonViewButtons();
void resumeDungeonView();
void updateDungeonView();
void updateDungeonViewPlayer();
void updateDungeonViewEnemies();
void applyGravity();
void animateDungeonViewPlayer();
void drawDungeonView();
void animatePlayer();
void drawDungeonView();
void drawDungeonViewPlayer();
void drawDungeonViewVillagers();
# 4 "dungeonView.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "dungeonView.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1568];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 6 "dungeonView.c" 2

# 1 "global.h" 1
volatile extern int playerHealth;
volatile extern int playerMoney;
volatile extern int playerArrows;
volatile extern int playerShootSpeed;
extern int playerHasBow;


extern TOWN currentTown;
extern TOWN towns[6];

extern ANISPRITE aButton;
extern ANISPRITE bButton;







enum {
    NONE,
    BOWGIVER,
    BOUNTY,
    BOUNTYDEST,
    LETTERGIVER,
    LETTERDEST
};


enum {
    BOWUPGRADE,
    KEY
};

enum {
    NORMIE,
    MERCHANT,
    DOCTOR,
    QUESTGIVER,
    HOSTILE,
    GOBLIN,
    SKELETON,
    BOSS
};


enum {SMALLTOWN, BIGTOWN, CASTLEA, CASTLEB};



extern int textViewChoice;
extern int merchantViewChoice;
extern int battleViewChoice;
extern int returnToMap;
extern int meadCollected;
extern int touchingMead;
extern int bountyStarted;
extern int bountyKilled;
extern int bountyCompleted;
extern int letterStarted;
extern int letterRecieved;
extern int letterCompleted;
extern int bossDead;
extern int battleViewDefeated;
extern int boughtKey;
extern int dungeonKeys;


extern int cheatActive;
extern char cheatCode[4];
extern char cheatEnteredCode[];



extern int inMode4;

extern ANISPRITE arrows[];



void initializeGlobal();


void initalizeMapViewButtons();

void updateGlobal();

void drawGlobal();

void drawButtons(int hOff, int vOff);

void drawNumber(int value, int col, int row);

void resetGlobal();
# 8 "dungeonView.c" 2

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
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




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
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
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

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


typedef __builtin_va_list __va_list;
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
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/time.h" 1 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 1 3
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_timespec.h" 1 3
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_timespec.h" 3
struct timespec {
 time_t tv_sec;
 long tv_nsec;
};
# 39 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 2 3
# 58 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/timespec.h" 3
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3







struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;






};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *restrict _s,
        size_t _maxsize, const char *restrict _fmt,
        const struct tm *restrict _t);







char *asctime_r (const struct tm *restrict,
     char *restrict);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *restrict,
     struct tm *restrict);
struct tm *localtime_r (const time_t *restrict,
     struct tm *restrict);


# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
void _tzset_r (struct _reent *);

typedef struct __tzrule_struct
{
  char ch;
  int m;
  int n;
  int d;
  int s;
  time_t change;
  long offset;
} __tzrule_type;

typedef struct __tzinfo_struct
{
  int __tznorth;
  int __tzyear;
  __tzrule_type __tzrule[2];
} __tzinfo_type;

__tzinfo_type *__gettzinfo (void);
# 178 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 1 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_sigset.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_sigset.h" 3
typedef unsigned long __sigset_t;
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 2 3




typedef __sigset_t sigset_t;
# 119 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
typedef void (*_sig_func_ptr)(int);

struct sigaction
{
 _sig_func_ptr sa_handler;
 sigset_t sa_mask;
 int sa_flags;
};
# 153 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/signal.h" 3
typedef struct sigaltstack {
  void *ss_sp;
  int ss_flags;
  size_t ss_size;
} stack_t;
# 7 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 2 3



typedef int sig_atomic_t;
# 22 "/opt/devkitpro/devkitARM/arm-none-eabi/include/signal.h" 3
struct _reent;

_sig_func_ptr _signal_r (struct _reent *, int, _sig_func_ptr);
int _raise_r (struct _reent *, int);


_sig_func_ptr signal (int, _sig_func_ptr);
int raise (int);
void psignal (int, const char *);



# 179 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 2 3







int clock_settime (clockid_t clock_id, const struct timespec *tp);
int clock_gettime (clockid_t clock_id, struct timespec *tp);
int clock_getres (clockid_t clock_id, struct timespec *res);



int timer_create (clockid_t clock_id,
  struct sigevent *restrict evp,
 timer_t *restrict timerid);



int timer_delete (timer_t timerid);



int timer_settime (timer_t timerid, int flags,
 const struct itimerspec *restrict value,
 struct itimerspec *restrict ovalue);
int timer_gettime (timer_t timerid, struct itimerspec *value);
int timer_getoverrun (timer_t timerid);



int nanosleep (const struct timespec *rqtp, struct timespec *rmtp);
# 10 "dungeonView.c" 2

# 1 "dungeon.h" 1
# 22 "dungeon.h"

# 22 "dungeon.h"
extern const unsigned short dungeonTiles[3088];


extern const unsigned short dungeonMap[4096];


extern const unsigned short dungeonPal[256];
# 12 "dungeonView.c" 2
# 1 "dungeonCollision.h" 1
# 20 "dungeonCollision.h"
extern const unsigned short dungeonCollisionBitmap[262144];
# 13 "dungeonView.c" 2



# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void pauseSoundA();
void pauseSoundB();
void unpauseSound();
void stopSound();
void stopSoundA();
void stopSoundB();
# 53 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 17 "dungeonView.c" 2
# 1 "arrowShot.h" 1


extern const unsigned int arrowShot_sampleRate;
extern const unsigned int arrowShot_length;
extern const signed char arrowShot_data[];
# 18 "dungeonView.c" 2
# 1 "enemyDie.h" 1


extern const unsigned int enemyDie_sampleRate;
extern const unsigned int enemyDie_length;
extern const signed char enemyDie_data[];
# 19 "dungeonView.c" 2
# 1 "enemyHit.h" 1


extern const unsigned int enemyHit_sampleRate;
extern const unsigned int enemyHit_length;
extern const signed char enemyHit_data[];
# 20 "dungeonView.c" 2
# 1 "playerHit.h" 1


extern const unsigned int playerHit_sampleRate;
extern const unsigned int playerHit_length;
extern const signed char playerHit_data[];
# 21 "dungeonView.c" 2
# 1 "walking.h" 1


extern const unsigned int walking_sampleRate;
extern const unsigned int walking_length;
extern const signed char walking_data[];
# 22 "dungeonView.c" 2
# 1 "playerJump.h" 1


extern const unsigned int playerJump_sampleRate;
extern const unsigned int playerJump_length;
extern const signed char playerJump_data[];
# 23 "dungeonView.c" 2
# 1 "mainTheme.h" 1


extern const unsigned int mainTheme_sampleRate;
extern const unsigned int mainTheme_length;
extern const signed char mainTheme_data[];
# 24 "dungeonView.c" 2


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

int screenPan;

int savedWorldRow;
int savedWorldCol;
int savedvOff;
int savedhOff;

int playerTookDamage;
int damageTimer;
int playerShootCooldown;



int playerIsMoving;
int storedMusicDuration;


VILLAGER enemies[6];
VILLAGER boss;

ANISPRITE mead;
ANISPRITE rainingMeads[10];
int rainingMeadTimer;
int meadTimerStarted;


ANISPRITE player;
ANISPRITE arrows[4];
ANISPRITE bow;



void initDungeonView() {



    textViewChoice = -1;

    vOff = 0;
    hOff = 0;

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;

    for (int i = 0; i < 10; i++) {
        rainingMeads[i].width = 16;
        rainingMeads[i].height = 16;
        rainingMeads[i].rdel = 1;
        rainingMeads[i].cdel = 1;
        rainingMeads[i].worldRow = 0;
        rainingMeads[i].worldCol = (240 /10)*i;
        rainingMeads[i].hide = 1;
    }

    meadTimerStarted = 0;
    rainingMeadTimer = 0;

    mead.width = 16;
    mead.height = 16;
    mead.rdel = 1;
    mead.cdel = 1;
    mead.worldRow = 392;
    mead.worldCol = 370;
    mead.hide = 1;

    initDungeonViewPlayer();
    initDungeonViewEnemies();
    initDungeonViewButtons();
    initDungeonViewArrows();
}



void initDungeonViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 70 + vOff;
    player.worldCol = 240/2 + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;


}

void initDungeonViewEnemies() {




    enemies[0].sprite.worldRow = 400;
    enemies[0].sprite.worldCol = 380;
    enemies[0].type = GOBLIN;
    enemies[0].doesWander = 1;

    enemies[1].sprite.worldRow = (512) - 80;
    enemies[1].sprite.worldCol = 400;
    enemies[1].type = GOBLIN;
    enemies[1].doesWander = 1;


    enemies[2].sprite.worldRow = (512) - 80;
    enemies[2].sprite.worldCol = 420;
    enemies[2].type = HOSTILE;
    enemies[2].doesWander = 1;


    enemies[3].sprite.worldRow = 70;
    enemies[3].sprite.worldCol = 272;
    enemies[3].type = HOSTILE;
    enemies[3].doesWander = 0;
    enemies[3].isHostile = 1;
    enemies[3].isStationary = 1;

    enemies[4].sprite.worldRow = 292;
    enemies[4].sprite.worldCol = 280;
    enemies[4].type = HOSTILE;
    enemies[4].doesWander = 0;


    enemies[5].sprite.worldRow = (512) - 80;
    enemies[5].sprite.worldCol = 450;
    enemies[5].type = BOSS;
    enemies[5].doesWander = 0;







    for(int i = 0; i < 6; i++) {
        enemies[i].sprite.width = 16;
        enemies[i].sprite.height = 16;
        enemies[i].sprite.rdel = 1;
        enemies[i].sprite.cdel = 1;


        enemies[i].sprite.aniCounter = 0;
        enemies[i].sprite.curFrame = 0;
        enemies[i].sprite.numFrames = 3;


        enemies[i].sprite.direction = 1;
        enemies[i].isMoving = 0;
        enemies[i].isHostile = 0;

        enemies[i].sprite.hide = 0;


        switch(enemies[i].type) {

            case (HOSTILE):




                    enemies[i].health = 3;


                    enemies[i].shootCounter = 20+(20*i);

                    for (int j = 0; j < 6; j++) {
                        enemies[i].hostileArrows[j].width = 16;
                        enemies[i].hostileArrows[j].height = 16;
                        enemies[i].hostileArrows[j].rdel = 1;
                        enemies[i].hostileArrows[j].cdel = 1;
                        enemies[i].hostileArrows[j].worldRow = enemies[i].sprite.worldRow;
                        enemies[i].hostileArrows[j].worldCol = enemies[i].sprite.worldCol;
                        enemies[i].hostileArrows[j].hide = 1;
                        enemies[i].hostileArrows[j].direction = 1;

                    }


                    enemies[i].bow.width = 16;
                    enemies[i].bow.height = 16;
                    enemies[i].bow.rdel = 1;
                    enemies[i].bow.cdel = 1;
                    enemies[i].bow.worldRow = enemies[i].sprite.worldRow;
                    enemies[i].bow.worldCol = enemies[i].sprite.worldCol;
                    enemies[i].bow.hide = 1;
                    break;
                break;
            case(GOBLIN):

                enemies[i].health = 3;

                break;

            case(BOSS):
                enemies[i].health = 6;

                enemies[i].sprite.width = 32;
                enemies[i].sprite.height = 32;

                break;
        }

    }


}

void initDungeonViewArrows() {
    for (int i = 0; i < 4; i++) {
        arrows[i].width = 16;
        arrows[i].height = 16;
        arrows[i].rdel = 1;
        arrows[i].cdel = 1;
        arrows[i].worldRow = player.worldRow;
        arrows[i].worldCol = player.worldCol;
        arrows[i].hide = 1;
    }


    bow.width = 16;
    bow.height = 16;
    bow.rdel = 1;
    bow.cdel = 1;
    bow.worldRow = player.worldRow;
    bow.worldCol = player.worldCol;
    bow.hide = 1;
}



void initDungeonViewButtons() {
    aButton.width = 16;
    aButton.height = 16;
    aButton.rdel = 1;
    aButton.cdel = 1;
    aButton.worldRow = player.worldRow-24;
    aButton.worldCol = player.worldCol;
    aButton.hide = 1;

    bButton.width = 16;
    bButton.height = 16;
    bButton.rdel = 1;
    bButton.cdel = 1;
    bButton.worldRow = player.worldRow-24;
    bButton.worldCol = player.worldCol;
    bButton.hide = 1;
}

void resumeDungeonView() {

    waitForVBlank();


    vOff = savedvOff;
    hOff = savedhOff;

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x0400001E) = vOff;
    (*(volatile unsigned short *)0x0400001C) = hOff;

    player.worldRow = savedWorldRow;
    player.worldCol = savedWorldCol;

}


void updateDungeonView() {
    playerTookDamage = 0;
    if (enemies[5].health <=0) {
        bossDead = 1;
    }

    updateMead();

    updateDungeonViewPlayer();
    updateDungeonViewEnemies();
    updateDungeonViewArrows();
    updateDungeonViewHostileArrows();

    if (collision(player.worldCol, player.worldRow, player.width, player.height, mead.worldCol, mead.worldRow, mead.width, mead.height)) {
        touchingMead = 1;
        aButton.hide = 0;
    } else {
        touchingMead = 0;
        aButton.hide = 1;
    }



    if (damageTimer > 0) {
        damageTimer--;
    }
    if (playerTookDamage && damageTimer < 1) {
        playerHealth -= 1;
        playerTookDamage = 0;
        damageTimer = 60;
        playSoundB(playerHit_data, playerHit_length, 0);

    }



}

void updateMead() {



    if ((bossDead) && !meadCollected) {


        if (!meadTimerStarted && rainingMeadTimer == 0) {
            meadTimerStarted = 1;
            playSoundA(mainTheme_data, mainTheme_length, 1);
        }

        if (meadTimerStarted) {
            rainingMeadTimer++;
# 364 "dungeonView.c"
            if (rainingMeadTimer / 80 == 0) {
                for (int i = 0; i < 10; i++) {
                    int random = rand()%10;
                    if (rainingMeads[i].hide == 1) {
                        rainingMeads[i].hide = 0;
                        break;
                    }
                }
            }


            for (int i = 0; i < 10; i++) {


                if (rainingMeads[i].hide == 0) {

                        rainingMeads[i].velocity = (int) rainingMeads[i].velocity + (-32*.05);


                        rainingMeads[i].worldRow = (int) rainingMeads[i].worldRow - round(rainingMeads[i].velocity*.1);


                    } else {
                        rainingMeads[i].velocity = 0;

                        rainingMeads[i].worldRow = 0;
                    }







            }
        }

        if (rainingMeadTimer > 450 ) {
            mead.hide = 0;
            meadTimerStarted = 0;


            if (((dungeonCollisionBitmap[(int) (mead.worldRow + mead.height - round(mead.velocity*.1)) * 512 +
                mead.worldCol])
                && (dungeonCollisionBitmap[(int) (mead.worldRow + mead.height - round(mead.velocity*.1)) * 512
                + (mead.worldCol + mead.width - mead.cdel)]))) {

                    mead.velocity = (int) mead.velocity + (-32*.08);

                    mead.worldRow = (int) mead.worldRow - round(mead.velocity*.1);


            } else {
                mead.velocity = 0;
            }
        }
    }
}


void updateDungeonViewPlayer() {
    initDungeonViewButtons();

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;
    int canJump = 1;

    unsigned short collisionColorLeft = player.worldRow - vOff > 0 && (dungeonCollisionBitmap[(player.worldRow - player.rdel) * 512 + player.worldCol]);
    unsigned short collisionColorRight = (dungeonCollisionBitmap[(player.worldRow - player.rdel) * 512 +
                (player.worldCol + player.width - player.cdel)]);

    if (collisionColorLeft == ((31) | (0)<<5 | (0)<<10) || collisionColorRight == ((31) | (0)<<5 | (0)<<10)) {
        playerHealth = 0;
    }
    if (((dungeonCollisionBitmap[(int) (player.worldRow + player.height - round(player.velocity*0.1)) * 512 +
            player.worldCol])
        && (dungeonCollisionBitmap[(int) (player.worldRow + player.height - round(player.velocity*0.1)) * 512
            + (player.worldCol + player.width - player.cdel)]))) {

        player.velocity = (int) player.velocity + (-32*.08);
        canJump = 0;


        player.worldRow = (int) player.worldRow - round(player.velocity*.1);
        aButton.worldRow = (int) aButton.worldRow - round(player.velocity*.1);
        bButton.worldRow = (int) bButton.worldRow - round(player.velocity*.1);

        if (player.worldRow - vOff + player.height > (160 - 35) && (vOff + 160 < 512 - 10)) {

            vOff = (int) vOff - round(player.velocity*.1);
        }
    } else {

        player.velocity = 0;

        canJump = 1;
    }


    playerIsMoving = 0;

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        playerIsMoving = 1;
        player.direction = -1;
        if (player.worldCol - hOff > 0 && (dungeonCollisionBitmap[player.worldRow * 512
            + (player.worldCol - player.cdel)])
            && (dungeonCollisionBitmap[(player.worldRow + player.height - player.rdel) * 512
            + (player.worldCol - player.cdel)])) {

            player.worldCol -= player.cdel;
            aButton.worldCol -= player.cdel;
            bButton.worldCol -= player.cdel;

            if (hOff > 0 && player.worldCol - hOff < 240 / 2) {
                hOff--;
            }
        }


    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        playerIsMoving = 1;
        player.direction = 1;
        if (player.worldCol - hOff + player.width < 240 && (dungeonCollisionBitmap[player.worldRow * 512 +
                (player.worldCol + player.width)])
            && (dungeonCollisionBitmap[(player.worldRow + player.height - player.rdel) * 512 +
                (player.worldCol + player.width)])) {

            player.worldCol += player.cdel;
            aButton.worldCol += player.cdel;
            bButton.worldCol += player.cdel;


            if (hOff + 240 < 512 && player.worldCol - hOff >= 240 / 2) {
                hOff++;
            }
        }


    }


    if (!soundB.isPlaying && playerIsMoving) {
        playSoundB(walking_data, walking_length, 0);
    } else {
        if (!playerIsMoving && soundB.data == walking_data)
            pauseSoundB();

    }


    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && canJump) {
        player.worldRow-= 4;
        aButton.worldCol--;
        bButton.worldCol--;
  player.velocity = 40;
        playSoundB(playerJump_data, playerJump_length, 0);
 }

    playerShootCooldown--;
    if (playerShootCooldown <= 0) {
        playerShootCooldown = 0;
    }

    if (playerHasBow && (!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && playerShootCooldown < 2) {
        for (int i = 0; i < 4; i++) {
            if (arrows[i].hide) {
                arrows[i].hide = 0;
                arrows[i].worldRow = player.worldRow - 2;
                arrows[i].worldCol = player.worldCol;
                arrows[i].velocity = 10;
                arrows[i].horVelocity = 80;
                arrows[i].didDamage = 0;

                arrows[i].direction = player.direction;

                playerShootCooldown = 30 - playerShootSpeed;

                break;
            }
        }
        playSoundB(arrowShot_data, arrowShot_length, 0);

    }


    for (int i = 0; i < 6; i++) {
        switch(enemies[i].type) {
            case (BOSS):

                if (enemies[i].health <= 0) {
                    bossDead = 1;
                }
            case(GOBLIN):
                if (enemies[i].health > 0 && collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow,
                    enemies[i].sprite.width, enemies[i].sprite.height, player.worldCol, player.worldRow, player.width, player.height)) {
                        playerTookDamage = 1;
                        enemies[i].attackedPlayer = 1;
                        enemies[i].timeToRun = 60;


                }
                break;
            case(HOSTILE):
                for (int j = 0; j < 6; j++) {

                    if (enemies[i].hostileArrows[j].hide == 0 && collision(enemies[i].hostileArrows[j].worldCol, enemies[i].hostileArrows[j].worldRow,
                        enemies[i].hostileArrows[j].width, enemies[i].hostileArrows[j].height, player.worldCol, player.worldRow, player.width, player.height)) {
                            enemies[i].hostileArrows[j].hide = 1;
                            playerTookDamage = 1;


                    }

                }
                break;
        }

    }
    savedWorldCol = player.worldCol;
    savedWorldRow = player.worldRow;

    animateDungeonViewPlayer();
}


void animateDungeonViewPlayer() {

    player.prevAniState = player.aniState;
    player.aniState = SPRITEIDLE;

    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        player.aniState = SPRITELEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        player.aniState = SPRITERIGHT;

    if (player.aniState == SPRITEIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}


void updateDungeonViewArrows() {


    bow.hide = 1;
    for (int i = 0; i < 4; i++) {


        if ((arrows[i].worldRow - vOff + arrows[i].height < 160 &&
                (dungeonCollisionBitmap[(arrows[i].worldRow + arrows[i].height) * 512 +
                    arrows[i].worldCol])
                && (dungeonCollisionBitmap[(arrows[i].worldRow + arrows[i].height) * 512
                    + (arrows[i].worldCol + arrows[i].width - arrows[i].cdel)]))) {


                arrows[i].worldRow = (int) arrows[i].worldRow - (arrows[i].velocity*.1);

                bow.hide = 0;
                if (arrows[i].direction == 1) {
                    arrows[i].worldCol = (int) arrows[i].worldCol + round(arrows[i].horVelocity*.1);
                } else {
                    arrows[i].worldCol = (int) arrows[i].worldCol - round(arrows[i].horVelocity*.1);
                }
                arrows[i].velocity = (int) arrows[i].velocity + (-32*.05);

        } else {
            arrows[i].hide = 1;
            arrows[i].worldRow = 4;
            arrows[i].worldCol = 4;

        }
        if (arrows[i].worldCol < 1 || arrows[i].worldCol > 512 -16) {
            arrows[i].hide = 1;
        }
    }


    if (player.direction == 1) {
        bow.worldCol = player.worldCol + 5;
    } else {
        bow.worldCol = player.worldCol - 5;
    }
    bow.worldRow = player.worldRow;

}


void updateDungeonViewHostileArrows() {
    int playerTookDamage = 0;
    for (int i = 0; i < 6; i++) {

        enemies[i].bow.hide = 1;

        for (int j = 0; j < 6; j++) {


            if ((enemies[i].hostileArrows[j].worldRow - vOff + enemies[i].hostileArrows[j].height < 160 &&
                    (dungeonCollisionBitmap[(enemies[i].hostileArrows[j].worldRow + enemies[i].hostileArrows[j].height) * 512 +
                        enemies[i].hostileArrows[j].worldCol])
                    && (dungeonCollisionBitmap[(enemies[i].hostileArrows[j].worldRow + enemies[i].hostileArrows[j].height) * 512
                        + (enemies[i].hostileArrows[j].worldCol + enemies[i].hostileArrows[j].width - enemies[i].hostileArrows[j].cdel)]))) {


                    enemies[i].hostileArrows[j].worldRow = (int) enemies[i].hostileArrows[j].worldRow - round(enemies[i].hostileArrows[j].velocity*.1);

                    enemies[i].bow.hide = 0;
                    if (enemies[i].sprite.direction == 1) {
                        enemies[i].hostileArrows[j].worldCol++;


                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol + round(enemies[i].hostileArrows[j].horVelocity*.1);
                    } else {

                        enemies[i].hostileArrows[j].worldCol = (int) enemies[i].hostileArrows[j].worldCol - round(enemies[i].hostileArrows[j].horVelocity*.1);

                    }

                    enemies[i].hostileArrows[j].velocity = (int) enemies[i].hostileArrows[j].velocity + (-32*.1);

            } else {
                enemies[i].hostileArrows[j].hide = 1;
            }

            if (enemies[i].hostileArrows[j].worldCol < 1 || enemies[i].hostileArrows[j].worldCol > 512 -16) {
                enemies[i].hostileArrows[j].hide = 1;
            }
        }


        if (enemies[i].sprite.direction == 1) {
            enemies[i].bow.worldCol = enemies[i].sprite.worldCol + 5;
        } else {
            enemies[i].bow.worldCol = enemies[i].sprite.worldCol - 5;
        }
        enemies[i].bow.worldRow = enemies[i].sprite.worldRow;
    }

}


void updateDungeonViewEnemies() {
    int willShoot;

    for (int i = 0; i < 6; i++) {
        int showButton = 0;

        int oldWorldRow = enemies[i].sprite.worldRow;
        int oldWorldCol = enemies[i].sprite.worldCol;


        if (((dungeonCollisionBitmap[(int) (enemies[i].sprite.worldRow + enemies[i].sprite.height - round(enemies[i].sprite.velocity*.1)) * 512 +
            enemies[i].sprite.worldCol])
            && (dungeonCollisionBitmap[(int) (enemies[i].sprite.worldRow + enemies[i].sprite.height - round(enemies[i].sprite.velocity*.1)) * 512
            + (enemies[i].sprite.worldCol + enemies[i].sprite.width - enemies[i].sprite.cdel)]))) {


                enemies[i].sprite.velocity = (int) enemies[i].sprite.velocity + (-32*.08);
                enemies[i].canJump = 0;


                enemies[i].sprite.worldRow = (int) enemies[i].sprite.worldRow - round(enemies[i].sprite.velocity*.1);


                enemies[i].isJumping = 1;

        } else {
            enemies[i].sprite.velocity = 0;

            enemies[i].isJumping = 0;
        }



        if (enemies[i].sprite.worldCol - hOff > 0 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * 512
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * 512
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])) {

            enemies[i].againstWallLeft = 0;

        } else {
            enemies[i].againstWallLeft = 1;
        }



        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < 240 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * 512 +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * 512 +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])) {

            enemies[i].againstWallRight = 0;

        } else {
            enemies[i].againstWallRight = 1;
        }




        if ((enemies[i].sprite.worldCol - hOff > 240 || enemies[i].sprite.worldCol - hOff < 0 ||
            enemies[i].sprite.worldRow - vOff > 160 || enemies[i].sprite.worldRow - vOff < 0)) {
            enemies[i].sprite.hide = 1;
        } else {
            enemies[i].sprite.hide = 0;
        }


        if (abs(enemies[i].sprite.worldRow- player.worldRow) < 50 && abs(enemies[i].sprite.worldCol - player.worldCol) < 120) {
            enemies[i].isHostile = 1;

        } else {
            enemies[i].isHostile = 0;

        }





        if (enemies[i].doesWander) {

            if(enemies[i].movementCounter % ((rand()%40) + 100) == 0 && !enemies[i].isMoving) {
                enemies[i].timeToMove = 60 + (4*i);
                enemies[i].isMoving = 1;


                if (rand() % 100 > 60) {
                    enemies[i].sprite.direction *= -1;
                }
            }

            for (int j = 0; j < 6; j++) {
                if (i != j) {
                    if (collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width, enemies[i].sprite.height,
                        enemies[j].sprite.worldCol, enemies[j].sprite.worldRow, enemies[j].sprite.width, enemies[j].sprite.height) && !enemies[i].isMoving) {
                            enemies[i].timeToMove = 60;
                            enemies[i].isMoving = 1;
                    }
                }
            }
        }


        if (enemies[i].damageCooldown >= 0) {
            enemies[i].damageCooldown--;
        } else {
            enemies[i].damageCooldown = 0;
        }

        int tookDamage = 0;



        for (int j = 0; j < 4; j++) {
            if (enemies[i].health > 0) {
                if (!arrows[j].didDamage && (collision(enemies[i].sprite.worldCol, enemies[i].sprite.worldRow, enemies[i].sprite.width,
                    enemies[i].sprite.height, arrows[j].worldCol, arrows[j].worldRow, arrows[j].width, arrows[j].height) )) {

                    arrows[j].hide = 1;
                    arrows[j].didDamage = 1;
                    arrows[j].worldCol = 0;
                    arrows[j].worldRow = 0;
                    arrows[j].hide = 1;
                    playSoundB(enemyHit_data, enemyHit_length, 0);

                }
            }

            if (arrows[j].didDamage && enemies[i].damageCooldown < 2 ) {
                arrows[j].didDamage = 0;
                enemies[i].health -= 1;
                enemies[i].damageCooldown = 10;
                if (enemies[i].health <= 0 ) {
                    enemies[i].sprite.hide = 1;
                }
            }
        }



        switch(enemies[i].type) {

            case (HOSTILE):

                if (enemies[i].isHostile && enemies[i].health > 0) {
                    enemies[i].shootCounter++;
                    willShoot = 1;

                    int distanceToKeep = 80;
                    int distanceToAvoid = 40;
                    int distanceFromPlayer = enemies[i].sprite.worldCol - player.worldCol;

                    enemies[i].timeToWait--;


                    if (enemies[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToKeep) {
                        enemies[i].isMoving++;
                        enemies[i].timeToMove = 20 + (4*i);
                        enemies[i].isMoving = 1;
                        if (distanceFromPlayer > 0) {

                            enemies[i].sprite.direction = -1;

                        } else {

                            enemies[i].sprite.direction = 1;
                        }

                    } else {
                        if (abs(distanceFromPlayer) < distanceToAvoid) {
                            if (!enemies[i].hasWaited) {
                                willShoot = 0;
                                enemies[i].timeToWait = 20;
                                enemies[i].hasWaited = 1;
                            }
                            if (distanceFromPlayer > 0) {

                                enemies[i].sprite.direction = -1;

                            } else {

                                enemies[i].sprite.direction = 1;
                            }
                        }
                    }




                    if (willShoot && enemies[i].shootCounter % (40*(i+1))< 1) {
                        for (int j = 0; j < 6; j++) {

                            if (enemies[i].hostileArrows[j].hide) {
                                enemies[i].hostileArrows[j].hide = 0;
                                enemies[i].hostileArrows[j].worldRow = enemies[i].sprite.worldRow - 3;
                                enemies[i].hostileArrows[j].worldCol = enemies[i].sprite.worldCol;
                                enemies[i].hostileArrows[j].velocity = 10;
                                enemies[i].hostileArrows[j].horVelocity = 80;
                                enemies[i].hostileArrows[j].didDamage = 0;

                                enemies[i].hostileArrows[j].direction = enemies[i].sprite.direction;

                                break;
                            }
                        }


                    }
                }
            break;

            case (BOSS):

            case (GOBLIN):

                if (enemies[i].isHostile && enemies[i].health > 0) {
                    enemies[i].shootCounter++;



                    int waitingTime = 100 + 5*i;
                    int distanceToAttack = 0;
                    int distanceToRun = 50 + 3*i;
                    int distanceFromPlayer = enemies[i].sprite.worldCol - player.worldCol;

                    enemies[i].timeToWait--;
                    enemies[i].timeToRun--;





                    if (enemies[i].hasWaited && enemies[i].timeToWait < 3 && enemies[i].timeToRun < 3 && enemies[i].attackedPlayer) {
                        enemies[i].attackedPlayer = 0;
                        enemies[i].hasWaited = 0;
                    }


                    if (enemies[i].timeToWait > 3 & !enemies[i].hasWaited && enemies[i].attackedPlayer) {
                        enemies[i].isMoving = 0;
                        enemies[i].timeToMove = 0;
                        if (enemies[i].timeToWait < 5) {
                            enemies[i].hasWaited = 1;
                        }

                    } else {


                        if (enemies[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToAttack && !enemies[i].attackedPlayer) {
                            enemies[i].isMoving++;
                            enemies[i].timeToMove = 20 + (4*i);
                            enemies[i].isMoving = 1;
                            if (distanceFromPlayer > 0) {
                                enemies[i].sprite.direction = -1;

                            } else {
                                enemies[i].sprite.direction = 1;
                            }
                        }


                        if (enemies[i].timeToWait < 3 && enemies[i].timeToRun > 3 && abs(distanceFromPlayer) < distanceToRun && enemies[i].attackedPlayer) {
                            enemies[i].isMoving++;
                            enemies[i].timeToMove = distanceToRun +4*i;
                            enemies[i].isMoving = 1;

                            if (distanceFromPlayer > 0) {
                                enemies[i].sprite.direction = 1;
                            } else {
                                enemies[i].sprite.direction = -1;
                            }
                        } else {

                            if (!enemies[i].hasWaited && enemies[i].timeToWait < 3 && enemies[i].timeToRun < 3 && enemies[i].attackedPlayer) {
                                enemies[i].timeToWait = waitingTime;
                            }
                        }
                    }
                }
                break;
        }





        if (enemies[i].sprite.worldCol - hOff > 0 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * 512
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * 512
            + (enemies[i].sprite.worldCol - enemies[i].sprite.cdel)])) {

            enemies[i].againstWallLeft = 1;


        } else {
            enemies[i].againstWallLeft = 0;
        }



        if (enemies[i].sprite.worldCol - hOff + enemies[i].sprite.width < 512 && (dungeonCollisionBitmap[enemies[i].sprite.worldRow * 512 +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])
            && (dungeonCollisionBitmap[(enemies[i].sprite.worldRow + enemies[i].sprite.height - enemies[i].sprite.rdel) * 512 +
                (enemies[i].sprite.worldCol + enemies[i].sprite.width)])) {

            enemies[i].againstWallRight = 1;

        } else {
            enemies[i].againstWallRight = 0;
        }

        if (!(enemies[i].againstWallLeft && enemies[i].againstWallRight)) {






            enemies[i].canJump = 1;
        } else {
            enemies[i].canJump = 0;
        }

        if (enemies[i].canJump && !enemies[i].isJumping && !enemies[i].triedJumping) {
            enemies[i].sprite.worldRow-= 1;
            enemies[i].sprite.velocity = 40;
            enemies[i].isJumping = 1;
            enemies[i].canJump = 0;
            enemies[i].triedJumping = 1;


        } else {




        }

        if (enemies[i].triedJumping && !enemies[i].isJumping) {
            enemies[i].sprite.direction *= -1;
            enemies[i].triedJumping = 0;
       }



        if (enemies[i].isMoving && !enemies[i].isStationary) {

                enemies[i].sprite.worldCol += (enemies[i].sprite.direction*enemies[i].sprite.cdel);
            enemies[i].timeToMove--;
            enemies[i].timeToRun--;

        }
        if (enemies[i].sprite.worldCol <= 1 || enemies[i].sprite.worldCol > 512 - 16) {
            enemies[i].sprite.direction = enemies[i].sprite.direction*-1;
        }







        if (enemies[i].timeToMove == 0) {

            enemies[i].timeToMove == 0;
            enemies[i].isMoving = 0;
        }
        enemies[i].movementCounter++;



        if (enemies[i].health <= 0) {

        }

    }



    animateDungeonViewVillagers();
}


void animateDungeonViewVillagers() {
    for (int i = 0; i < 6; i++) {

        if(!enemies[i].isMoving && !enemies[i].isHostile)
            enemies[i].sprite.aniState = SPRITEFRONT;
        enemies[i].sprite.prevAniState = enemies[i].sprite.aniState;
        enemies[i].sprite.aniState = SPRITEIDLE;

        if(!enemies[i].isStationary && enemies[i].sprite.aniCounter % 20 == 0) {
            enemies[i].sprite.curFrame = (enemies[i].sprite.curFrame + 1) % enemies[i].sprite.numFrames;
        }

        if(enemies[i].sprite.direction == -1 && enemies[i].isMoving)
            enemies[i].sprite.aniState = SPRITELEFT;
        if(enemies[i].sprite.direction == 1 && enemies[i].isMoving)
            enemies[i].sprite.aniState = SPRITERIGHT;

        if (enemies[i].sprite.aniState == SPRITEIDLE) {

            enemies[i].sprite.curFrame = 0;
            enemies[i].sprite.aniCounter = 0;
            enemies[i].sprite.aniState = enemies[i].sprite.prevAniState;
        } else {
            enemies[i].sprite.aniCounter++;
        }
    }


}


void drawDungeonView() {

    drawDungeonViewPlayer();

    drawDungeonViewVillagers();

    drawDungeonViewArrows();

    drawDungeonViewHostileArrows();

    if (bossDead) {

        for (int i = 0; i < 10; i++) {
            if (rainingMeads[i].hide || meadTimerStarted == 0) {
                shadowOAM[127-i].attr0 |= (2<<8);
            } else {

                shadowOAM[127-i].attr0 = (0xFF & rainingMeads[i].worldRow ) | (0<<14);
                shadowOAM[127-i].attr1 = (0x1FF & rainingMeads[i].worldCol) | (1<<14);
                shadowOAM[127-i].attr2 = ((3)<<12) | ((12)*32+(2));
            }
        }

        if (mead.hide) {
            shadowOAM[69].attr0 |= (2<<8);
        } else {
            shadowOAM[69].attr0 = (0xFF & mead.worldRow - vOff) | (0<<14);
            shadowOAM[69].attr1 = (0x1FF & mead.worldCol - hOff) | (1<<14);
            shadowOAM[69].attr2 = ((3)<<12) | ((12)*32+(2));
        }
    }

    drawButtons(hOff, vOff);

    drawGlobal();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void drawDungeonViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & player.worldRow - vOff) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & player.worldCol - hOff) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((player.curFrame * 2)*32+(player.aniState * 2));
    }



}

void drawDungeonViewVillagers() {
    for (int i = 0; i < 6; i++) {
        if (enemies[i].sprite.hide || enemies[i].health <= 0) {
            shadowOAM[10+i].attr0 |= (2<<8);
        } else {
            shadowOAM[10+i].attr0 = (0xFF & enemies[i].sprite.worldRow - vOff) | (0<<14);
            shadowOAM[10+i].attr1 = (0x1FF & enemies[i].sprite.worldCol - hOff) | (1<<14);


            switch(enemies[i].type) {
            case NORMIE:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((enemies[i].sprite.curFrame * 2)*32+(8 + enemies[i].sprite.aniState * 2))
                                                                                       ;
                break;
            case MERCHANT:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((6 + enemies[i].sprite.curFrame * 2)*32+(8 + enemies[i].sprite.aniState * 2))
                                                                                           ;

                break;
            case DOCTOR:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((6 + enemies[i].sprite.curFrame * 2)*32+(8 + enemies[i].sprite.aniState * 2))
                                                                                           ;

                break;
            case HOSTILE:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((enemies[i].sprite.curFrame * 2)*32+(16 + enemies[i].sprite.aniState * 2))
                                                                                        ;
                break;
            case GOBLIN:
                shadowOAM[10+i].attr2 = ((2)<<12) | ((enemies[i].sprite.curFrame * 2)*32+(24 + enemies[i].sprite.aniState * 2))
                                                                                        ;
                break;
            case BOSS:
                shadowOAM[10+i].attr0 = (0xFF & enemies[i].sprite.worldRow - vOff) | (0<<14);
                shadowOAM[10+i].attr1 = (0x1FF & enemies[i].sprite.worldCol - hOff) | (2<<14);
                if (!enemies[i].isJumping){
                    if (enemies[i].sprite.direction == 1) {
                        shadowOAM[10+i].attr2 = ((2)<<12) | ((6 + enemies[i].sprite.curFrame * 4)*32+(16));
                    } else {
                        shadowOAM[10+i].attr2 = ((2)<<12) | ((6 + enemies[i].sprite.curFrame * 4)*32+(20));

                    }
                } else {
                    if (enemies[i].sprite.direction == 1) {
                        shadowOAM[10+i].attr2 = ((2)<<12) | ((14)*32+(24));
                    } else {
                        shadowOAM[10+i].attr2 = ((2)<<12) | ((14)*32+(28));
                    }
                }
                break;
            }
        }
    }
}


void drawDungeonViewHostileArrows() {
    int counter;

    for (int i = 0; i < 6; i++) {
        int drawBow = 0;
        for (int j = 0; j < 6; j++) {
            counter++;
            if (enemies[i].hostileArrows[j].hide) {
                shadowOAM[45+counter].attr0 |= (2<<8);
            } else {
                drawBow = 1;
                shadowOAM[45+counter].attr0 = (0xFF & enemies[i].hostileArrows[j].worldRow - vOff) | (0<<14);
                shadowOAM[45+counter].attr1 = (0x1FF & enemies[i].hostileArrows[j].worldCol - hOff) | (1<<14);
                if (enemies[i].hostileArrows[j].direction == 1) {
                    shadowOAM[45+counter].attr2 = ((1)<<12) | ((10)*32+(0));
                } else {
                    shadowOAM[45+counter].attr2 = ((1)<<12) | ((10)*32+(2));
                }
            }

        }

        if (enemies[i].bow.hide) {
                shadowOAM[20+i].attr0 |= (2<<8);
        } else {
            if (enemies[i].isHostile && enemies[i].sprite.direction == 1) {
                shadowOAM[20+i].attr0 = (0xFF & enemies[i].bow.worldRow - vOff) | (0<<14);
                shadowOAM[20+i].attr1 = (0x1FF & enemies[i].bow.worldCol - hOff) | (1<<14);
                shadowOAM[20+i].attr2 = ((1)<<12) | ((8)*32+(0));
            } else {
                shadowOAM[20+i].attr0 = (0xFF & enemies[i].bow.worldRow - vOff) | (0<<14);
                shadowOAM[20+i].attr1 = (0x1FF & enemies[i].bow.worldCol - hOff) | (1<<14);
                shadowOAM[20+i].attr2 = ((1)<<12) | ((8)*32+(2));
            }
        }
    }
}


void drawDungeonViewArrows() {
    int drawBow = 0;
    for (int i = 0; i < 4; i++) {
        if (arrows[i].hide) {
            shadowOAM[35+i].attr0 |= (2<<8);
        } else {
            drawBow = 1;
            shadowOAM[35+i].attr0 = (0xFF & arrows[i].worldRow - vOff) | (0<<14);
            shadowOAM[35+i].attr1 = (0x1FF & arrows[i].worldCol - hOff) | (1<<14);
            if (arrows[i].direction == 1) {
                shadowOAM[35+i].attr2 = ((1)<<12) | ((10)*32+(0));
            } else {
                shadowOAM[35+i].attr2 = ((1)<<12) | ((10)*32+(2));
            }
        }
    }


    if (bow.hide) {
            shadowOAM[9].attr0 |= (2<<8);
    } else {
        if (player.direction == 1) {
            shadowOAM[9].attr0 = (0xFF & bow.worldRow - vOff) | (0<<14);
            shadowOAM[9].attr1 = (0x1FF & bow.worldCol - hOff) | (1<<14);
            shadowOAM[9].attr2 = ((1)<<12) | ((8)*32+(0));
        } else {
            shadowOAM[9].attr0 = (0xFF & bow.worldRow - vOff) | (0<<14);
            shadowOAM[9].attr1 = (0x1FF & bow.worldCol - hOff) | (1<<14);
            shadowOAM[9].attr2 = ((1)<<12) | ((8)*32+(2));
        }
    }
}
