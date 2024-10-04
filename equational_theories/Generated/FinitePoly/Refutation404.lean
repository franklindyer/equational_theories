
import equational_theories.AllEquations
import equational_theories.FactsSyntax
import equational_theories.MemoFinOp
import equational_theories.DecideBang

/-!
This file is generated from the following refutation as produced by
random generation of polynomials:
'(0 * x**2 + 2 * y**2 + 0 * x + 1 * y + 2 * x * y) % 4' (0, 2, 7, 15, 22, 27, 46, 54, 64, 71, 98, 103, 116, 126, 137, 150, 158, 165, 178, 193, 202, 207, 217, 227, 237, 254, 259, 269, 279, 289, 306, 314, 325, 332, 358, 363, 374, 384, 394, 410, 418, 428, 435, 465, 472, 499, 512, 527, 561, 574, 613, 618, 631, 641, 652, 668, 678, 689, 702, 712, 722, 816, 824, 831, 844, 859, 871, 878, 908, 915, 946, 959, 1019, 1024, 1034, 1044, 1054, 1074, 1084, 1095, 1111, 1121, 1132, 1149, 1166, 1183, 1201, 1222, 1227, 1237, 1247, 1257, 1277, 1287, 1298, 1314, 1324, 1335, 1352, 1369, 1386, 1404, 1425, 1433, 1443, 1450, 1477, 1490, 1505, 1517, 1524, 1559, 1585, 1628, 1633, 1646, 1656, 1667, 1680, 1690, 1700, 1720, 1730, 1741, 1762, 1779, 1796, 1815, 1831, 1839, 1846, 1859, 1874, 1883, 1896, 1911, 1920, 1933, 1948, 1957, 1978, 1999, 2023, 2034, 2042, 2049, 2062, 2077, 2086, 2099, 2114, 2123, 2136, 2151, 2160, 2181, 2202, 2226, 2237, 2242, 2252, 2262, 2272, 2289, 2299, 2309, 2326, 2336, 2346, 2363, 2380, 2397, 2414, 2440, 2445, 2455, 2465, 2475, 2492, 2502, 2512, 2529, 2539, 2549, 2566, 2583, 2600, 2617, 2643, 2648, 2658, 2668, 2678, 2695, 2705, 2715, 2732, 2742, 2752, 2769, 2786, 2803, 2820, 2846, 2851, 2861, 2871, 2881, 2898, 2908, 2918, 2935, 2945, 2955, 2972, 2989, 3006, 3023, 3049, 3054, 3064, 3074, 3084, 3101, 3111, 3121, 3138, 3148, 3158, 3175, 3192, 3209, 3226, 3252, 3260, 3270, 3277, 3305, 3318, 3333, 3345, 3352, 3387, 3413, 3455, 3460, 3473, 3483, 3494, 3511, 3521, 3532, 3545, 3555, 3565, 3658, 3666, 3673, 3686, 3701, 3714, 3721, 3751, 3758, 3789, 3802, 3861, 3866, 3876, 3886, 3896, 3914, 3924, 3934, 3951, 3961, 3971, 3988, 4005, 4022, 4039, 4064, 4069, 4079, 4089, 4099, 4117, 4127, 4137, 4154, 4164, 4174, 4191, 4208, 4225, 4242, 4274, 4306, 4319, 4361, 4379, 4384, 4398, 4408, 4419, 4434, 4444, 4455, 4469, 4479, 4489, 4586, 4605, 4614, 4644, 4665, 4688)
-/

set_option linter.unusedVariables false

/-! The magma definition -/
def «FinitePoly 2 * y² + y + 2 * x * y % 4» : Magma (Fin 4) where
  op := memoFinOp fun x y => 2 * y*y + y + 2 * x * y

