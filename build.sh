# build.sh
work=$(pwd)
build=${work}/build
src=${work}/src

rm -rf ${build}
mkdir -p ${build}

source_module=$1
testbentch_module=${source_module}_test

# ctags -R --langmap=verilog:+.vh --langmap=verilog:+.v --languages=verilog --fields=+n

# 主要的编译过程
# cd ${build}
cd $src
# 安装iverilog
iverilog -o ${build}/${testbentch_module}.vvp \
    -D ROM_PRG=\"${src}/top/test/test.dat\" \
    -D SPM_PRG=\"${src}/top/test/test.dat\" \
    -D SIM_CYCLE=10000 \
    -I ${src}/top/include \
    -I ${src}/bus/include \
    -I ${src}/cpu/include \
    -I ${src}/io/gpio/include \
    -I ${src}/io/rom/include \
    -I ${src}/io/timer/include \
    -I ${src}/io/uart/include \
    -y ${src}/top/lib \
    ${src}/top/rtl/*.v \
    ${src}/bus/rtl/*.v \
    ${src}/cpu/rtl/*.v \
    ${src}/io/gpio/rtl/*.v \
    ${src}/io/rom/rtl/*.v \
    ${src}/io/timer/rtl/*.v \
    ${src}/io/uart/rtl/*.v \
    ${src}/top/test/${testbentch_module}.v

cd $build
vvp -n ${testbentch_module}.vvp

cd ${work}
