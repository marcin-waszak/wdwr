model;

param M; # liczba maszyn
param N; # liczba czesci
param efficiency {1..M, 1..N}; # wydajnosc [szt / h]

param R_exp {1..M};	# koszty maszyn [pln / h]
param R {i in 1..10000, 1..M};
param C {1..N};	# minimalne iloœci wypr. czesci

var t_pri {1..M, 1..N};	# czas 100% wydajnosci [maszyna,czesc]
var t_bis {1..M, 1..N};	# czas 90% wydajnosci [maszyna,czesc]
var d {n in 1..N} = sum {m in 1..M} (t_pri[m,n] * efficiency[m,n] + t_bis[m,n] * 0.9 * efficiency[m,n]);

minimize cost: sum {m in 1..M, n in 1..N} R_exp[m] * (t_pri[m,n] + t_bis[m,n]);

subject to c1 {n in 1..N}:
  d[n] >= C[n];

subject to t1 {m in 1..M}:
  sum {n in 1..N} (t_pri[m,n] + t_bis[m,n]) <= 180;

subject to t2 {m in 1..M, n in 1..N}:
  t_pri[m,n] >= 0;

subject to t3 {m in 1..M, n in 1..N}:
  t_bis[m,n] >= 0;

subject to t4 {m in 1..M}:
  sum {n in 1..N} t_pri[m,n] <= 100;
