#include "head.h"


void module_top(vector<vector<double>> Arr, int* n)
{
	*n = -1;

	vector<vector<double>> Arr_c = Arr;//原始数据

	

	int hang = Arr_c.size();//行：162
	int lie = Arr_c[0].size();//列：550

	int K_max = 20;//最大检测类别数

	vector<vector<int>> Aph_save;
	vector<double> L_save;



	//循环
	for (int K_each = 1; K_each <= K_max; K_each++)
	{
		//对输入的K、Arr_c计算L、对应分布
					
		double L_each;
		vector<int> Aph_each;
		cout << "L_each_" << K_each << endl;
		//kmeans聚类
		Aph_each = kmeans(Arr_c, K_each);

		//根据稳定后的中心计算L
		L_each = MLD(Arr_c, Aph_each, K_each);
		cout << "L_each_" << K_each << ": " << L_each << "\n\n" << endl;

		Aph_save.push_back(Aph_each);
		L_save.push_back(L_each);

	}


	//挑选最小的L及对应aph
	double L_final = L_save[0];
	vector<int> aph_final = Aph_save[0];

	for (int i = 1; i < L_save.size(); i++)
	{
		if (L_save[i] < L_final)
		{
			L_final = L_save[i];
			aph_final = Aph_save[i];
		}
	}

	vector<int> K_save;
	K_save.push_back(aph_final[0]);

	for (int i = 1; i < aph_final.size(); i++)
	{
		int index = 0;
		for (int j = 0; j < K_save.size(); j++)
		{
			if (aph_final[i] == K_save[j])
			{
				index = 1;
				break;
			}
		}

		if (index == 0)
		{
			K_save.push_back(aph_final[i]);
		}
	}

	//根据L值挑选分布、K
	*n = K_save.size();


	//对每一类进行SDIF估计PIR

}