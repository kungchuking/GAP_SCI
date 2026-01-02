onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fp16_subtract_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {fp16_subtract.udo}

run -all

quit -force
