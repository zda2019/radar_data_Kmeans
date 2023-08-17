#include "head.h"

//计算输入矩阵的均值，列方向
vector<double> mu(vector<vector<double>> data)
{
	int hang_of_data = data.size();
	int lie_of_data = data[0].size();

	vector<double> mu_of_data;
	for (int i = 0; i < lie_of_data; i++)
	{
		double sum_for_lie = 0;
		for (int j = 0; j < hang_of_data; j++)
		{
			sum_for_lie += data[j][i];
		}
		mu_of_data.push_back(sum_for_lie / hang_of_data);
	}

	return mu_of_data;
}




//计算两一维vector距离
double dist(vector<double> arr1, vector<double> arr2)
{
	if (arr1.size() != arr1.size())
	{
		cout << "The length of arr1 and arr2 is't eq!!!!!";
	}
	else
	{
		int len = arr1.size();

		double sum = 0;
		for (int i = 0; i < len; i++)
		{
			sum = sum + (arr1[i] - arr2[i]) * (arr1[i] - arr2[i]);
		}
		return sqrt(sum);
	}
}



