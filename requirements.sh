# export INSTALL_DIR=/home/a1224803/Code/fashion
export INSTALL_DIR=$HOME/Code/fashion
mkdir -p $INSTALL_DIR/maskrcnn_deps
STRINGBLOCK='###########################################'

########################### on HPC #########################################
module purge
module load CUDA/9.0.176 GCC/5.4.0-2.26 NCCL/2.3.7-CUDA-9.0.176

########################### build conda env ###################################
conda init
source ~/.bashrc
conda create -n hrmask python=3.7 -y

########################### activate env ###################################
eval "$(conda shell.bash hook)"
conda activate hrmask
which python

########################### install deps env ###################################
conda install -y ipython ninja cython matplotlib tqdm opencv requests
conda install -y -c pytorch pytorch=1.0 torchvision=0.2 cudatoolkit=9.0
pip install yacs

########################## Install MASKRCNN ###################################
# install pycocotools
seq 3|xargs -I{} echo $STRINGBLOCK
cd $INSTALL_DIR/maskrcnn_deps
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
rm -rvf build/
python setup.py build_ext install

# install apex
seq 3|xargs -I{} echo $STRINGBLOCK
cd $INSTALL_DIR/maskrcnn_deps
git clone https://github.com/NVIDIA/apex.git
cd apex
rm -rvf build/
python setup.py install --cuda_ext --cpp_ext

# install HRNet-maskrcnn-benchmark
seq 3|xargs -I{} echo $STRINGBLOCK
cd $INSTALL_DIR
git clone https://github.com/HRNet/HRNet-MaskRCNN-Benchmark.git
cd HRNet-MaskRCNN-Benchmark
rm -rvf build/
rm -rvf maskrcnn_benchmark/*.so
rm -rvf maskrcnn_benchmark.egg-info/
FORCE_CUDA=1 python setup.py build
ln -s $INSTALL_DIR/HRNet-MaskRCNN-Benchmark/build/lib.*/maskrcnn_benchmark/_C.*.so maskrcnn_benchmark/
#### some folders
# mkdir hrnet_imagenet_pretrained && cd hrnet_imagenet_pretrained
# ln -s ~/.torch/models/hrnetv2* .
# mkdir datasets && cd datasets
# ln -s /data/fashion/deepfashion2 .
# ln -s /data/fashion/deepfashion2/outputs_hrmaskrcnn work_dirs


# install DeepFashion2 API
seq 3|xargs -I{} echo $STRINGBLOCK
cd $INSTALL_DIR
git clone https://github.com/switchablenorms/DeepFashion2.git
cd DeepFashion2/deepfashion2_api/PythonAPI
rm -rvf build/
python setup.py build_ext install


unset INSTALL_DIR