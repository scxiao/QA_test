#!/bin/bash

if [ -z "$ONNX_HOME" ]
then
   ONNX_HOME=$(pwd)
fi

model_dir=$ONNX_HOME/onnx_models
tmp_dir=$ONNX_HOME/downloaded
mkdir -p $tmp_dir
file_name=20191107

# if zip file does not exist, download it
if [[ ! -f "$tmp_dir/$file_name.zip" ]]; then
    curl https://onnxruntimetestdata.blob.core.windows.net/models/$file_name.zip --output $tmp_dir/$file_name.zip
fi


if [[ ! -d $model_dir ]]; then
    # create the folder and unzip the file
    mkdir -p $model_dir
    unzip $tmp_dir/$file_name -d $model_dir 
fi

