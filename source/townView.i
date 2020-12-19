# 1 "townView.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "townView.c"
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
# 2 "townView.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
void drawString4Double(int col, int row, char *str, char *str2, unsigned char colorIndex);
# 3 "townView.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
void drawString4Double(int col, int row, char *str, char *str2, unsigned char colorIndex);
# 4 "townView.c" 2
# 1 "title.h" 1
# 22 "title.h"
extern const unsigned short titleTiles[3120];


extern const unsigned short titleMap[1024];


extern const unsigned short titlePal[256];
# 5 "townView.c" 2
# 1 "townView.h" 1

enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
# 20 "townView.h"
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
# 33 "townView.h"
void setUpTown(TOWN town);
void initTownView();
void resumeTownView();
void initTownViewPlayer();
void initTownViewVillagers();
void initTownViewButtons();
void resumeTownView();
void updateTownView();
void updateTownViewPlayer();
void updateTownViewVillagers();
void applyGravity();
void animateTownViewPlayer();
void drawTownView();
void animatePlayer();
void drawTownView();
void drawTownViewPlayer();
void drawTownViewVillagers();
void resetTownView();
# 6 "townView.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "townView.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[2240];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 8 "townView.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[3072];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 9 "townView.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[1568];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 10 "townView.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[16];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 11 "townView.c" 2
# 1 "townCollision.h" 1
# 20 "townCollision.h"
extern const unsigned short townCollisionBitmap[81920];
# 12 "townView.c" 2


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
# 15 "townView.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 1 3




# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
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
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
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
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


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
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 7 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 8 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 2 3


# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 150 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
    typedef float float_t;
    typedef double double_t;
# 194 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 290 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 422 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern float nexttowardf (float, long double);
extern double nexttoward (double, long double);
extern long double nexttowardl (long double, long double);
extern long double logbl (long double);
extern long double log2l (long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 662 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3

# 16 "townView.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 1 3
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/time.h" 3
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
# 17 "townView.c" 2
# 28 "townView.c"
# 1 "sound.h" 1

# 1 "sound.h"
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
# 29 "townView.c" 2
# 1 "arrowShot.h" 1


extern const unsigned int arrowShot_sampleRate;
extern const unsigned int arrowShot_length;
extern const signed char arrowShot_data[];
# 30 "townView.c" 2
# 1 "enemyDie.h" 1


extern const unsigned int enemyDie_sampleRate;
extern const unsigned int enemyDie_length;
extern const signed char enemyDie_data[];
# 31 "townView.c" 2
# 1 "enemyHit.h" 1


extern const unsigned int enemyHit_sampleRate;
extern const unsigned int enemyHit_length;
extern const signed char enemyHit_data[];
# 32 "townView.c" 2
# 1 "playerHit.h" 1


extern const unsigned int playerHit_sampleRate;
extern const unsigned int playerHit_length;
extern const signed char playerHit_data[];
# 33 "townView.c" 2
# 1 "walking.h" 1


extern const unsigned int walking_sampleRate;
extern const unsigned int walking_length;
extern const signed char walking_data[];
# 34 "townView.c" 2
# 1 "playerJump.h" 1


extern const unsigned int playerJump_sampleRate;
extern const unsigned int playerJump_length;
extern const signed char playerJump_data[];
# 35 "townView.c" 2
# 1 "menuActivate.h" 1


extern const unsigned int menuActivate_sampleRate;
extern const unsigned int menuActivate_length;
extern const signed char menuActivate_data[];
# 36 "townView.c" 2

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

int playerShootCooldown;

int savedWorldRow;
int savedWorldCol;
int savedvOff;
int savedhOff;

int playerTookDamage;
int damageTimer;
int playerIsMoving;
int playerShootCooldown;

char villagerNames[8][10] = {"Farquad:", "Linus:", "Dovakihn:", "Fredrick:", "Salvador:", "Bungus:", "Leonardo:", "George:"};
char villagerGreetings[6][20] = {
    "I took an arrow in the knee!\0",
    "How do you do on this hot day?\0",
    "Happen to seen my sweet roll? \0",
    "Need me a horse.... \0",
    "*groans*\0"
    };


char storedText[41];

VILLAGER villagers[6];


int hasTalkedToQuestGiver;




ANISPRITE player;
ANISPRITE arrows[4];
ANISPRITE bow;




void setUpTown(TOWN town) {


}


void initTownView() {
# 96 "townView.c"
    vOff = 0;
    hOff = 0;

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x0400001A) = vOff;
    (*(volatile unsigned short *)0x04000018) = hOff;
    (*(volatile unsigned short *)0x0400001E) = vOff;
    (*(volatile unsigned short *)0x0400001C) = hOff;


    initTownViewPlayer();
    initTownViewButtons();
    initTownViewArrows();
    initTownViewVillagers();
}



void initTownViewPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 160 - 33;
    player.worldCol = 20;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;


}

