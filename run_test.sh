#!/bin/bash
. ./tools/download_models.sh
docker build -t migraphx_test:test -f dockerfile/Dockerfile .
prj_dir=$(pwd)
cp $prj_dir/list/model_list $prj_dir/onnx_models/.
docker run --device=/dev/dri --device=/dev/kfd --network=host --group-add=video -v=$prj_dir/onnx_models:/workspace/test/onnx_models -v=$prj_dir/scripts:/workspace/test/scripts migraphx_test:test /workspace/test/scripts/run_all_models.sh
#docker run -it --device=/dev/dri --device=/dev/kfd --network=host --group-add=video -v=$prj_dir/onnx_models:/workspace/test/onnx_models -v=$prj_dir/scripts:/workspace/test/scripts migraphx_test:test
