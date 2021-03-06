module bank(clk, b1, b10, b50, b100, randNum1, randNum2, randNum3, randNum4, rst, balance);

input clk;
input b1; //the switches
input b10;
input b50;
input b100;
input [3:0] randNum1;
input [3:0] randNum2;
input [3:0] randNum3;
input [3:0] randNum4;
input rst;
output reg[26:0] balance;
reg[26:0] balanceR = 100;
reg[26:0] deduction;

always @(posedge clk)
begin
	if (b100)
		deduction <= 100;
	else if (b50)
		deduction <= 50;
	else if (b10)
		deduction <= 10;
	else if (b1)
		deduction <= 1;
	else
		deduction <= 0;
end

always @(posedge clk)
begin
	balance <= balanceR;
    if(rst)
	begin
        balanceR <= 100;
	end
    else if(randNum1 == randNum2 && randNum2 == randNum3 && randNum3 == randNum4 && rst == 0)
    begin
        if(balance + (2*deduction) >= 1000)
            balanceR <= 1000;
        else
            balanceR <= balanceR + (2*deduction);
      /*  if(b1)
        begin
            if(balanceR + 1 >= 1000)
                balanceR <= 1000;
            else 
                balanceR <= balanceR + 1;
        end
        else if(b10)
        begin
            if(balanceR + 10 >= 1000)
                balanceR <= 1000;
            else
                balanceR <= balanceR + 10;
        end
        else if(b50)
        begin
            if(balanceR + 50 >= 1000)
                balanceR <= 1000;
            else
                balanceR <= balanceR + 50;
        end
        else if(b100)
        begin
            if(balanceR + 100 >= 1000)
                balanceR <= 1000;
            else
                balanceR <= balanceR + 100;
        end */
    end
   /* else if(randNum1 == randNum2 && randNum2 == randNum3 && rst == 0) //123
    begin
        if(balance + deduction >= 1000)
            balanceR <= 1000;
        else
            balanceR <= balanceR + deduction;
    end
    else if(randNum2 == randNum3 && randNum3 == randNum4 && rst == 0) //234
    begin
        if(balance + deduction >= 1000)
            balanceR <= 1000;
        else
            balanceR <= balanceR + deduction;
    end
    else if(randNum1 == randNum2 && randNum2 == randNum4 && rst == 0) //124
    begin
        if(balance + deduction >= 1000)
            balanceR <= 1000;
        else
            balanceR <= balanceR + deduction;
    end
    else if(randNum1 == randNum3 && randNum3 == randNum4 && rst == 0) //134
    begin
        if(balance + deduction >= 1000)
            balanceR <= 1000;
        else
            balanceR <= balanceR + deduction;
    end */
	else if(rst == 0)
	begin
        if(balanceR - deduction <= 0)
            balanceR <= 0;
		else
            balanceR <= balanceR - deduction;
	end
end

endmodule




