Code
=====================
Original: https://github.com/HRNet/HRNet-MaskRCNN-Benchmark
Modified: https://github.com/jonbakerfish/HRNet-MaskRCNN-Benchmark

Install
=====================
    bash ./requirements.sh

Data
=====================
https://github.com/switchablenorms/DeepFashion2
Copy or link the data into the `datasets/deepfashion2` folder.

Training & Testing
=====================
    python -m torch.distributed.launch --nproc_per_node 4 tools/train_net.py --config-file configs/df2/mask_rcnn_hrnet_w18_1x.yaml

    python -m torch.distributed.launch --nproc_per_node 1 tools/test_net.py --config-file configs/df2/mask_rcnn_hrnet_w18_1x.yaml

Results:
=====================
    INFO: Loading checkpoint from work_dirs/df2_mask_rcnn_hrnet_w18_1x/model_0230000.pth
    Accumulating evaluation results...
    DONE (t=8.97s).
     Average Precision  (AP) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.612
     Average Precision  (AP) @[ IoU=0.50      | area=   all | maxDets=100 ] = 0.764
     Average Precision  (AP) @[ IoU=0.75      | area=   all | maxDets=100 ] = 0.722
     Average Precision  (AP) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.426
     Average Precision  (AP) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.424
     Average Precision  (AP) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.614
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=  1 ] = 0.772
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets= 10 ] = 0.778
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.778
     Average Recall     (AR) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.425
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.623
     Average Recall     (AR) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.779
    Loading and preparing results...
    DONE (t=3.10s)
    creating index...
    index created!
    Running per image evaluation...
    Evaluate annotation type *segm*
    DONE (t=41.66s).
    Accumulating evaluation results...
    DONE (t=8.01s).
     Average Precision  (AP) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.606
     Average Precision  (AP) @[ IoU=0.50      | area=   all | maxDets=100 ] = 0.762
     Average Precision  (AP) @[ IoU=0.75      | area=   all | maxDets=100 ] = 0.717
     Average Precision  (AP) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.283
     Average Precision  (AP) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.301
     Average Precision  (AP) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.610
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=  1 ] = 0.754
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets= 10 ] = 0.760
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.760
     Average Recall     (AR) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.450
     Average Recall     (AR) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.635
     Average Recall     (AR) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.761
    2019-07-23 00:55:27,879 maskrcnn_benchmark.inference INFO: OrderedDict([('bbox', OrderedDict([('AP', 0.6120792895809243), ('AP50', 0.7641835383027235), ('AP75', 0.722188634783763), ('APs', 0.4262376237623762), ('APm', 0.4235343998825604), ('APl', 0.6139505098742135)])), ('segm', OrderedDict([('AP', 0.6061805037478797), ('AP50', 0.7616161826458685), ('AP75', 0.7165223125169319), ('APs', 0.28310081008100807), ('APm', 0.30079297004756), ('APl', 0.610067689203028)]))])