void resetTownView() {
    for (int i = 0; i < 6; i++) {
        VILLAGER pain;
        villagers[i] = pain;
    }

    playerShootCooldown = 0;

    savedWorldRow = 0;
    savedWorldCol = 0;
    savedvOff = 0;
    savedhOff = 0;

    playerTookDamage = 0;
    damageTimer = 0;
    playerIsMoving = 0;
    playerShootCooldown = 0;
}

void initTownViewVillagers() {





        if (currentTown.index < 3)
            villagers[0].type = DOCTOR;
        else
            villagers[0].type = NORMIE;

        if (currentTown.questTownType == BOUNTYDEST && bountyStarted && !bountyKilled) {
                villagers[1].type = HOSTILE;
                villagers[1].doesWander = 1;

                }
        else {
            villagers[1].type = NORMIE;
            villagers[1].doesWander = 1;
        }

        if (currentTown.index == 0) {
            villagers[3].type = QUESTGIVER;
            villagers[3].questType = BOWGIVER;
            villagers[3].doesWander = 0;
            villagers[3].sprite.worldCol = 140;
        }




        if (currentTown.questTownType != NONE) {
            villagers[2].type = QUESTGIVER;
            villagers[2].questType = currentTown.questTownType;
        } else
            villagers[2].type = NORMIE;


        if (currentTown.villagerCount > 5) {
            villagers[3].type = MERCHANT;

            if (currentTown.merchantTownType == BOWUPGRADE) {
                villagers[3].merchantType = BOWUPGRADE;
                villagers[3].doesWander = 0;
                villagers[3].sprite.worldCol = 152;
            }
            if (currentTown.merchantTownType == KEY) {
                villagers[3].merchantType = KEY;
            }
        }

        if (!currentTown.enemyDefeated) {
            villagers[1].health = 3;
            villagers[1].sprite.hide = 0;

        } else {
            villagers[1].sprite.hide = 1;
        }




        for (int i = 0; i < currentTown.villagerCount; i++) {
            srand(100*i + time(
# 214 "townView.c" 3 4
                              ((void *)0)
# 214 "townView.c"
                                  ));

            if (cheatActive) {
                villagers[i].isHostile = 1;
                villagers[i].type = HOSTILE;
                villagers[i].health = 3;
            }

            villagers[i].sprite.width = 16;
            villagers[i].sprite.height = 16;
            villagers[i].sprite.rdel = 1;
            villagers[i].sprite.cdel = 1;
            villagers[i].sprite.worldRow = 160 - currentTown.floorRow - 16;
            villagers[i].sprite.worldCol = 150 + ((500/(currentTown.villagerCount+1))*i);
            villagers[i].sprite.aniCounter = 0;
            villagers[i].sprite.curFrame = 0;
            villagers[i].sprite.numFrames = 3;


            villagers[i].sprite.direction = 1;
            villagers[i].isMoving = 0;
            villagers[i].isHostile = 0;

            villagers[i].health = 3;

            if (villagers[i].sprite.worldCol > 512 -20) {
                villagers[i].sprite.worldCol = 500 - (20*i);
            }
# 250 "townView.c"
            srand(player.worldCol + playerMoney + dungeonKeys + currentTown.villagerCount + playerHealth + i);
            villagers[i].randomSpeech = ( rand() % 6);




            switch(villagers[i].type) {
                case NORMIE:
                    villagers[i].doesWander = 1;
                    break;
                case MERCHANT:
                    villagers[i].doesWander = 1;




                    break;
                case DOCTOR:
                    villagers[i].doesWander = 1;






                    break;
                case QUESTGIVER:

                    villagers[i].doesWander = 1;

                    switch (currentTown.questTownType) {
                        case BOWGIVER:

                            break;
                        case BOUNTY:
                            villagers[i].doesWander = 0;

                            villagers[i].sprite.worldCol = 300;
                            break;

                    }


                    break;
                case HOSTILE:




                    villagers[i].health = 3;


                    villagers[i].doesWander = 1;


                    for (int j = 0; j < 6; j++) {
                        villagers[i].hostileArrows[j].width = 16;
                        villagers[i].hostileArrows[j].height = 16;
                        villagers[i].hostileArrows[j].rdel = 1;
                        villagers[i].hostileArrows[j].cdel = 1;
                        villagers[i].hostileArrows[j].worldRow = villagers[i].sprite.worldRow;
                        villagers[i].hostileArrows[j].worldCol = villagers[i].sprite.worldCol;
                        villagers[i].hostileArrows[j].hide = 1;
                        villagers[i].hostileArrows[j].direction = 1;

                    }


                    villagers[i].bow.width = 16;
                    villagers[i].bow.height = 16;
                    villagers[i].bow.rdel = 1;
                    villagers[i].bow.cdel = 1;
                    villagers[i].bow.worldRow = villagers[i].sprite.worldRow;
                    villagers[i].bow.worldCol = villagers[i].sprite.worldCol;
                    villagers[i].bow.hide = 1;
                    break;
            }


        }

        if (currentTown.index == 0) {
            villagers[3].doesWander = 0;
            villagers[3].sprite.worldCol = 140;
        }
        if (currentTown.villagerCount > 5) {

            if (currentTown.merchantTownType == BOWUPGRADE) {
                villagers[3].doesWander = 0;
                villagers[3].sprite.worldCol = 152;
            }
            if (currentTown.merchantTownType == KEY) {
                villagers[3].merchantType = KEY;
            }
        }
}

