#!/usr/bin/env python
# coding: utf-8

import os.path as osp
import sys


def add_path(path):
    if path not in sys.path:
        sys.path.insert(0, path)

this_dir = osp.abspath(osp.dirname(osp.dirname(__file__)))

# Add lib to PYTHONPATH
lib_path = this_dir
add_path(lib_path)


import matplotlib.pyplot as plt
import matplotlib.pylab as pylab
# this makes our figures bigger
pylab.rcParams['figure.figsize'] = 20, 12

import requests
from io import BytesIO
from PIL import Image
import numpy as np


from maskrcnn_benchmark.config import cfg
from df2_predictor import DeepFashion2Demo


config_file = "./configs/df2/mask_rcnn_hrnet_w18_1x.yaml"
# update the config options with the config file
cfg.merge_from_file(config_file)
# manual override some options
# cfg.merge_from_list(["MODEL.DEVICE", ""])


coco_demo = DeepFashion2Demo(
    cfg,
    min_image_size=800,
    confidence_threshold=0.5,
)


def load(fname):
    """
    Given an fname of an image, downloads the image and
    returns a PIL image
    """
    pil_image = Image.open(fname).convert("RGB")
    # convert to BGR format
    image = np.array(pil_image)[:, :, [2, 1, 0]]
    return image

def imshow(img):
    plt.imshow(img[:, :, [2, 1, 0]])
    plt.axis("off")
    plt.show()


for i in range(1,3000):
    image = load("/home/jcao/df2/validation/image/%06d.jpg"%i)
    predictions = coco_demo.run_on_opencv_image(image)
    imshow(predictions)


