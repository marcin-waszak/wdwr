model;

param max_cost;

param M; # liczba maszyn
param N; # liczba czesci
param efficiency {1..M, 1..N}; # wydajnosc [szt/h]

param C {1..N};	# minimalne ilosci wypr. czesci
param R {i in 1..10000, 1..M}; # scenariusze kosztow maszyn
param R_exp {1..M};		# wartosci oczekiwane kosztow maszyn [pln/h]

var u {1..M} binary;
var t_pri {1..M, 1..N};	# czas 100% wydajnosci [maszyna,czesc]
var t_bis {1..M, 1..N};	# czas 90% wydajnosci [maszyna,czesc]
var t_tot {m in 1..M} = sum {n in 1..N} (t_pri[m,n] + t_bis[m,n]);
var c {n in 1..N} = sum {m in 1..M} efficiency[m,n] * (t_pri[m,n] + t_bis[m,n] * 0.9);

var d; # kryterium ryzyka
var total_cost = sum {m in 1..M} R_exp[m] * t_tot[m]; # kryterium kosztu

minimize model: d;

subject to c2: total_cost >= 0;
subject to c3: total_cost <= max_cost;

subject to lad1 {i in 1..10000} : d >= sum {m in 1..M} (R_exp[m] - R[i,m]) * t_tot[m];
subject to lad2 {i in 1..10000} : d >= sum {m in 1..M} (R[i,m] - R_exp[m]) * t_tot[m];

# ograniczenia glowne
subject to c1 {n in 1..N}:
  c[n] >= C[n];

subject to t1 {m in 1..M}:
  sum {n in 1..N} (t_pri[m,n] + t_bis[m,n]) <= 180;

subject to t2 {m in 1..M, n in 1..N}:
  t_pri[m,n] >= 0;

subject to t3 {m in 1..M, n in 1..N}:
  t_bis[m,n] >= 0;

subject to t4 {m in 1..M}:
  sum {n in 1..N} t_pri[m,n] <= 100;

subject to t5 {m in 1..M}:
  sum {n in 1..N} t_pri[m,n] >= 100 * u[m];

subject to t6 {m in 1..M}:
  sum {n in 1..N} t_bis[m,n] <= 180 * u[m];
