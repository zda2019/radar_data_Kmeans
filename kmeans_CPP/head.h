#pragma once

#include <vector>
#include <iostream>
#include <random>

using namespace std;

//框架
void module_top(vector<vector<double>> Arr, int* n);
vector<int> kmeans(vector<vector<double>> data, int k);//聚类
double MLD(vector<vector<double>> arr, vector<int> aph, int k);//kmeans


//kmeans
vector<vector<double>> rand_means(vector<vector<double>> data, int k);//初始化中心
vector<double> closest_distance(vector<vector<double>> means, vector<vector<double>> data);//计算所有样本与已有均值点距离最小值，使得挑选出的类中心尽量分散

//MDL
double det_diag_for_k(vector<vector<double>> arr);//根据输入的二维矩阵求协方差估计，并求对角化后的行列式，并取log10
vector<vector<double>> arr_new(vector<vector<double>> arr);//计算对样本的协方差估计矩阵
double sigmal(vector<double> data);//计算向量方差

//函数块
double dist(vector<double> arr1, vector<double> arr2);//计算两vector距离
vector<double> mu(vector<vector<double>> data);//计算二维vector列方向均值
