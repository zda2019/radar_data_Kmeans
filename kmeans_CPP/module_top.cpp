#include "head.h"


void module_top(vector<vector<double>> Arr, int* n)
{
	*n = -1;

	vector<vector<double>> Arr_c = Arr;//ԭʼ����

	

	int hang = Arr_c.size();//�У�162
	int lie = Arr_c[0].size();//�У�550

	int K_max = 20;//����������

	vector<vector<int>> Aph_save;
	vector<double> L_save;



	//ѭ��
	for (int K_each = 1; K_each <= K_max; K_each++)
	{
		//�������K��Arr_c����L����Ӧ�ֲ�
					
		double L_each;
		vector<int> Aph_each;
		cout << "L_each_" << K_each << endl;
		//kmeans����
		Aph_each = kmeans(Arr_c, K_each);

		//�����ȶ�������ļ���L
		L_each = MLD(Arr_c, Aph_each, K_each);
		cout << "L_each_" << K_each << ": " << L_each << "\n\n" << endl;

		Aph_save.push_back(Aph_each);
		L_save.push_back(L_each);

	}


	//��ѡ��С��L����Ӧaph
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

	//����Lֵ��ѡ�ֲ���K
	*n = K_save.size();


	//��ÿһ�����SDIF����PIR

}