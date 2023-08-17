#include <string>
#include <iostream>
#include <fstream>
#include <sstream>//读写文件

#include <typeinfo>
#include "head.h"


vector<vector<double>> read_gt_file(string);

int main()
{
	int m = 0;
	int* num = &m;//返回值指针

	string path = "./test_3_1.csv";
	int num_real = 3;


	string filename = path;//测试文件地址
	vector<vector<double>> arr_m = read_gt_file(filename);//csv->vector

	/*cout << arr_m[0][0] << endl;
	cout << arr_m.size() << endl;
	cout << arr_m[0].size() << endl;
	cout << arr_m[arr_m.size()-1][arr_m[0].size()-1] << endl;*/


	module_top(arr_m, num);

	cout << *num << endl;

	if (*num == num_real)
	{
		cout << "test pass!" << endl;
		return 0;
	}
	else
	{
		cout << "Test failed!" << endl;
		return 1;
	}
}



vector<vector<double>> read_gt_file(string filename) 
{
	ifstream inFile(filename, ios::in);
	string lineStr;
	char delim = ',';
	vector<vector<double>> matrix;
	if (inFile.fail()) {
		cout << "Read files fail....." << endl;
		return matrix;
	}

	while (getline(inFile, lineStr)) {
		stringstream ss(lineStr);
		string str;
		vector<double> lineArray;

		// cut apart by flag
		while (getline(ss, str, delim))
			lineArray.push_back(std::stod(str));
		matrix.push_back(lineArray);
	}
	return matrix;
}


