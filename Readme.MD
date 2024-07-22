# Balancing-Bot
 A 3d printable balancing bot designed in Fusion360

Just another balancing robot... but with hair! :-)

The bot is using stepper motors, an accelerometer/gyro and a pid loop programmed in Arduino IDE for an AtMega328p.<br>
The bot can be controlled using a Bluetooth, i recommend the app 'Arduino Bluetooth RC Car' for Android (not tested with IPhone).

The source code and build instructions (german language only at the moment) are included in a PDF: [Build Instruktions](Balancing%20Bot%20instructions.pdf)<br>

Programming the HC-05 module with these instructions:<br>
(from https://www.instructables.com/Modify-The-HC-05-Bluetooth-Module-Defaults-Using-A/)<br>
set serial monitor in arduino ide to 9600 baud and connect<br>
AT+ORGL<br>
AT+VERSION?<br>
AT+NAME=Bot red<br>
AT+UART=57600,1,0<br>
AT+POLAR)1,0<br>

The code is structured this way it is as it was provided incomplete and had to be completed by the teams. Additionally it was my first arduino project (i'm a java programmer)...<br>

It was designed mostly in Fusion 360 and for the skind/hairs OpenSCAD.<br>
Fusion 360 couldn't handle the thousands of hairs, however rendering in openscad can take a few hours.

Bill of materials (BOM):<br>
3x stepper motor 14HS11-1004S (Nema 14 35x25x28mm with low inductance)<br>
3x stepper driver DRV8834 (this is a low voltage driver that works with 5V)<br>
1x Powerbank 'Powerad Slim 2'<br>
1x Bread Board 830 point<br>
1x Microcontroller ATMega328P-PU (preferably with Arduino Bootloader installed)<br>
1x HC-05 Bluetooth module<br>
1x Gyro MPU-9250<br>
1x 5V Speaker<br>
1x Micro USB adapter<br>
1x capacitor 220uF<br>
4x capacitor 100uF<br>
1x capacitor 10uF<br>
2x capacitor 10pF<br>
4x resistor 1 kOhm<br>
4x resistor 10 kOhm<br>
1x Pushbutton<br>
1x crystal 16 MHz<br>
(optional) Bluetooth Stick for your computer (upload Arduino sketches directly from arduino ide)<br>
some breadboard wires or cut and strip wires yourself<br>

Print Time: About 24 hours<br>
I used an Kossel XL and a 0.25mm nozzle<br>

Material: PLA<br>
The tire have to be printed in a flexible material (i used Ninjaflex), or you can print tires and wheels as one part in PLA.

![Bot_Parts](./3d_printable_parts/images/Bot_Parts.png "Bot Parts")
![Bot_v238](./3d_printable_parts/images/Bot_v238.gif "Bot v238")
![simulation2](./3d_printable_parts/images/simulation2.gif "simulation2")
![development1](./3d_printable_parts/images/development1.jpg "development1")
![bots_parts_on_table](./3d_printable_parts/images/bots_parts_on_table.jpg "bots_parts_on_table")
![bots_in_action](./3d_printable_parts/images/bots_in_action.jpg "bots_in_action")
![bot_yellow](./3d_printable_parts/images/bot_yellow.jpg "bot_yellow")
![bot_pink](./3d_printable_parts/images/bot_pink.jpg "bot_pink")
![bot_on_buildplate](./3d_printable_parts/images/bot_on_buildplate.jpg "bot_on_buildplate")
![hair](./3d_printable_parts/images/hair.jpg "hair")