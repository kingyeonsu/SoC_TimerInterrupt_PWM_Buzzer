`timescale 1ns / 1ps

module PWM_Generator(
    input i_clk,
    input [31:0] i_freq,
    input i_reset,

    output o_pwm
    );

    reg r_clk = 0;
    reg [31:0] r_counter = 0;

    assign o_pwm = r_clk;

    always @(posedge i_clk or posedge i_reset) begin
        if(!i_reset || !i_freq)begin
            r_clk <= 1'b0;
            r_counter <= 0;
        end
        else begin
            if(r_counter == 100_000_000/i_freq -1)begin
                r_counter <= 0;
                r_clk <= ~r_clk;
            end
            else begin
                r_counter <= r_counter + 1;
            end
        end
    end
endmodule
