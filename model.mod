model;

param M; # liczba maszyn
param N; # liczba czesci
param efficiency {1..M, 1..N}; # wydajnosc [szt / h]

param R {1..M};	# koszty maszyn [pln / h]
param C {1..N};	# minimalne iloœci wypr. czesci

var t {1..M, 1..N};	# czas[maszyna,czesc]
var d {n in 1..N} = sum {m in 1..M} t[m,n] * efficiency[m,n];

minimize cost: sum {m in 1..M, n in 1..N} R[m] * t[m,n];

subject to c1 {n in 1..N}:
  d[n] >= C[n];

subject to t1 {m in 1..M}:
  sum {n in 1..N} t[m,n] <= 180;
  
subject to t2 {m in 1..M, n in 1..N}:
  t[m,n] >= 0;
