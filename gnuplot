#!/bin/sh
echo

#make gnuplot a shell script
gnuplot <<EOF

#Set png file specifications, font style and size
set terminal png size 700,700 enhanced font 'Arial,12'

#Please note the script is repeated for each png file created. The x axis remains the same and the y axis changes dependant on where in the results.dat file the read out needed is located.  

#Set output file name
set output './results/CPUTemp.png'

#Set graph title
set title "CPU Temperature (°C)"

#set graph x axis label
set xlabel 'Seconds'

#Set graph y axis label
set ylabel 'Temperature (°C)'

#Set x and y axis values to scale based on input file
set autoscale

#Set input file, where to get the data within the file, line style and line legend
plot "./results/results.dat" u 1:2 w l t 'CPU Temperature /s'

set output './results/GPUTemp.png'
set title "GPU Temperature (°C)"
set xlabel 'Seconds'
set ylabel 'Temperature (°C)'
set autoscale
plot "./results/results.dat" u 1:3 w l t 'GPU Temperature /s'

set output './results/Freq.png'
set title "CPU Frequency (Ghz)"
set xlabel 'Seconds'
set ylabel 'Frequency (Ghz)'
set autoscale
plot "./results/results.dat" u 1:4 w l t 'CPU Frequency /s'

set output './results/FreeRAM.png'
set title "Free RAM (Gb)"
set xlabel 'Seconds'
set ylabel 'RAM (Gb)'
set autoscale
plot "./results/results.dat" u 1:5 w l t 'Free RAM /s'

set output './results/UsedRAM.png'
set title "Used RAM (Gb)"
set xlabel 'Seconds'
set ylabel 'RAM (Gb)'
set autoscale
plot "./results/results.dat" u 1:6 w l t 'Used RAM /s'

set output './results/CachedRAM.png'
set title "Cached RAM (Gb)"
set xlabel 'Seconds'
set ylabel 'RAM (Gb)'
set autoscale
plot "./results/results.dat" u 1:7 w l t 'Cached RAM /s'

#CPU Usage scipt is not ready for production
#set output './results/CPUUsage.png'
#set title "CPU Frequency (Ghz)"
#set xlabel 'Seconds'
#set ylabel 'Frequency (Ghz)'
#set autoscale
#plot "./results/CPUUsage.dat" u 1:2 w l t 'CPU Frequency /s'
EOF
