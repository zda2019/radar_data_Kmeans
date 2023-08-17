#include "head.h"

vector<int> kmeans(vector<vector<double>> data, int k)
{
	if (k <= 0)
	{
		cout << "k of K_means <=0" << endl;
	}
	else if (data.size() < k)
	{
		cout << "data.size() < k in kmeans" << endl;
	}

	int hang_of_data = data.size();
	int lie_of_data = data[0].size();

	//随机选取k个中心点：选其中k个点即可
	vector<vector<double>> old_means = rand_means(data, k);

	vector<int> aph;

	while (1)
	{
		//根据中心分类
		for (int i = 0; i < hang_of_data; i++)
		{
			double dis_for_i;
			int index = -1;
			for (int j = 0; j < k; j++)
			{
				if (j == 0)
				{
					dis_for_i = dist(data[i], old_means[j]);
					index = j;
				}
				else
				{
					if (dist(data[i], old_means[j]) < dis_for_i)
					{
						dis_for_i = dist(data[i], old_means[j]);
						index = j;
					}
				}
			}
			aph.push_back(index);
		}


		//根据分类计算中心

		vector<vector<double>> new_means;
		for (int i = 0; i < k; i++)
		{
			vector<vector<double>> data_for_k;
			for (int j = 0; j < hang_of_data; j++)
			{
				if (aph[j] == i)
				{
					data_for_k.push_back(data[j]);
				}
			}
			new_means.push_back(mu(data_for_k));
		}


		//计算新旧中心距离并更新中心
		double dis_of_means_of_old_and_new = 0;
		for (int i = 0; i < k; i++)
		{
			dis_of_means_of_old_and_new += dist(old_means[i], new_means[i]);
		}

		if (dis_of_means_of_old_and_new / k < 1e-12)
		{
			break;
		}
		else
		{
			old_means = new_means;
			aph.clear();
			new_means.clear();
		}
	}

	return aph;
}


vector<vector<double>> rand_means(vector<vector<double>> data, int k)
{

	vector<vector<double>> means;

	std::random_device rand_device;
	int seed = rand_device();

	std::linear_congruential_engine<uint64_t, 6364136223846793005, 1442695040888963407, UINT64_MAX> rand_engine(seed);

	{
		std::uniform_int_distribution<int> uniform_generator(0, data.size() - 1);
		means.push_back(data[uniform_generator(rand_engine)]);
		cout << uniform_generator(rand_engine) << endl;
	}
	//means.push_back(data[1]);

	for (int count = 1; count < k; ++count)
	{
		double dis_max = 0;
		int index = 0;
		vector<double> distances = closest_distance(means, data);

		for (int i = 0; i < distances.size(); i++)
		{
			if (i == 0)
			{
				dis_max = distances[i];
			}
			else
			{
				if (distances[i] >= dis_max)
				{
					dis_max = distances[i];
					index = i;
				}
			}
		}
		//cout << "\t\t" << index << endl;
		means.push_back(data[index]);
	}

	return means;
}


vector<double> closest_distance(vector<vector<double>> means, vector<vector<double>> data)
{
	vector<double> distance;
	for (int i = 0; i < data.size(); i++)
	{
		double dis_for_each;
		for (int j = 0; j < means.size(); j++)
		{
			if (j == 0)
			{
				dis_for_each = dist(data[i], means[j]);
			}
			else
			{
				if (dist(data[i], means[j]) < dis_for_each)
				{
					dis_for_each = dist(data[i], means[j]);
				}
			}
		}
		distance.push_back(dis_for_each);
	}
	return distance;
}