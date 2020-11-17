now=date +"%Y_%m_%d_%H_%M_%S"
./onnx_test.sh onnx_models/model_list migraphx 1 |& tee migraphx_iter1_$now

