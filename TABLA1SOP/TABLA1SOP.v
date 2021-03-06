module gates();
reg A, B, C; //declarar las 3 entradas
wire w1,w2,w3,w4,w5,w6,w7,w8,OUT; // 3 salidas para los Not, 5 salidas para los and y una para el or final
//orden de entradas y salidas de cada compuerta
not U1(w1,A);
not U2(w2,B);
not U3(w3,C);
and U4(w4,w1,w2,w3);
and U5(w5,w1,B,w3);
and U6(w6,A,w2,w3);
and U7(w7,A,w2,C);
and U8(w8,A,B,C);
or  U9(OUT,w4,w5,w6,w7,w8);
initial begin
  $display("A B C | Y");
  $display("--------");
  $monitor("%b %b %b| %b", A, B, C, OUT);
  A = 0; B = 0; C = 0;
  #1  C = 1;
  #1  B = 1; C = 0;
  #1  C = 1;
  #1  A = 1; B = 0; C = 0;
  #1  C = 1;
  #1  B = 1; C = 0;
  #1  C = 1;
  #1 $finish;
end

initial
  begin
    $dumpfile("TABLA1SOP_tb.vcd");
    $dumpvars(0, gates);
  end

endmodule
