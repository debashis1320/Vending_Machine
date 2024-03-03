module vending_machine(
    input clk,
    input rst,
    input[1:0] in,
    output reg out,
    output reg[1:0] change
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg[1:0] c_state, n_state;

always @(posedge clk) begin

        if (rst == 1) begin
            c_state = 0;
            n_state = 0;
            change = 2'b00;
        end
        else
        c_state = n_state;
    
    case (c_state)
        S0: 
        if(in == 0)begin
            n_state = S0;
            out = 0;
            change = 2'b00;
        end
        else if(in == 2'b01)begin
            n_state = S1;
            out = 0;
            change = 2'b00;
        end
        else if(in == 2'b10)begin
            n_state = S2;
            out = 0;
            change = 2'b00;
        end

        S1:
        if(in == 0)begin
            n_state = S0;
            out = 0;
            change = 2'b01;
        end
        else if(in == 2'b01)begin
            n_state = S2;
            out = 0;
            change = 2'b00;
        end
        else if(in == 2'b10)begin
            n_state = S3;
            out = 0;
            change = 2'b00;
        end

        S2:
        if(in == 0)begin
            n_state = S0;
            out = 0;
            change = 2'b10;
        end
        else if(in == 2'b01)begin
            n_state = S3;
            out = 0;
            change = 2'b00;
        end
        else if(in == 2'b10)begin
            n_state = S0;
            out = 1;
            change = 2'b00;
        end

        S3:
        if(in == 0)begin
            n_state = S0;
            out = 0;
            change = 2'b11;
        end
        else if(in == 2'b01)begin
            n_state = S0;
            out = 1;
            change = 2'b00;
        end
        else if(in == 2'b10)begin
            n_state = S0;
            out = 1;
            change = 2'b01;
        end
    endcase
end
    
endmodule