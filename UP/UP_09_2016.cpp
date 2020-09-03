#include <iostream>
#include <cstring>
using namespace std;

int getIdxOfMostDistantEqualSymbol(int startIdx, const char* str)
{
    char symbol = str[startIdx];
    const int length = std::strlen(str);

    int mostDistantIdx = startIdx;

    for (int i = startIdx; i < length; i++)
    {
        if(str[i] == symbol)
        {
            mostDistantIdx = i;
        }
    }

    return mostDistantIdx;
}

pair<int, int> run(const char* str)
{
    const int length = strlen(str);
    int firstIdx = 0;
    int secondIdx = 0;

    for(int i = 0; i < length ; i++)
    {
        const char currSymbol = str[i];
        int idxOfMostDistantEqualSymbol = getIdxOfMostDistantEqualSymbol(i, str);

        if (idxOfMostDistantEqualSymbol - i > secondIdx - firstIdx)
        {
            firstIdx = i;
            secondIdx = idxOfMostDistantEqualSymbol;
        }
    }

    return make_pair(firstIdx, secondIdx);
}

int main()
{
    const pair<int, int> result = run("this is just a simple example");
    cout<<result.first<<" "<<result.second<<endl;
    return 0;
}
