#pragma once

#include <vector>
#include <iostream>
#include <random>

using namespace std;

//���
void module_top(vector<vector<double>> Arr, int* n);
vector<int> kmeans(vector<vector<double>> data, int k);//����
double MLD(vector<vector<double>> arr, vector<int> aph, int k);//kmeans


//kmeans
vector<vector<double>> rand_means(vector<vector<double>> data, int k);//��ʼ������
vector<double> closest_distance(vector<vector<double>> means, vector<vector<double>> data);//�����������������о�ֵ�������Сֵ��ʹ����ѡ���������ľ�����ɢ

//MDL
double det_diag_for_k(vector<vector<double>> arr);//��������Ķ�ά������Э������ƣ�����Խǻ��������ʽ����ȡlog10
vector<vector<double>> arr_new(vector<vector<double>> arr);//�����������Э������ƾ���
double sigmal(vector<double> data);//������������

//������
double dist(vector<double> arr1, vector<double> arr2);//������vector����
vector<double> mu(vector<vector<double>> data);//�����άvector�з����ֵ
