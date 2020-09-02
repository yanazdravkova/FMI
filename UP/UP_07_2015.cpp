
#include <iostream>
using namespace std;

bool isCellInMatrix(int y, int x, int M, int N)
{
    return y <= M && x <=N;
}

void subsample(int M, int N, float img[10][10])
{
    float s[5][5] = {};
    const int Ms = (M + 1)/2;
    const int Ns = (N + 1)/2;
    for (int i = 0; i < Ms; i++)
    {
        for (int j = 0; j < Ns; j++)
        {
            cout<<endl;
            float sum = 0;
            int counter = 0;
            int y1 = i*2;
            int y2 = i*2 + 1;

            int x1 = j*2;
            int x2 = j*2 + 1;
            if (y1 < M)
            {
                if (x1 < N)
                {
                    sum += img[y1][x1];
                    counter++;
                }

                if (x2 < N)
                {
                    sum += img[y1][x2];
                    counter++;
                }
            }
            if (y2 < M)
            {
                if (x1 < N)
                {
                    sum += img[y2][x1];
                    counter++;
                }

                if (x2 < N)
                {
                    sum += img[y2][x2];
                    counter++;
                }
            }

            s[i][j] = sum/counter;
        }
    }

    for (int i = 0; i < Ms; i++)
    {
        for (int j = 0; j < Ns; j++)
        {
            cout<<s[i][j]<<" ";
        }

        cout<<endl;
    }
}

int main()
{
    cout<<"alo";
    float img[10][10] =
    {
        {1.0, 2.0,  3.0},
        {4.5, 6.5,  7.5}
    };

    int M = 2;
    int N = 3;

    subsample(M, N, img);
    return 0;
}
