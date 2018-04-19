model;

param M;
param N;
param efficiency {1..M, 1..N};

param R {1..M};
param C {1..N};

var t {1..M};
var c {1..N};

minimize cost: sum {m in 1..M} R[m] * t[m];

s.t. c1: sum {m in 1..M} t[m] * efficiency[m,1] >= C[1];
s.t. c2: sum {m in 1..M} t[m] * efficiency[m,2] >= C[2];
s.t. c3: sum {m in 1..M} t[m] * efficiency[m,3] >= C[3];
s.t. c4: sum {m in 1..M} t[m] * efficiency[m,4] >= C[4];
s.t. c5: sum {m in 1..M} t[m] * efficiency[m,5] >= C[5];

subject to t1 {m in 1..M}:
  t[m] <= 180;
