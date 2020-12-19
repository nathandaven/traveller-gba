# 1 "arrowShot.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "arrowShot.c"


const unsigned int arrowShot_sampleRate = 11025;
const unsigned int arrowShot_length = 1840;

const signed char arrowShot_data[] = {
0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1,
0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0,
0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, -1, -3, -2, -3, -2,
-3, -2, -2, -3, -2, -3, -2, -1, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2,
-1, 2, 2, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -2, -3, -2, -3, -2, -3, -2, -3, -2,
-3, -2, -3, -2, -3, -2, -3, -2, -1, -1, -2, -1, -2, -1, -2, -1, 0, 1, 0, 1,
0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
0, -2, -3, -2, -3, -2, -3, -2, -3, -2, -2, -2, -1, -2, -1, -2, -1, -2, -1, -2,
-1, -2, -1, -2, -1, -2, -1, -2, -1, -1, -2, -1, -2, -1, -1, -2, -2, -1, -2, -1,
-2, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -2, -3, -2, -3, -2, -3, -2, -3, -2,
-3, -3, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -1, -2, -1, -2, 3, 5, 4, 5,
4, 5, 3, 4, 3, 4, 3, 4, 3, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2,
-3, 1, 4, 3, 4, 3, 4, 3, 4, 3, 4, 2, 3, 1, -4, -3, -4, -3, -4, -3,
-2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -3, -2, -3, -2, -1, -2,
-1, -2, -1, -2, -1, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1,
-2, -1, -2, -1, 5, 5, 4, 5, 4, 5, 4, 5, 4, 4, 3, 4, 0, -3, -2, -3,
-2, -3, -2, -3, -2, -3, -3, -2, -1, -2, -1, -1, -2, -1, -2, -1, -2, -1, -2, -1,
-2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, -2, -1, 5, 5, 4, 5, 4, 5,
4, 5, 4, 3, 4, 3, 4, 6, 5, 5, 4, 5, 4, 5, 4, 5, 4, 4, 4, -4,
-6, -5, -6, -5, -6, -5, -6, -4, -5, -4, -5, -4, -5, -4, -5, -4, -4, -4, -3, -4,
-3, -4, -3, -4, 3, 7, 6, 6, 5, 6, 5, 6, 5, 5, 4, 5, 4, 5, 4, 5,
4, 4, 2, -5, -6, -5, -6, -5, -6, -5, -5, -4, -5, -4, -5, -1, 6, 5, 5, 4,
5, 4, 5, 4, 5, 4, 4, 3, -4, -6, -5, -6, -5, -6, 2, 5, 4, 5, 4, 4,
3, 4, 3, 4, 3, 4, 0, -7, -6, -7, -6, -5, -6, 2, 4, 3, 4, 3, 4, 3,
4, 3, 4, 3, 3, 2, 3, 2, 3, 2, 3, 1, -8, -7, -7, -6, -7, -6, 3, 4,
3, 3, 2, 3, 2, 3, 2, 3, 2, 3, 0, -8, -7, -8, -7, -7, -6, 3, 4, 3,
2, 3, 2, -5, -7, -6, -7, -6, -8, 0, 4, 3, 4, 3, 4, -1, -7, -6, -7, -7,
-6, -6, -5, -6, -5, -7, -4, -8, 6, 3, -9, -9, -5, 9, 9, 6, -8, -9, -8, 8,
5, -11, -7, -10, -7, -9, -6, -10, -1, 10, -7, -8, -8, 7, 8, -9, 6, 9, -8, 4,
10, -7, -7, -8, 6, 11, 8, 10, 7, 11, -3, -9, -9, 0, 11, -6, -9, -8, -8, -7,
-8, -7, -8, -8, 1, 13, -7, 0, 11, 9, 9, 10, -2, -8, 12, -2, -8, -10, -1, 10,
8, 9, 8, 9, 7, 9, 0, -12, -8, -10, -7, 7, 9, 7, -6, -10, -7, -9, -7, 9,
-3, -10, 8, 8, 9, 8, 7, 8, -5, -9, 8, 7, 8, -9, -1, 11, -9, -1, 8, 9,
1, -11, -9, -9, -11, 0, 9, 7, 7, 9, -5, -10, -11, 2, 5, -11, -9, -9, -8, -8,
-10, 4, 6, -12, 3, 9, 10, 0, -9, 10, 7, 8, -11, -3, 8, -7, -9, -8, 4, 10,
6, 9, 6, -7, -11, -8, -9, -6, 10, -5, -9, -9, 3, 10, -8, -8, -9, -8, -6, 11,
-4, -7, 10, 3, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1,
0, -1, 0, -1, 0, -1, 0, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, -1, -1, 0, -1, 0,
-1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0,
0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, 0, -1, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0,
0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, -1, 0, 0, 0, 0, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, };