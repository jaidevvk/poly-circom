pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input A;
   signal input B;

   signal X;
   signal Y;

   signal output Q;

   component and_gate=AND();
   component or_gate=OR();
   component not_gate=NOT();

   and_gate.a <== A ;
   and_gate.b <== B ;
   X <== and_gate.out ;

   not_gate.in <== B ;
   Y <== not_gate.out;

   or_gate.a <== X;
   or_gate.b <== Y;
   Q <== or_gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
