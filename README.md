# Fast-FLIM

This repository introduces an Extreme Learning Machine (ELM)-based fluorescence lifetime imaging (FLIM) method. Fast training and inference were achieved. This ELM can extract individual fluorescence components from bi-exponential decays. It has a good performance on speed and accuracy.  
Files explanation:  

Synthetic_TrainData_bi_decay1.mat: Training (Synthetic) data of mono-exponential decays.  
Synthetic_TestData_single_decay.mat: Test (Synehetic) data for mono-exponential decays.  
Synthetic_TrainData_bi_decay1.mat: Training (Synthetic) data of bi-exponential decays.  
Synthetic_TestData_bi_decay.mat: Test (Synehetic) data for bi-exponential decays.  
cluster_100_cycle.mat: Real prostatic cell data coated with gold nanoprobe.  
TrainNTestELM.m: Training and testing file, including implementation of NLSF.  

For more details about the ELM, comparisons, and optics setups, please refer to the paper. Please cite this paper if you find it useful. Thanks.  

Citation:  
Zang, Z., Xiao, D., Wang, Q., LI, Z., Xie, W., Chen, Y., & Li, D. D. U. (2022). Fast analysis of time‐domain fluorescence lifetime imaging via extreme learning machine. Sensors, 22(10), [3758]. https://doi.org/10.3390/s22103758
