# Sobol library for Futhark

This library is a convenient and modular library for efficiently
generating large quantities of quasi-random numbers (in multiple
dimensions) in a parallel and purely functional setting.  Sobol
numbers are particularly useful for Monte Carlo simulations, which are
a core application of massive parallelism.

Sobol sequences are quasi-random low-discrepancy sequences frequently
used in Monte-Carlo algorithms and they generalize nicely to multiple
dimensions.  Sobol sequences are superior to traditional pseudo-random
numbers for numeric integration (by Monte-Carlo simulation).  Sobol
sequences simply span the space much better than their pseudo-random
counterparts. In fact, it has been shown that while the value of a
multi-dimensional integral for a continuous and differentiable
function can be approximated with a convergence rate of _1/n_ using
pseudo-random numbers, using Sobol sequences, the convergence rate is
_1/sqrt(n)_.

For a discussion of the implementation, please consult [1].

## Installation

```
$ futhark-pkg add github.com/diku-dk/sobol
$ futhark-pkg sync
```

## Usage example

```
$ futharki
> import "lib/github.com/diku-dk/sobol/sobol-dir-50"
> import "lib/github.com/diku-dk/sobol/sobol"
> module s = Sobol sobol_dir { let D = 2 }
> s.sobol 3
```

[1] Troels Henriksen, Martin Elsman, and Cosmin E. Oancea. __Modular
Acceleration: Tricky Cases of Functional High-Performance
Computing__. In _Proceedings of the 6th ACM SIGPLAN workshop on
Functional High-Performance Computing (FHPC ‘18)_. St. Louis, Missouri,
USA. September 2018.