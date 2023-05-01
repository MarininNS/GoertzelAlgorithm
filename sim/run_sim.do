# Данный скрипт предназначен для запуска симуляции топ уровня - FourierTransform_tb
# в уже открытом проекте.
# Для этого необходимо:
# 1 запустить modelsim,
# 2 открыть проект .\sim\FT.mpf вручную 
# или прописать в окне transcipt команду - project open ./FT.mpf
# 3 запустить скрипт - project open ./FT.mpf

.main clear
project compileall
vsim -voptargs="+acc" FourierTransform_tb
do ./FTH.do
run -all
wave zoom full