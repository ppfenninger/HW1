module demorgan
(
  input  A,          // Single bit inputs
  input  B,

  output nA,         // Output intermediate complemented inputs
  output nB,

  output nAandnB,     // Single bit output, (~A)*(~B)

  output AorB,
  output nAorB,     // Single bit output, ~(A+B)

  output AandB,
  output nAandB,     // Single bit output, ~(A*B)

  output nAornB     // Single bit output, (~A)+(~B)
);

  wire nA;
  wire nB;
  wire AorB;
  wire AandB;

  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  and andgate1(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

  or orgate1(AorB, A, B);
  not AorBinv(nAorB, AorB);

  and andgate2(AandB, A, B);
  not AandBinv(nAandB, AandB);

  or orgate2(nAornB, nA, nB);   // AND gate produces nAornB from nA and nB


endmodule