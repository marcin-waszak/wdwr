model;

param M;
param N;
param efficiency {1..M, 1..N};

param R {1..M};
param C {1..N};

var t {1..M};
var c {1..N};

minimize cost: sum {m in 1..M} R[m] * t[m];

subject to c1 {n in 1..N}:
  sum {m in 1..M} t[m] * efficiency[m,n] >= C[n];

subject to t1 {m in 1..M}:
  t[m] <= 180;
