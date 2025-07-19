`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andr�s Garc�a Pliego
// 
// Create Date: 11.07.2025 21:40:02
// Design Name: 
// Module Name: widrow_tb
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


module widrow_tb(); 
//Declaraci�n de se�ales
logic clkstim, rststim, pixelstim, selstim, ystim, startstim;
logic [3:0] dwwatch;
// Instancia del m�dulo DUT (de Verilog)
widrow dut(
    .clk(clkstim),
    .rst(rststim),
    .pixel(pixelstim),
    .sel(selstim),
    .y(ystim),
    .start(startstim),
    .dw(dwwatch));
// Generaci�n de reloj
always #30 clkstim = ~clkstim;
// Inicializaci�n
initial begin
    $display("Inicio de la simulaci�n.");
    clkstim = 1;
    rststim = 1;
    pixelstim = 0;
    selstim = 0;
    ystim = 0;
    startstim = 0;
// Reset
    #60 rststim = 0;
// Est�mulo 1
    #120;
    ystim = 1'b0;
    pixelstim = 1;
    selstim = 0;
    startstim = 1;
    #60; 
// Est�mulo 2
    ystim = 1'b0;
    #60;
// Est�mulo 3
    ystim = 1'b0;
    #60;
// Est�mulo 4
    ystim = 1'b1;
    #60;
// Espera
    ystim = 1'b0;
    startstim = 0;
    #120;
// Nuevo dato
    startstim = 1;
    ystim = 1'b0;
    startstim = 1;
    #60
// Est�mulo 2
    ystim = 1'b0;
    #60;
// Est�mulo 3
    ystim = 1'b1;
    #60;
// Est�mulo 4
    ystim = 1'b0;
    #60;
// Espera
    ystim = 1'b0;
    startstim = 0;
    #120;
// Nuevo dato
    startstim = 1;
    ystim = 1'b0;
    startstim = 1;
    #60
// Est�mulo 2
    ystim = 1'b0;
    #60;
// Est�mulo 3
    ystim = 1'b1;
    #60;
// Est�mulo 4
    ystim = 1'b1;
    #60;
// Espera
    ystim = 1'b0;
    startstim = 0;
    #120;
    $display ("Fin de la simulaci�n.");
    $finish;
end
endmodule
