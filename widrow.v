`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andrés García Pliego
// 
// Create Date: 07.07.2025 21:30:33
// Design Name: Learning Rule Widrow-Hoff
// Module Name: widrow
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module widrow #(parameter [3:0] d = 4'b1000)(
    input clk, rst, pixel, sel, y, start,
    output reg [3:0] dw
    );
reg[3:0] e, m, y_register;
reg[1:0] cont;
reg done;
always@(posedge clk) 
begin
    if (rst == 1'b1) begin
        y_register = 4'b0000;
        done = 1'b0;
        cont = 2'b00;
    end
    else if(start == 1'b1) begin
        y_register = {y_register[2:0], y};
        if (cont == 2'b11) begin
            done = 1'b1;
            cont = 2'b00;
        end
        else begin
            cont = cont + 1;
            done = 1'b0;
        end
    end
end
always@(posedge clk)
    begin
        if (rst == 1'b1) begin
            m = 4'b0000;
            dw = 4'b0000;
        end
        else begin
            if (pixel == 1'b1 && done == 1'b1) begin
                e = (d - y_register) << 1;  
                end
            else begin
                e = 1'b0;
            end
            case (sel)
                1'b0: m = e; //alpha = 1
                1'b1: m = e >> 1; //alpha = .5
                default: m <= 4'b0000;
            endcase
        dw = m;
        end
    end
endmodule


