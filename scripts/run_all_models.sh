#!/bin/bash
now=$(date +"%Y_%m_%d_%H_%M_%S")
/workspace/test/scripts/onnx_test.sh /workspace/test/onnx_models/model_list migraphx 1 |& tee migraphx_iter1_$now

