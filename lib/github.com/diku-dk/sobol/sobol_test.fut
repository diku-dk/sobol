-- | ignore

import "sobol"
import "sobol-dir-50"

module sobol = Sobol sobol_dir { let D = 2 }

-- ==
-- entry: sobol_pi
-- input { 100 }
-- output { 3.160000f64 }
-- input { 1000 }
-- output { 3.144000f64 }

entry sobol_pi (n:i32) : f64 =
  let hits =
    map (\v -> if v[0]*v[0]+v[1]*v[1]<1.0 then 1.0
               else 0.0)
        (sobol.sobol n)
  in 4.0 * reduce (+) 0.0 hits / r64 n

-- ==
-- entry: test_chunk
-- input { 3 }
-- output { [[0.000000f64, 0.000000f64], [0.500000f64, 0.500000f64], [0.750000f64, 0.250000f64]] }

entry test_chunk (n:i32) : [n][2]f64 = sobol.chunk 0 n

-- ==
-- entry: test_independent
-- input { 2 }
-- output { [0.750000f64, 0.250000f64] }

entry test_independent (n:i32) : [2]f64 =
  map (\x -> f64.u32 x / sobol.norm) (sobol.independent n)

-- ==
-- entry: test_recurrent
-- input { 2 }
-- output { [0.750000f64, 0.250000f64] }

entry test_recurrent (n:i32) : [2]f64 =
  let v = if n <= 1 then sobol.independent n
          else sobol.recurrent n (sobol.independent (n-1))
  in map (\x -> f64.u32 x / sobol.norm) v
