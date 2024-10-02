
import equational_theories.AllEquations
import equational_theories.FactsSyntax
import equational_theories.MemoFinOp
import equational_theories.DecideBang

/-!
This file is generated from the following operator table:
[[0, 1, 2, 3], [2, 3, 0, 1], [3, 2, 1, 0], [1, 0, 3, 2]]
-/

set_option linter.unusedVariables false

/-! The magma definition -/
def «FinitePoly [[0, 1, 2, 3], [2, 3, 0, 1], [3, 2, 1, 0], [1, 0, 3, 2]]» : Magma (Fin 4) where
  op := memoFinOp fun x y => [[0, 1, 2, 3], [2, 3, 0, 1], [3, 2, 1, 0], [1, 0, 3, 2]][x.val]![y.val]!

/-! The facts -/
@[equational_result]
theorem «Facts from FinitePoly [[0, 1, 2, 3], [2, 3, 0, 1], [3, 2, 1, 0], [1, 0, 3, 2]]» :
  ∃ (G : Type) (_ : Magma G), Facts G [264, 271, 283, 1029, 1039, 1083, 1110, 1638, 1655, 1685, 1719, 1851, 1858, 1888, 1895, 3388, 3871, 3881, 3927, 3954, 4591, 4608, 4636, 4658] [2, 3, 10, 11, 14, 23, 38, 39, 40, 43, 47, 99, 151, 203, 256, 257, 258, 260, 261, 263, 270, 273, 274, 280, 281, 307, 331, 359, 407, 412, 413, 414, 416, 417, 420, 426, 427, 430, 437, 439, 440, 463, 464, 467, 474, 476, 477, 501, 503, 504, 510, 511, 614, 817, 1021, 1022, 1023, 1025, 1026, 1028, 1035, 1036, 1038, 1046, 1048, 1049, 1072, 1073, 1076, 1082, 1085, 1086, 1109, 1112, 1113, 1119, 1120, 1223, 1426, 1630, 1631, 1632, 1634, 1635, 1637, 1644, 1645, 1648, 1654, 1657, 1658, 1681, 1682, 1684, 1692, 1694, 1695, 1718, 1721, 1722, 1728, 1729, 1833, 1834, 1835, 1837, 1838, 1841, 1847, 1848, 1850, 1857, 1860, 1861, 1884, 1885, 1887, 1894, 1897, 1898, 1922, 1924, 1925, 1931, 1932, 2035, 2238, 2441, 2644, 2847, 3050, 3254, 3255, 3256, 3258, 3259, 3262, 3268, 3269, 3272, 3279, 3281, 3308, 3309, 3315, 3316, 3318, 3337, 3342, 3343, 3345, 3352, 3355, 3456, 3543, 3659, 3864, 3865, 3867, 3868, 3870, 3877, 3878, 3880, 3888, 3890, 3916, 3917, 3918, 3924, 3925, 3928, 3951, 3952, 3955, 3961, 3964, 4055, 4065, 4258, 4268, 4269, 4270, 4272, 4273, 4276, 4283, 4284, 4290, 4291, 4293, 4314, 4321, 4343, 4368, 4373, 4380, 4539, 4547, 4571, 4583, 4584, 4585, 4587, 4588, 4590, 4598, 4599, 4605, 4606, 4629, 4635, 4683, 4688] :=
    ⟨Fin 4, «FinitePoly [[0, 1, 2, 3], [2, 3, 0, 1], [3, 2, 1, 0], [1, 0, 3, 2]]», by decideFin!⟩