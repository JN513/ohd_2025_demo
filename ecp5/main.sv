module top (
    input logic  clk,
    output logic [7:0] led
);

logic [31:0] counter;

initial begin
    led = 0;
    counter = 0;
end

always_ff @( posedge clk ) begin
    if(counter == 25_000_000) begin
        counter <= 0;
        led     <= led + 1;
    end else begin
        counter <= counter + 1;
    end
end
    
endmodule