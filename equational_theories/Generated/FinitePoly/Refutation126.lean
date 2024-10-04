
import equational_theories.AllEquations
import equational_theories.FactsSyntax
import equational_theories.MemoFinOp
import equational_theories.DecideBang

/-!
This file is generated from the following refutation as produced by
random generation of polynomials:
'(1 * x**2 + 0 * y**2 + 1 * x + 2 * y + 0 * x * y) % 3' (0, 7, 15, 410, 418, 435, 465, 499, 512, 527, 574, 816, 1019, 1044, 1074, 1121, 1183, 1222, 1324, 1628, 1646, 1690, 1730, 1779, 1831, 1839, 1920, 1933, 1948, 2034, 2136, 3252, 3260, 3277, 3305, 3318, 3333, 3352, 3413, 3658, 3861, 3886, 3914, 3961, 4022, 4064, 4117, 4274, 4306)
-/

set_option linter.unusedVariables false

/-! The magma definition -/
def «FinitePoly x² + x + 2 * y % 3» : Magma (Fin 3) where
  op := memoFinOp fun x y => x*x + x + 2 * y

/-! The facts -/
@[equational_result]
theorem «Facts from FinitePoly x² + x + 2 * y % 3» :
  ∃ (G : Type) (_ : Magma G), Facts G [16, 817, 1325, 2137, 3659, 4118] [47, 99, 151, 203, 255, 307, 359, 412, 413, 414, 416, 417, 420, 426, 427, 429, 430, 437, 439, 440, 463, 464, 467, 473, 474, 476, 477, 501, 503, 504, 510, 511, 614, 818, 819, 820, 822, 823, 825, 826, 832, 833, 835, 836, 842, 843, 845, 846, 869, 870, 872, 873, 879, 880, 882, 883, 906, 907, 909, 910, 916, 917, 919, 1021, 1022, 1023, 1025, 1026, 1028, 1029, 1035, 1036, 1038, 1039, 1046, 1048, 1049, 1072, 1073, 1076, 1082, 1083, 1085, 1086, 1109, 1110, 1112, 1113, 1119, 1120, 1224, 1225, 1226, 1228, 1229, 1231, 1232, 1238, 1239, 1241, 1242, 1248, 1249, 1251, 1252, 1275, 1276, 1278, 1279, 1285, 1286, 1288, 1289, 1312, 1313, 1315, 1316, 1322, 1323, 1426, 1630, 1631, 1632, 1634, 1635, 1637, 1638, 1644, 1645, 1648, 1654, 1655, 1657, 1658, 1681, 1682, 1684, 1685, 1692, 1694, 1695, 1718, 1719, 1721, 1722, 1728, 1729, 1833, 1834, 1835, 1837, 1838, 1841, 1847, 1848, 1850, 1851, 1857, 1858, 1860, 1861, 1884, 1885, 1887, 1888, 1894, 1895, 1897, 1898, 1922, 1924, 1925, 1931, 1932, 2036, 2037, 2038, 2040, 2041, 2043, 2044, 2050, 2051, 2053, 2054, 2060, 2061, 2063, 2064, 2087, 2088, 2090, 2091, 2097, 2098, 2100, 2101, 2124, 2125, 2127, 2128, 2134, 2135, 2238, 2441, 2644, 2847, 3050, 3254, 3255, 3256, 3258, 3259, 3262, 3268, 3269, 3271, 3272, 3279, 3281, 3308, 3309, 3315, 3316, 3318, 3342, 3343, 3345, 3346, 3352, 3456, 3660, 3661, 3662, 3664, 3665, 3667, 3668, 3674, 3675, 3677, 3678, 3684, 3685, 3687, 3712, 3714, 3721, 3722, 3724, 3725, 3748, 3749, 3751, 3752, 3759, 3761, 3864, 3865, 3867, 3868, 3870, 3871, 3877, 3878, 3880, 3881, 3888, 3890, 3917, 3918, 3924, 3925, 3927, 3928, 3951, 3952, 3954, 3955, 3961, 3964, 4066, 4067, 4068, 4070, 4071, 4073, 4074, 4080, 4081, 4083, 4084, 4090, 4091, 4093, 4120, 4121, 4127, 4128, 4130, 4131, 4155, 4157, 4158, 4164, 4165, 4167, 4268, 4269, 4270, 4272, 4273, 4276, 4283, 4284, 4290, 4291, 4293, 4314, 4320, 4321, 4343, 4380, 4583, 4584, 4585, 4587, 4588, 4590, 4591, 4598, 4599, 4605, 4606, 4608, 4629, 4635, 4636, 4658] :=
    ⟨Fin 3, «FinitePoly x² + x + 2 * y % 3», by decideFin!⟩