void initTownViewArrows() {
    for (int i = 0; i < 4; i++) {
        arrows[i].width = 16;
        arrows[i].height = 16;
        arrows[i].rdel = 1;
        arrows[i].cdel = 6;
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



void initTownViewButtons() {
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

void resumeTownView() {

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


void updateTownView() {
    playerTookDamage = 0;


    updateTownViewPlayer();
    updateTownViewVillagers();
    updateTownViewArrows();
    updateTownViewHostileArrows();


    if (damageTimer > 0) {
        damageTimer--;
    }
    if (playerTookDamage && damageTimer < 1) {
        playerHealth -= 1;
        playerTookDamage = 0;
        damageTimer = 80;
        playSoundB(playerHit_data, playerHit_length, 0);
    }

}


void updateTownViewPlayer() {
    initTownViewButtons();

    int tempRow = player.worldRow - vOff;
    int tempCol = player.worldCol - hOff;

    playerIsMoving = 0;

    int canJump = 1;
# 455 "townView.c"
    if ((player.worldRow - vOff + player.height - (int) round(player.velocity*0.1) < 160 - currentTown.floorRow)) {

        player.velocity = (int) player.velocity + (-32*.08);
        canJump = 0;


        player.worldRow = (int) player.worldRow - round(player.velocity*.1);
        aButton.worldRow = (int) aButton.worldRow - round(player.velocity*.1);
        bButton.worldRow = (int) bButton.worldRow - round(player.velocity*.1);


    } else {
        canJump = 1;
        player.velocity = 0;

    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        playerIsMoving = 1;
        player.direction = -1;
        if (player.worldCol - hOff > 0 && (int) (player.worldRow + player.height- round(player.velocity*0.1) > currentTown.floorRow)) {

            player.worldCol -= player.cdel;
            aButton.worldCol -= player.rdel;
            bButton.worldCol -= player.rdel;

            if (hOff > 0 && player.worldCol - hOff < 240 / 2) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        playerIsMoving = 1;
        player.direction = 1;
        if (player.worldCol - hOff + player.width < 240 && (int) (player.worldRow + player.height- round(player.velocity*0.1) > currentTown.floorRow)) {

            player.worldCol += player.cdel;
            aButton.worldCol += player.rdel;
            bButton.worldCol += player.rdel;


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
        player.worldRow--;
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




    aButton.hide = 1;
    for (int i = 0; i < currentTown.villagerCount; i++) {

        for (int j = 0; j < 6; j++) {
            villagers[i].bow.hide = 1;


            if (villagers[i].hostileArrows[j].hide == 0) {
                if (villagers[i].hostileArrows[j].hide == 0 && collision(villagers[i].hostileArrows[j].worldCol, villagers[i].hostileArrows[j].worldRow,
                    villagers[i].hostileArrows[j].width, villagers[i].hostileArrows[j].height, player.worldCol, player.worldRow, player.width, player.height)) {
                        villagers[i].hostileArrows[j].hide = 1;
                        playerTookDamage = 1;

                }
            }
        }

        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width, villagers[i].sprite.height)) {

            if (!villagers[i].isHostile) {
                aButton.hide = 0;
            }

            switch (villagers[i].type) {
                case NORMIE:







                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                        playSoundB(menuActivate_data, menuActivate_length, 0);
                        if (i == 0) {
                            goToTextView("", "I took an arrow in the knee!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 1) {
                            goToTextView("", "How do you do on this hot day?", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 2) {
                            goToTextView("", "Happen to see my sweet roll?", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else if (i == 3) {
                            goToTextView("", "Legend says 2020 will be hexed!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }else if (i== 4) {
                            goToTextView("", "No lollygaggin!", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }else if (i == 5) {
                            goToTextView("", "Love me a good Nord...", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        } else {
                            goToTextView("", "*groans*", villagerNames[villagers[i].randomSpeech], "", "Leave");
                        }
                    }
                    textViewChoice = -1;
                    break;
            case QUESTGIVER:
                switch (villagers[i].questType) {
                    case BOWGIVER:

                        if (!playerHasBow && (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                            playSoundB(menuActivate_data, menuActivate_length, 0);
                            hasTalkedToQuestGiver = 1;
                            goToTextView("", "Hey there traveller!", "Old Man", "Yes?", "Leave");
                        }

                        if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                            hasTalkedToQuestGiver = 2;

                            goToTextView("Take the bow?", "You'll need this for your travels.", "Old Man", "Take", "Leave");

                        }
                        if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                            hasTalkedToQuestGiver = 3;
                            playerHasBow = 1;
                            hasTalkedToQuestGiver = 0;
                            textViewChoice = -1;

                            goToTextView("Tip: press B to shoot!", "Hopefully you'll make use of it.", "Old Man", "", "Leave");

                        }
                        if (textViewChoice == 0 && hasTalkedToQuestGiver == 2) {
                            hasTalkedToQuestGiver = 0;
                            textViewChoice = -1;
                            goToTextView("", "Fine! Good riddance.", "Old Man", "", "Leave");

                        }




                        if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && playerHasBow)
                            goToTextView("", "Good luck out there!", "Old Man", "", "Leave");


                        break;
                    case BOUNTY:



                        if (!bountyCompleted) {
                            if (!bountyStarted) {
                                if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                    hasTalkedToQuestGiver = 1;
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "I have a quest.", "Debt Collector", "Yes?", "Leave");
                                }

                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                    hasTalkedToQuestGiver = 2;
                                    goToTextView("", "I need a man killed.", "Debt Collector", "More", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                                    hasTalkedToQuestGiver = 3;
                                    goToTextView("Accept the quest?", "He's in the sand outskirts.", "Debt Collector", "Accept", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 3) {
                                    hasTalkedToQuestGiver = 0;
                                    bountyStarted = 1;

                                    goToTextView("Quest accepted.", "Counting on you traveller!", "Debt Collector", "", "Leave");
                                }

                            } else {
                                if (bountyKilled) {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        bountyCompleted = 1;
                                        playerMoney += 10;
                                        dungeonKeys++;
                                        goToTextView("Earned 10 gold & a key!", "Thank you for your services.", "Debt Collector", "Take", "");
                                    }
                                } else {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Counting on you traveller!", "Debt Collector", "", "Leave");
                                    }
                                }

                            }

                        } else {
                            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "I owe you one traveller.", "Debt Collector", "", "Leave");
                                }
                        }
                        break;
                    case LETTERGIVER:

                        if (!letterCompleted) {
                            if (!letterStarted) {
                                if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                    hasTalkedToQuestGiver = 1;
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "I don't know what to do!", "Sister", "What?", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                    hasTalkedToQuestGiver = 2;
                                    goToTextView("", "I need a letter to my brother NOW!", "Sister", "Help", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 2) {
                                    hasTalkedToQuestGiver = 3;
                                    goToTextView("Accept the quest?", "He's in the small east town.", "Sister", "Accept", "Leave");
                                }
                                if (textViewChoice == 1 && hasTalkedToQuestGiver == 3) {
                                    hasTalkedToQuestGiver = 0;
                                    letterStarted = 1;
                                    goToTextView("Quest accepted.", "Oh boy! Thank you so much!", "Sister", "", "Leave");
                                }

                            } else {
                                if (letterRecieved) {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        letterCompleted = 1;
                                        dungeonKeys++;
                                        goToTextView("Earned a key!", "Thank you! Take this.", "Sister", "Take", "");
                                    }
                                } else {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Has he gotten it yet??", "Sister", "", "Leave");
                                    }
                                }
                            }

                        } else {
                            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "You're the best!!", "Sister", "", "Leave");
                                }
                        }
                        break;
                    case LETTERDEST:

                        if (letterStarted) {
                            if (!letterCompleted) {
                                if (!letterRecieved) {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        playerMoney += 5;
                                        hasTalkedToQuestGiver = 1;

                                        goToTextView("Earned 5 gold!", "Thank you! I don't have much but.", "Brother", "Take", "");

                                    }
                                    if (textViewChoice == 1 && hasTalkedToQuestGiver == 1) {
                                        hasTalkedToQuestGiver = 0;
                                        letterRecieved = 1;
                                        goToTextView("", "Can you take this back to her?", "Brother", "Yes!", "");
                                    }
                                } else {
                                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                        playSoundB(menuActivate_data, menuActivate_length, 0);
                                        goToTextView("", "Again, thank you so much.", "Brother", "", "Leave");
                                    }
                                }

                            } else {
                                if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                    playSoundB(menuActivate_data, menuActivate_length, 0);
                                    goToTextView("", "You're the best!!", "Brother", "", "Leave");
                                    }
                            }
                        } else {
                            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                goToTextView("", "Do I know you?", "Brother", "", "Leave");
                            }
                        }

                        break;
                }
                textViewChoice = -1;
                break;
            case MERCHANT:
                switch (villagers[i].merchantType) {
                    case BOWUPGRADE:
                        if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                            playSoundB(menuActivate_data, menuActivate_length, 0);
                            goToMerchantView("", "I can upgrade your bow for 15 gold!", "Weaponsmith", "Upgrade", "Leave");
                        }

                        if (textViewChoice == 1) {


                            if (playerMoney >= 15) {
                                playerShootSpeed += 10;
                                playerMoney -= 15;
                                goToMerchantView("Bow speed increased.", "Your bow should feel brand new!", "Shopkeep", "", "Leave");
                            } else {
                                goToTextView("Not enough money!", "I can upgrade your bow for 15 gold!", "Weaponsmith", "", "Leave");
                            }
                        }
                        break;
                    case KEY:



                        if (!boughtKey) {
                            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToMerchantView("Buy key for 10 gold?", "I found this relic in the sand.", "Scavenger", "Buy", "Leave");
                            }
                            if (textViewChoice == 1) {


                                if (playerMoney >= 10) {
                                    dungeonKeys++;
                                    boughtKey = 1;
                                    playerMoney -= 10;
                                    goToMerchantView("Key found!", "Hope you can use for that!", "Scavenger", "", "Leave");
                                } else {
                                    goToTextView("Not enough money!", "I found this relic in the sand.", "Scavenger", "", "Leave");
                                }
                            }
                        } else {
                            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                                playSoundB(menuActivate_data, menuActivate_length, 0);
                                goToTextView("", "How's the quest coming along?", "Scavenger", "", "Leave");
                            }
                        }

                        break;
                }
                textViewChoice = -1;
                break;
            case DOCTOR:
                if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                    playSoundB(menuActivate_data, menuActivate_length, 0);
                    goToTextView("Price: 3 coin", "Are you feeling unwell?", "Doctor", "Heal up", "Leave");
                }
                if (textViewChoice == 1) {


                    if (playerMoney >= 3) {
                        playerHealth = 5;
                        playerMoney -= 3;
                        goToTextView("That's the stuff.", "Give yoruself a break next time!", "Doctor", "", "Leave");
                    } else {
                        goToTextView("Not enough money!", "Are you feeling unwell?", "Doctor", "", "Leave");
                    }


                }
                break;
            case HOSTILE:

                if (cheatActive) {
                    villagers[i].isHostile = 1;
                }




                if (!villagers[i].isHostile) {
                    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                        playSoundB(menuActivate_data, menuActivate_length, 0);
                        goToTextView("", "Got a problem?", "Suspicious Character", "Fight", "Leave");
                    }
                    if (textViewChoice == 1) {


                        goToTextView("...", "You'll die!", "Suspicious Character", "", "Engage");
                        villagers[i].isHostile = 1;
                    }

                }


            }
        }

    }


    savedWorldCol = player.worldCol;
    savedWorldRow = player.worldRow;

    animateTownViewPlayer();
}


