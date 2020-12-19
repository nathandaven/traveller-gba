# 1 "playerJump.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "playerJump.c"


const unsigned int playerJump_sampleRate = 11025;
const unsigned int playerJump_length = 1952;

const signed char playerJump_data[] = {
0, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, -1, 0, -1,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1,
-1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0,
0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0,
0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, -1, -1, -1,
-1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1,
-1, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, 0, 0, 1, 0, -1, -1, 0, 0,
-1, -1, -2, -2, -1, -1, -2, -3, -3, -2, -2, -1, -2, -2, -3, -2, -1, 0, 0, -1,
1, 1, 1, 1, 1, 1, 1, 3, 3, 2, 1, 1, 1, 1, 0, 0, -2, -2, -3, -3,
-4, -5, -6, -7, -7, -6, -4, -4, -2, -1, -1, 0, 1, 1, 0, 0, 2, 3, 3, 2,
2, 2, 4, 5, 3, 2, 0, 1, 1, 0, -2, -4, -5, -5, -6, -8, -9, -8, -6, -4,
-1, 0, 0, 2, 3, 4, 1, 1, 0, 1, 3, 3, 3, 2, 4, 5, 4, 4, 3, 2,
0, 0, -2, -6, -8, -11, -14, -15, -9, -5, -4, -3, -3, 2, 6, 7, 4, 1, 0, 1,
3, 3, 2, 1, 3, 5, 5, 4, 4, 3, 4, 2, -1, -6, -9, -10, -14, -16, -14, -10,
-4, 1, 1, 1, 5, 10, 9, 4, 0, 0, 2, 5, 5, 2, 1, 4, 7, 6, 5, 3,
2, 2, 1, -5, -12, -17, -21, -18, -11, -6, -5, -5, 2, 9, 12, 12, 6, 1, 1, 5,
4, 1, 1, 0, 3, 6, 7, 5, 4, 6, 4, 0, -6, -10, -17, -23, -20, -15, -10, -5,
3, 7, 9, 11, 13, 9, 4, 3, 2, 1, 2, 2, 1, 2, 5, 6, 6, 5, 4, 2,
-2, -8, -15, -25, -25, -19, -12, -4, 2, 7, 7, 13, 15, 14, 10, 4, 3, 0, 2, 3,
1, 1, 1, 4, 4, 5, 3, 1, -4, -11, -20, -29, -26, -19, -8, 1, 7, 8, 9, 16,
19, 16, 9, 3, 1, 0, 3, 2, -1, -1, 1, 4, 4, 3, 0, -5, -9, -20, -33, -28,
-19, -5, 2, 6, 9, 10, 19, 22, 21, 11, 4, 2, 0, 4, 3, 0, -1, 1, 5, 3,
2, -5, -8, -18, -31, -30, -22, -8, -1, 4, 7, 9, 19, 24, 23, 14, 7, 3, 0, 2,
1, 0, 0, 2, 5, 2, 1, -4, -9, -20, -31, -26, -18, -6, -2, 2, 6, 11, 22, 23,
20, 9, 5, 3, 1, 2, -1, -1, 0, 4, 5, 2, -2, -9, -18, -27, -22, -13, -7, -4,
-3, 3, 10, 20, 23, 17, 9, 6, 6, 0, 0, -3, -4, -1, 3, 3, 0, -4, -9, -22,
-26, -13, -4, -4, -5, -2, 1, 12, 24, 20, 10, 5, 7, 4, 1, -1, -6, -7, -1, 2,
-3, -7, -9, -16, -27, -13, 4, 3, -4, -5, 1, 5, 19, 21, 8, 1, 7, 10, 3, 1,
-4, -8, -3, 3, 0, -9, -14, -17, -29, -18, 4, 5, -3, -4, 3, 7, 19, 24, 10, -1,
3, 11, 2, -2, -5, -10, -5, 4, 3, -11, -13, -19, -29, -12, 6, 5, -8, -7, 4, 8,
19, 23, 11, -2, 7, 14, 4, -2, -7, -10, -6, 3, 3, -9, -13, -15, -23, -15, 4, 4,
-8, -8, 2, 6, 16, 21, 11, 0, 4, 12, 6, -1, -5, -9, -6, 3, 4, -6, -11, -13,
-19, -15, 1, 4, -6, -7, 0, 4, 12, 19, 12, 1, 4, 10, 6, 0, -5, -10, -8, 0,
4, -2, -7, -9, -16, -15, -1, 5, -3, -7, -2, 2, 9, 17, 13, 4, 3, 8, 7, 2,
-4, -9, -10, -3, 3, 0, -4, -7, -12, -14, -4, 3, -1, -6, -4, -2, 4, 14, 14, 7,
3, 6, 9, 5, 0, -7, -10, -6, 0, 0, -4, -8, -13, -15, -6, 5, 3, -5, -7, -4,
1, 10, 12, 6, 1, 4, 8, 8, 5, -2, -6, -5, 0, 2, -1, -5, -10, -16, -10, 1,
3, -2, -6, -5, -3, 6, 13, 8, 2, 3, 5, 5, 7, 3, -3, -5, -2, 0, 0, 0,
-4, -10, -14, -5, 0, -1, -3, -5, -6, -3, 8, 9, 6, 3, 2, 2, 3, 5, 1, -2,
-2, 0, 0, 1, 1, -3, -7, -8, -3, -1, -1, -3, -5, -6, -2, 4, 4, 3, 1, 0,
-1, 0, 1, 0, -1, 0, 1, 1, 1, 2, 0, -1, -2, -1, 0, 1, 0, -2, -2, -2,
0, 0, 0, -2, -3, -5, -4, -3, -2, -1, 0, 0, 1, 3, 3, 2, 1, 0, 0, 0,
1, 1, 2, 2, 3, 2, 2, 1, -1, -3, -4, -4, -4, -3, -3, -2, -1, 1, 1, 1,
0, 0, -1, -1, -1, -1, 0, 1, 1, 1, 2, 2, 1, 0, -1, -1, 0, 0, 1, 1,
2, 2, 2, 1, 0, -1, -2, -3, -4, -3, -2, -1, -1, -1, 0, 0, 0, -1, -2, -3,
-3, -2, -2, -2, -1, 0, 0, 0, 0, 0, -1, -1, -1, -1, 0, 1, 2, 2, 2, 3,
3, 2, 1, 0, -1, -1, -1, -1, 0, 0, 0, -1, -1, -1, -2, -3, -4, -4, -3, -2,
-1, -1, 0, 0, 1, 1, 0, 0, -1, -1, -1, -1, 0, 1, 1, 1, 1, 1, 1, 0,
-1, -1, -1, -1, 0, 0, 0, 1, 1, 1, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0,
0, 0, -1, -1, -2, -2, -2, -2, -1, -1, -1, 0, 1, 1, 0, 0, 0, -1, -1, -1,
-1, 0, 1, 1, 1, 1, 0, 0, -1, -1, -2, -1, -1, -1, -1, -1, 0, 0, -1, -1,
-2, -2, -2, -2, -2, -2, -1, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, 0,
0, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1, -1, -1,
-1, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, -1,
-1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1,
0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, -1, 0, -1, 0, -1, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, -1, 0,
0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, };
