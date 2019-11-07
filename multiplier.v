timescale 1ns / 1ps
    module iec2016011(k,result);
    parameter j=6;
    input[j:0] k;
    output[2*j+1:0] result;
    parameter n=7'b1110111;
    // wire d[3:0];
    wire [2*j+1:0] w1[0:j+1];
    // integer i;
    
    //always @ (n)
     //begin
     genvar t;
     generate
     assign w1[j+1]=0;
      for(t=j;t>=0;t=t-1)  
           begin
           if(n[t]==1)
           begin
           //assign result=result+(x<<i);
             nbitcsa r1(w1[t+1],k<<t,8'b00000000,w1[t]);
            end
            else
            assign w1[t]=w1[t+1]; 
            end
            endgenerate
            assign result=w1[0];
         endmodule
         
         module nbitcsa(x,y,z,s);
         parameter g=32;
       //  parameter j=4;
         input [18:0] x;
         input [18:0] y;
         input [18:0] z;
         output [18:0] s;
      //   output wire cout;
         wire [18:0] c1,c2,s1;
         genvar i;
         generate
         for(i=0;i<18;i=i+1)
         begin
         full_adder f1(x[i],y[i],z[i],s1[i],c1[i]);
         end
         endgenerate
         assign c2[0]=1'b0;
         generate
         for(i=0;i<18;i=i+1)
         begin
         full_adder f5(s1[i+1],c1[i],c2[i],s[i+1],c2[i+1]);
         end
         endgenerate
         assign s[0]=s1[0];
         endmodule
         module full_adder (   input a,b,cin,output sum,carry);
         
         assign sum = a ^ b ^ cin;
         assign carry = (a & b) | (cin & b) | (a & cin);
         
         endmodule
              
