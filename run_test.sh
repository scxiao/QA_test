#!/bin/bash

#download model and input/output data if not exits
. ./tools/download_models.sh

# build a docker image for testing
#docker build -t migraphx_test:test -f dockerfile/Dockerfile .

# copy the list of models to be executed to the model folder
prj_dir=$(pwd)
cp $prj_dir/list/model_list $prj_dir/onnx_models/.

# create output folder
mkdir -p $prj_dir/out/

# get the current time and append to the output file name
now=$(date +"%Y_%m_%d_%H_%M_%S")
docker run --device=/dev/dri --device=/dev/kfd --network=host --group-add=video -v=$prj_dir/onnx_models:/workspace/test/onnx_models -v=$prj_dir/scripts:/workspace/test/scripts migraphx_test:test /workspace/test/scripts/run_all_models.sh |& tee $prj_dir/out/migraphx_1_$now

# an alternative command to run in interactive mode
#docker run -it --device=/dev/dri --device=/dev/kfd --network=host --group-add=video -v=$prj_dir/onnx_models:/workspace/test/onnx_models -v=$prj_dir/scripts:/workspace/test/scripts migraphx_test:test

#remove the onnx_model folder
rm -r $prj_dir/onnx_models