/-! The facts -/
@[equational_result]
theorem «Facts from FinitePoly 2 * y² + y + 2 * x * y % 4» :
  ∃ (G : Type) (_ : Magma G), Facts G [16, 28, 55, 65, 72, 138, 194, 238, 315, 395, 562, 653, 690, 723, 860, 947, 960, 1202, 1506, 1560, 1586, 1816, 2024, 2415, 3388, 3495, 3566, 3702, 3790, 3803, 4362, 4420, 4456, 4490] [50, 53, 56, 63, 66, 73, 75, 102, 105, 107, 108, 115, 118, 124, 125, 154, 157, 160, 167, 169, 170, 176, 177, 206, 209, 211, 212, 219, 221, 222, 229, 231, 258, 261, 263, 264, 271, 273, 274, 281, 283, 323, 412, 413, 414, 416, 417, 420, 426, 427, 430, 437, 439, 440, 463, 464, 467, 474, 476, 477, 501, 503, 504, 510, 511, 615, 616, 617, 620, 622, 623, 629, 630, 633, 639, 640, 643, 666, 667, 670, 676, 677, 680, 704, 706, 707, 714, 716, 818, 819, 820, 822, 823, 826, 833, 835, 836, 842, 843, 846, 869, 870, 873, 880, 882, 883, 906, 907, 910, 917, 919, 1021, 1022, 1023, 1026, 1028, 1029, 1036, 1038, 1039, 1046, 1048, 1049, 1072, 1073, 1076, 1082, 1083, 1086, 1109, 1110, 1113, 1119, 1120, 1224, 1225, 1226, 1229, 1231, 1232, 1239, 1241, 1242, 1249, 1251, 1252, 1275, 1276, 1279, 1285, 1286, 1289, 1312, 1313, 1316, 1322, 1323, 1427, 1428, 1429, 1431, 1432, 1435, 1441, 1442, 1445, 1452, 1454, 1455, 1479, 1481, 1482, 1488, 1489, 1492, 1515, 1516, 1519, 1526, 1528, 1630, 1631, 1632, 1635, 1637, 1638, 1644, 1645, 1648, 1654, 1655, 1658, 1682, 1684, 1685, 1692, 1694, 1695, 1718, 1719, 1722, 1728, 1729, 1833, 1834, 1835, 1837, 1838, 1841, 1848, 1850, 1851, 1857, 1858, 1861, 1885, 1887, 1888, 1894, 1895, 1898, 1922, 1924, 1925, 1931, 1932, 2036, 2037, 2038, 2040, 2041, 2044, 2051, 2053, 2054, 2060, 2061, 2064, 2088, 2090, 2091, 2097, 2098, 2101, 2125, 2127, 2128, 2134, 2135, 2239, 2240, 2241, 2244, 2246, 2247, 2254, 2256, 2257, 2264, 2266, 2267, 2291, 2293, 2294, 2301, 2303, 2304, 2328, 2330, 2331, 2338, 2340, 2442, 2443, 2444, 2447, 2449, 2450, 2457, 2459, 2460, 2467, 2469, 2470, 2494, 2496, 2497, 2504, 2506, 2507, 2531, 2533, 2534, 2541, 2543, 2645, 2646, 2647, 2650, 2652, 2653, 2660, 2662, 2663, 2670, 2672, 2673, 2697, 2699, 2700, 2707, 2709, 2710, 2734, 2736, 2737, 2744, 2746, 2848, 2849, 2850, 2853, 2855, 2856, 2863, 2865, 2866, 2873, 2875, 2876, 2900, 2902, 2903, 2910, 2912, 2913, 2937, 2939, 2940, 2947, 2949, 3051, 3052, 3053, 3056, 3058, 3059, 3066, 3068, 3069, 3076, 3078, 3079, 3103, 3105, 3106, 3113, 3115, 3116, 3140, 3142, 3143, 3150, 3152, 3254, 3255, 3256, 3258, 3259, 3262, 3268, 3269, 3272, 3279, 3281, 3308, 3309, 3315, 3316, 3318, 3342, 3343, 3345, 3352, 3355, 3457, 3458, 3459, 3462, 3464, 3465, 3472, 3475, 3481, 3482, 3509, 3511, 3518, 3519, 3521, 3545, 3548, 3549, 3555, 3558, 3660, 3661, 3662, 3664, 3665, 3668, 3675, 3677, 3678, 3684, 3685, 3712, 3714, 3721, 3724, 3725, 3748, 3749, 3751, 3758, 3761, 3864, 3865, 3868, 3870, 3871, 3878, 3880, 3881, 3888, 3890, 3917, 3918, 3924, 3927, 3928, 3951, 3954, 3955, 3961, 3964, 4066, 4067, 4068, 4071, 4073, 4074, 4081, 4083, 4084, 4091, 4093, 4120, 4121, 4127, 4130, 4131, 4154, 4157, 4158, 4164, 4167, 4268, 4269, 4270, 4272, 4273, 4276, 4283, 4284, 4290, 4291, 4293, 4314, 4321, 4343, 4396, 4398, 4405, 4406, 4408, 4433, 4436, 4442, 4443, 4472, 4473, 4479, 4482, 4583, 4584, 4585, 4588, 4590, 4591, 4598, 4599, 4605, 4608, 4629, 4635, 4636, 4658] :=
    ⟨Fin 4, «FinitePoly 2 * y² + y + 2 * x * y % 4», by decideFin!⟩
