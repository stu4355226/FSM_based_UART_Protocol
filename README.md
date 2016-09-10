# UART_VHDL
UART_interface using VHDL on Xilinx Zynq - 7000 SoC (Zedboard). 
Author    
-------------
CHIA-CHE, LEE   
Computer Engineering, Florida institute of technology.   
Email: stu4355226@gmail.com    
    
Target   
-------------
Plateform: Xilinx planahead 14.7   
Board: Xilinx Zynq-7000 SoC (Zedboard)    
Language: VHDL   
You can use Termite.exe to communicate with the board.
    
Schematic
-------------
![Schematic](/Images/schmatic.jpg)

This UART using FIFO as a buffer sending files between TX(Sender) and Rx(Reciver).    
In general cases, UART will use two FIFO buffers to store and send the queuing data,    
I'm using only a FIFO and a FSM to control the FIFO whenever to send or store the queuing data.    
In the project3, I added a mask to classify data into 4 classes – class1,2,3 and 4 (not valid data).    
for each package recivied , output  "data","=", "class1-4","return","return" in sequence.    
     
Flow chart
-------------
![flow_chart](/Images/flow_chart.jpg)
    
Simulation
-------------
for project 1
whenever the empty signal in FSM is 1, RX signal will receive the data from FIFO,  
then wait for the TX sends THE tx_done_tick signal back, then receives the next data.   
The wr_ptr receive data from rd_ptr.

![Simulation](/Images/project1.jpg)


For project 3    
When the first data comes in, output will poop the data for five stages, which are:   
1. data    
2. “=” in ASCII    
3. “CLASS1-4” in ASCII    
4. “return” in ASCII    
5. “return” in ASCII    
Then, it will send the next data in.    

stage1: poop data from FIFO to TX.    
The data din(“ 10011000”) comes in, so the dout (“10011000”) pop to Tx.     
     
![Simulation](/Images/project3_1.jpg)
    
stage2: pooping "=". Then FSM is popping “00111101” which is “=” in ASCII code.
    
![Simulation](/Images/project3_2.jpg)
   
stage3: classifying . Then FSM is popping “00110100” which is “34” in ASCII code.
    
![Simulation](/Images/project3_3.jpg)
   
stage4: pooping "return" . Then FSM is popping “00001101” which is “0D” in ASCII code.
    
![Simulation](/Images/project3_4.jpg)
   
stage5: pooping "return" . Then FSM is popping “00001101” which is “0D” in ASCII code.
    
![Simulation](/Images/project3_5.jpg)