void animateTownViewPlayer() {

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


void updateTownViewArrows() {


    bow.hide = 1;
    for (int i = 0; i < 4; i++) {
# 943 "townView.c"
        if ((arrows[i].worldRow - vOff + arrows[i].height - (int) round(arrows[i].velocity*0.1) < 160 - currentTown.floorRow + 8)) {


                arrows[i].worldRow = (int) arrows[i].worldRow - round(arrows[i].velocity*.1);

                bow.hide = 0;
                if (arrows[i].direction == 1) {

                    arrows[i].worldCol = (int) arrows[i].worldCol + round(arrows[i].horVelocity*.1);
                } else {

                    arrows[i].worldCol = (int) arrows[i].worldCol - round(arrows[i].horVelocity*.1);
                }



                arrows[i].velocity = (int) arrows[i].velocity + (-32*.05);

        } else {
            arrows[i].velocity = 0;
            arrows[i].horVelocity = 0;
            arrows[i].hide = 1;
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


void updateTownViewHostileArrows() {
    int playerTookDamage = 0;
    for (int i = 0; i < currentTown.villagerCount; i++) {

        villagers[i].bow.hide = 1;

        for (int j = 0; j < 6; j++) {
# 1001 "townView.c"
            if ((villagers[i].hostileArrows[j].worldRow - vOff + villagers[i].hostileArrows[j].height - (int) round(villagers[i].hostileArrows[j].velocity*0.1) < 160 - currentTown.floorRow + 8)) {


                    villagers[i].hostileArrows[j].worldRow = (int) villagers[i].hostileArrows[j].worldRow - round(villagers[i].hostileArrows[j].velocity*.1);

                    villagers[i].bow.hide = 0;
                    if (villagers[i].sprite.direction == 1) {
                        villagers[i].hostileArrows[j].worldCol = (int) villagers[i].hostileArrows[j].worldCol + round(villagers[i].hostileArrows[j].horVelocity*.1);
                    } else {
                        villagers[i].hostileArrows[j].worldCol = (int) villagers[i].hostileArrows[j].worldCol - round(villagers[i].hostileArrows[j].horVelocity*.1);
                    }

                    villagers[i].hostileArrows[j].velocity = (int) villagers[i].hostileArrows[j].velocity + (-32*.1);

            } else {
                villagers[i].hostileArrows[j].hide = 1;
            }

            if (villagers[i].hostileArrows[j].worldCol < 1 || villagers[i].hostileArrows[j].worldCol > 512 -16) {
                villagers[i].hostileArrows[j].hide = 1;
            }


        }


        if (villagers[i].sprite.direction == 1) {
            villagers[i].bow.worldCol = villagers[i].sprite.worldCol + 5;
        } else {
            villagers[i].bow.worldCol = villagers[i].sprite.worldCol - 5;
        }
        villagers[i].bow.worldRow = villagers[i].sprite.worldRow;
    }






}


void updateTownViewVillagers() {

    int showButton = 0;
    int willShoot;
    int villagerTookDamage = 0;



    for (int i = 0; i < currentTown.villagerCount; i++) {
        if (cheatActive) {
            villagers[i].isHostile = 1;
        }

        if (villagers[i].health <= 0) {
            villagers[i].sprite.hide = 1;
            towns[currentTown.index].enemyDefeated = 1;
            currentTown.enemyDefeated = 1;
        }

        if (villagers[i].doesWander) {


            if(villagers[i].movementCounter % ((rand()%40) + 180) == 0 && !villagers[i].isMoving) {
                villagers[i].timeToMove = 30 + (2*i);
                villagers[i].isMoving = 1;


                if (rand() % 100 > 60) {
                    villagers[i].sprite.direction *= -1;

                }
            }

            for (int j = 0; j < currentTown.villagerCount; j++) {
                if (i != j) {
                    if (collision(villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width, villagers[i].sprite.height,
                        villagers[j].sprite.worldCol, villagers[j].sprite.worldRow, villagers[j].sprite.width, villagers[j].sprite.height) && !villagers[i].isMoving) {
                            villagers[i].timeToMove = 55 - (2*i);
                            villagers[i].isMoving = 1;

                            if (rand() % 100 > 50) {
                                villagers[i].sprite.direction *= -1;

                            }
                    }
                }
            }
        }

        switch(villagers[i].type) {
        case (MERCHANT):
            break;
        case (DOCTOR):
            break;
        case (NORMIE):



            break;
        case QUESTGIVER:
            switch (currentTown.questTownType) {
                case BOWGIVER:

                    break;
                case BOUNTY:
                    break;

            }


            break;
        case (HOSTILE):

        if (villagers[i].damageCooldown > 0) {
            villagers[i].damageCooldown--;
        }

        if (villagers[i].health <= 0) {
            villagers[i].drawIcon = 0;
            villagers[i].sprite.hide = 1;



            bountyKilled = 1;


        }


        if (villagers[i].damageCooldown >= 0) {
            villagers[i].damageCooldown--;
        } else {
            villagers[i].damageCooldown = 0;
        }

        int tookDamage = 0;



        for (int j = 0; j < 4; j++) {
            if (villagers[i].isHostile && villagers[i].health > 0) {
                if (!arrows[j].didDamage && (collision(villagers[i].sprite.worldCol, villagers[i].sprite.worldRow, villagers[i].sprite.width,
                    villagers[i].sprite.height, arrows[j].worldCol, arrows[j].worldRow, arrows[j].width, arrows[j].height) )) {

                    arrows[j].hide = 1;
                    arrows[j].didDamage = 1;
                    arrows[j].worldCol = 0;
                    arrows[j].worldRow = 0;
                    arrows[j].hide = 1;
                    playSoundB(enemyHit_data, enemyHit_length, 0);

                }
            }

            if (arrows[j].didDamage && villagers[i].damageCooldown < 2 ) {
                arrows[j].didDamage = 0;
                villagers[i].health -= 1;
                villagers[i].damageCooldown = 10;
                if (villagers[i].health <= 0 ) {
                    villagers[i].sprite.hide = 1;
                    if (cheatActive) {
                        playerMoney++;
                    }

                }
            }
        }
# 1199 "townView.c"
            if (villagers[i].isHostile && villagers[i].sprite.hide == 0) {
                villagers[i].shootCounter++;
                willShoot = 1;


                int distanceToKeep = 80;
                int distanceToAvoid = 40;
                int distanceFromPlayer = villagers[i].sprite.worldCol - player.worldCol;

                villagers[i].timeToWait--;


                if (villagers[i].timeToWait < 3 && abs(distanceFromPlayer) > distanceToKeep) {
                    villagers[i].isMoving++;
                    villagers[i].timeToMove = 20 + (4*i);
                    villagers[i].isMoving = 1;
                    if (distanceFromPlayer > 0) {

                        villagers[i].sprite.direction = -1;

                    } else {

                        villagers[i].sprite.direction = 1;
                    }

                } else {
                    if (abs(distanceFromPlayer) < distanceToAvoid) {
                        if (!villagers[i].hasWaited) {
                            willShoot = 0;
                            villagers[i].timeToWait = 20;
                            villagers[i].hasWaited = 1;
                        }
                        if (distanceFromPlayer > 0) {

                            villagers[i].sprite.direction = -1;

                        } else {

                            villagers[i].sprite.direction = 1;
                        }

                    }

                }



                if (willShoot && villagers[i].shootCounter % 60 < 3+i) {
                    for (int j = 0; j < 6; j++) {

                        if (villagers[i].hostileArrows[j].hide) {
                            villagers[i].hostileArrows[j].hide = 0;
                            villagers[i].hostileArrows[j].worldRow = villagers[i].sprite.worldRow - 3;
                            villagers[i].hostileArrows[j].worldCol = villagers[i].sprite.worldCol;
                            villagers[i].hostileArrows[j].velocity = 10;
                            villagers[i].hostileArrows[j].horVelocity = 80;

                            villagers[i].hostileArrows[j].direction = villagers[i].sprite.direction;

                            break;
                        }
                    }
                }
            break;
            }


        }


        if (villagers[i].isMoving) {
            villagers[i].sprite.worldCol += (villagers[i].sprite.direction*villagers[i].sprite.cdel);
            villagers[i].timeToMove--;
        }
        if (villagers[i].sprite.worldCol <= 1 || villagers[i].sprite.worldCol > 512 - 16) {
            villagers[i].sprite.direction = villagers[i].sprite.direction*-1;
        }



        if (villagers[i].timeToMove == 0) {

            villagers[i].timeToMove == 0;
            villagers[i].isMoving = 0;
        }
        villagers[i].movementCounter++;


    }

    animateTownViewVillagers();
}


void animateTownViewVillagers() {
    for (int i = 0; i < currentTown.villagerCount; i++) {

        if(!villagers[i].isMoving && !villagers[i].isHostile)
            villagers[i].sprite.aniState = SPRITEFRONT;






        villagers[i].sprite.prevAniState = villagers[i].sprite.aniState;
        villagers[i].sprite.aniState = SPRITEIDLE;

        if(villagers[i].sprite.aniCounter % 20 == 0) {
            villagers[i].sprite.curFrame = (villagers[i].sprite.curFrame + 1) % villagers[i].sprite.numFrames;
        }

        if(villagers[i].sprite.direction == -1 && villagers[i].isMoving)
            villagers[i].sprite.aniState = SPRITELEFT;
        if(villagers[i].sprite.direction == 1 && villagers[i].isMoving)
            villagers[i].sprite.aniState = SPRITERIGHT;

        if (villagers[i].sprite.aniState == SPRITEIDLE) {

            villagers[i].sprite.curFrame = 0;
            villagers[i].sprite.aniCounter = 0;
            villagers[i].sprite.aniState = villagers[i].sprite.prevAniState;
        } else {
            villagers[i].sprite.aniCounter++;
        }
    }


}


void drawTownView() {

    drawTownViewPlayer();

    drawTownViewVillagers();

    drawTownViewArrows();

    drawTownViewHostileArrows();

    drawButtons(hOff, vOff);

    drawGlobal();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000018) = hOff/2;
}


void drawTownViewPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & player.worldRow - vOff) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & player.worldCol - hOff) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((player.curFrame * 2)*32+(player.aniState * 2));
    }



}

