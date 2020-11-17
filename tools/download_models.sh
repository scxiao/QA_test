#!/bin/bash

if [ -z "$ONNX_HOME" ]
then
   ONNX_HOME=$(pwd)
fi

model_dir=$ONNX_HOME/onnx_models
tmp_dir=$ONNX_HOME/tmp
mkdir -p $tmp_dir
file_name=20191107.zip


if [[ ! -d $model_dir ]]; then

# if zip file does not exist, download it
if [[ ! -f "$tmp_dir/$file_name" ]]; then
curl https://onnxruntimetestdata.blob.core.windows.net/models/$file_name --output $tmp_dir/$file_name
fi

# create the folder and unzip the file
mkdir -p $model_dir
unzip $tmp_dir/$file_name -d $model_dir && rm $tmp_dir/$file_name

fi

