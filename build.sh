# build.sh
work=$(pwd)
build=${work}/build
src=${work}/src

rm -rf ${build}
mkdir -p ${build}

source_module=$1
testbentch_module=${source_module}_tb

# 主要的编译过程
# cd ${build}
cd $src
# 安装iverilog
iverilog -o ${build}/${testbentch_module}.vvp ${src}/${testbentch_module}.v

cd $build
vvp -n ${testbentch_module}.vvp

cd ${work}