void drawTownViewVillagers() {
    for (int i = 0; i < currentTown.villagerCount; i++) {
        if (villagers[i].sprite.hide) {
            shadowOAM[10+i].attr0 |= (2<<8);
        } else {
            shadowOAM[10+i].attr0 = (0xFF & villagers[i].sprite.worldRow - vOff) | (0<<14);
            shadowOAM[10+i].attr1 = (0x1FF & villagers[i].sprite.worldCol - hOff) | (1<<14);




            switch(villagers[i].type) {
            case NORMIE:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((villagers[i].sprite.curFrame * 2)*32+(8 + villagers[i].sprite.aniState * 2))
                                                                                           ;
                break;
            case MERCHANT:

                switch (villagers[i].merchantType) {
                    case BOWUPGRADE:
                        if (playerShootSpeed < 50) {
                            villagers[i].drawIcon = 1;
                        }
                        break;
                    case KEY:
                        if (!boughtKey) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }
                        break;
                }


                shadowOAM[10+i].attr2 = ((3)<<12) | ((18 + villagers[i].sprite.curFrame * 2)*32+(8 + villagers[i].sprite.aniState * 2))
                                                                                                ;

                if (villagers[i].drawIcon) {
                    shadowOAM[91].attr0 = 0xFF & villagers[i].sprite.worldRow - vOff - 20| (0<<13) | (0<<14);
                    shadowOAM[91].attr1 = 0x1FF & villagers[i].sprite.worldCol - hOff | (1<<14);
                    shadowOAM[91].attr2 = ((2)<<12) | ((10)*32+(6));
                } else {
                    shadowOAM[91].attr0 |= (2<<8);
                }
                break;
            case QUESTGIVER:
                switch (villagers[i].questType) {
                    case BOWGIVER:
                        if (!playerHasBow) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }

                        shadowOAM[10+i].attr2 = ((3)<<12) | ((24 + villagers[i].sprite.curFrame * 2)*32+(8 + villagers[i].sprite.aniState * 2))
                                                                                                        ;
                        break;
                    case BOUNTY:

                        if ((!bountyCompleted && !bountyStarted) || (!bountyCompleted && bountyKilled)) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }

                        shadowOAM[10+i].attr2 = ((3)<<12) | ((24 + villagers[i].sprite.curFrame * 2)*32+(0 + villagers[i].sprite.aniState * 2))
                                                                                                        ;
                        break;
                    case LETTERGIVER:

                        if (!letterCompleted && (!letterStarted || letterRecieved)) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }

                        shadowOAM[10+i].attr2 = ((3)<<12) | ((12 + villagers[i].sprite.curFrame * 2)*32+(8 + villagers[i].sprite.aniState * 2))
                                                                                                        ;
                        break;
                    case LETTERDEST:

                        if (!letterCompleted && !letterRecieved && letterStarted) {
                            villagers[i].drawIcon = 1;
                        } else {
                            villagers[i].drawIcon = 0;
                        }


                        shadowOAM[10+i].attr2 = ((3)<<12) | ((18 + villagers[i].sprite.curFrame * 2)*32+(0 + villagers[i].sprite.aniState * 2))
                                                                                                        ;
                        break;

                }


                if (villagers[i].drawIcon) {
                    shadowOAM[90-i].attr0 = 0xFF & villagers[i].sprite.worldRow - vOff - 20| (0<<13) | (0<<14);
                    shadowOAM[90-i].attr1 = 0x1FF & villagers[i].sprite.worldCol - hOff | (1<<14);
                    shadowOAM[90-i].attr2 = ((3)<<12) | ((12)*32+(0));
                } else {
                    shadowOAM[90-i].attr0 |= (2<<8);
                }
                break;
            case DOCTOR:
                shadowOAM[10+i].attr2 = ((0)<<12) | ((6 + villagers[i].sprite.curFrame * 2)*32+(8 + villagers[i].sprite.aniState * 2))
                                                                                               ;

                break;
            case HOSTILE:

                if (!bountyCompleted && !bountyKilled ) {
                    villagers[i].drawIcon = 1;
                } else {
                    villagers[i].drawIcon = 0;
                }

                if (villagers[i].isHostile) {
                    villagers[i].drawIcon = 0;
                }

                shadowOAM[10+i].attr2 = ((0)<<12) | ((villagers[i].sprite.curFrame * 2)*32+(16 + villagers[i].sprite.aniState * 2))
                                                                                            ;

                if (villagers[i].drawIcon) {
                    shadowOAM[90-i].attr0 = 0xFF & villagers[i].sprite.worldRow - vOff - 20| (0<<13) | (0<<14);
                    shadowOAM[90-i].attr1 = 0x1FF & villagers[i].sprite.worldCol - hOff | (1<<14);
                    shadowOAM[90-i].attr2 = ((3)<<12) | ((12)*32+(0));
                } else {
                    shadowOAM[90-i].attr0 |= (2<<8);
                }
                break;

            }
        }
    }
}


