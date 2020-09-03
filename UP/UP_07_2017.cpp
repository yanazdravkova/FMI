#include<iostream>
using namespace std;

bool isCellValid(int j, int k, int M, int N)
{
    return (j >= 0 && j < M && k >= 0 && k < N);
}
bool canConvertTo3(int j, int k, int M, int N, char arr[100][100], bool hasChanged[100][100])
{
    int countNeighbours = 0;

    const pair<int, int> deltas[] =
    {
        make_pair(0, 1),
        make_pair(0, -1),
        make_pair(1, 0),
        make_pair(-1, 0),
        make_pair(1, 1),
        make_pair(1, -1),
        make_pair(-1, 1),
        make_pair(-1, -1),
    };

    for(pair<int, int> p : deltas)
    {
        if (isCellValid(p.first, p.second, M, N) &&
                arr[j + p.first][k + p.second] == '4' &&
                hasChanged[j + p.first][k + p.second] == 0)
        {
            countNeighbours++;
            if(countNeighbours == 3)
            {
                break;
            }
        }
    }

    return countNeighbours == 3;
}

void run(int M, int N, char arr[100][100], int years)
{
    const int iterations = years / 10;

    bool hasChanged[100][100];

    for (int i = 0; i < iterations; i++)
    {
        for (int j = 0; j < M; j++)
        {
            for (int k = 0; k < N; k++)
            {
                hasChanged[j][k] = 0;
            }
        }

        for (int j = 0; j < M; j++)
        {
            for (int k = 0; k < N; k++)
            {
                if (arr[j][k] == '1' || arr[j][k] == '2' || arr[j][k] == '3')
                {
                    arr[j][k] = arr[j][k] + 1 ;
                    hasChanged[j][k] = 1;
                }
                else if (arr[j][k] == '4' && canConvertTo3(j, k, M, N, arr, hasChanged) )
                {
                    arr[j][k] = '3';
                }
            }
        }

        cout<<"iteration No: "<<i<<endl;
        for (int j = 0; j < M; j++)
        {
            for (int k = 0; k < N; k++)
            {
                cout<<arr[j][k]<<" ";
            }
            cout<<"\n";
        }
    }
}

int main()
{

    char arr[100][100] =
    {
        {'R', 'R', '1', '1', '2', '2'},
        {'1', 'R', 'R', 'R', '1', '2'},
        {'S', '1', 'R', 'R', '2', '3'},
        {'4', '4', 'S', 'S', 'R', 'R'}
    };

    const int years = 100;
    run(4, 6, arr, years);
    return 0;
}
