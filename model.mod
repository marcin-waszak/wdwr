model;

set MACHINES;
set PARTS;

param efficiency {MACHINES, PARTS};	
param R {MACHINES};

var t {MACHINES} <= 180;
var c {PARTS};

minimize cost: sum {m in MACHINES} R[m] * t[m];

subject to c1: c[A] >= 60;
subject to c2: c[B] >= 60;
subject to c3: c[C] >= 60;
subject to c4: c[D] >= 120;
subject to c5: c[E] >= 120;

subject to t1: (sum {p in PARTS} (sum {m in MACHINES} t[m] * efficiency[m,p]));