void drawTownViewHostileArrows() {
    for (int i = 0; i < currentTown.villagerCount; i++) {



            int drawBow = 0;
            for (int j = 0; j < 6; j++) {
                if (villagers[i].hostileArrows[j].hide) {
                    shadowOAM[45+i*j].attr0 |= (2<<8);
                } else {
                    drawBow = 1;
                    shadowOAM[45+i*j].attr0 = (0xFF & villagers[i].hostileArrows[j].worldRow - vOff) | (0<<14);
                    shadowOAM[45+i*j].attr1 = (0x1FF & villagers[i].hostileArrows[j].worldCol - hOff) | (1<<14);
                    if (villagers[i].hostileArrows[j].direction == 1) {
                        shadowOAM[45+i*j].attr2 = ((1)<<12) | ((10)*32+(0));
                    } else {
                        shadowOAM[45+i*j].attr2 = ((1)<<12) | ((10)*32+(2));
                    }
                }

            }

            if (villagers[i].bow.hide) {
                    shadowOAM[20+i].attr0 |= (2<<8);
            } else {
                if (villagers[i].isHostile && villagers[i].sprite.direction == 1) {
                    shadowOAM[20+i].attr0 = (0xFF & villagers[i].bow.worldRow - vOff) | (0<<14);
                    shadowOAM[20+i].attr1 = (0x1FF & villagers[i].bow.worldCol - hOff) | (1<<14);
                    shadowOAM[20+i].attr2 = ((1)<<12) | ((8)*32+(0));
                } else {
                    shadowOAM[20+i].attr0 = (0xFF & villagers[i].bow.worldRow - vOff) | (0<<14);
                    shadowOAM[20+i].attr1 = (0x1FF & villagers[i].bow.worldCol - hOff) | (1<<14);
                    shadowOAM[20+i].attr2 = ((1)<<12) | ((8)*32+(2));
                }
            }



    }

}


void drawTownViewArrows() {
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


    if (bow.hide || drawBow == 0) {
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
