#include "head.h"

double MLD(vector<vector<double>> arr, vector<int> aph, int k)
{
	//arr:输入数据
	//aph:稳定分布
	//k:类别数
	//返回：L值
	int hang = arr.size();
	int lie = arr[0].size();

	double S0 = det_diag_for_k(arr);
	int lei = k;

	double L_1 = 0;

	for (int i = 0; i < k; i++)
	{
		vector<vector<double>> arr_for_k;
		for (int j = 0; j < hang; j++)
		{
			if (aph[j] == i)
			{
				arr_for_k.push_back(arr[j]);
			}
		}

		int size_for_k = arr_for_k.size();//每一类所拥有的序列数量
		if (size_for_k == 0)
		{
			lei = lei - 1;
			continue;
		}
		else if (size_for_k == 1)
		{
			double Sk = sigmal(arr_for_k[0]);
			L_1 = L_1 - Sk / 2 + S0 + 2 * lie * log10(size_for_k);
		}
		else if (size_for_k == 2)
		{
			L_1 = L_1 + S0 + 2 * lie * log10(size_for_k);
		}
		else
		{
			double Sk = det_diag_for_k(arr_for_k);
			L_1 = L_1 + size_for_k * Sk / 2 + S0 - Sk + 2 * lie * log10(size_for_k);
			/*cout << "\t\tL_1.1 = " << size_for_k * Sk / 2 << "\tL_1.2 = " << S0 - Sk << "\tL_1.3 = " << 2 * lie * log10(size_for_k) << endl;*/
		}
	}

	double L_2 = lie * hang / 2 + lie * hang / 2 * log10(2 * 3.14) + lei * lie * log10(sqrt(2) * exp(1) / 6 / hang);

	//double L_3 = coS(aph, k);

	//cout << L_1 + L_2 + L_3<<endl;
	//cout << "L1:" << L_1 << ",L2:" << L_2 << ",L3" << L_3 << endl;

	//return L_1 + L_2 + L_3;
	cout << "L1:" << L_1 << ",L2:" << L_2 << endl;
	return L_1 + L_2;
	
}



//根据输入的二维矩阵求协方差估计，并求对角化后的行列式，并取log10；
double det_diag_for_k(vector<vector<double>> arr)
{
	int hang = arr.size();
	int lie = arr[0].size();

	//1、求协方差矩阵估计
	vector<vector<double>> new_arr = arr_new(arr);
	//2、对角化+行列式+取log10

	double sun = 0;
	for (int i = 0; i < new_arr.size(); i++)
	{
		sun += log10(new_arr[i][i]);
		//cout << "\t\t\t\t\tnew_arr[i][i] = " << new_arr[i][i] << "\tlog10(new_arr[i][i]) = " << log10(new_arr[i][i]) << endl;
	}

	return sun;
}



//对输入矩阵求协方差矩阵
vector<vector<double>> arr_new(vector<vector<double>> arr)
{
	//对矩阵按行减去均值
	int hang = arr.size();
	int lie = arr[0].size();

	//均值向量
	vector<double> E(lie);
	for (int j = 0; j < lie; ++j)
	{
		double sum = 0;
		for (int i = 0; i < hang; ++i)
		{
			sum += arr[i][j];
		}
		E[j] = sum / hang;
	}

	//样本中心化矩阵
	vector<vector<double>> centerMatrix(hang, vector<double>(lie));
	vector<vector<double>> centerMatrixT(lie, vector<double>(hang));
	for (int i = 0; i < hang; i++)
		for (int j = 0; j < lie; j++)
		{
			centerMatrix[i][j] = arr[i][j] - E[j];
			centerMatrixT[j][i] = centerMatrix[i][j];
		}

	//协方差矩阵：covMatrix = 1 / (m-1) * matrixT * matrix 
	vector<vector<double>> covMatrix(lie, vector<double>(lie));
	for (int i = 0; i < lie; ++i)
		for (int j = 0; j < lie; ++j)
			for (int k = 0; k < hang; ++k)
				covMatrix[i][j] += centerMatrixT[i][k] * centerMatrix[k][j];

	for (int i = 0; i < lie; ++i)
	{
		for (int j = 0; j < lie; ++j)
			if (hang == 1)
			{
				covMatrix[i][j] = covMatrix[i][j] / (hang);
			}
			else
			{
				covMatrix[i][j] = covMatrix[i][j] / (hang - 1.0);
			}
	}

	return covMatrix;
}

//计算向量方差
double sigmal(vector<double> data)
{
	int lie = data.size();

	//算均值
	double sum = 0;
	for (int i = 0; i < lie; i++)
	{
		sum += data[i];
	}
	double mu_data = sum / lie;

	double sum_new = 0;
	for (int i = 0; i < lie; i++)
	{
		sum_new += (data[i] - mu_data) * (data[i] - mu_data);
	}
	
	return sum_new / (lie - 1);
}