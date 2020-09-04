#include <iostream>
using namespace std;

int reverseNumber(int n)
{
    int result = 0;

    while(n != 0)
    {
        result = result * 10 + n % 10;
        n /= 10;
    }

    return result;
}

bool isBigger(int n, int m)
{
    int N = reverseNumber(n);
    int M = reverseNumber(m);

    while(N != 0 && M != 0)
    {
        if(N % 10 > M % 10)
        {
            return true;
        } else if(N % 10 < M % 10)
        {
            return false;
        }

        N /= 10;
        M /= 10;
    }

    return !(N == 0);
}

void sortLex(int n, int* a)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = i+1;  j < n; j++)
        {
            if (isBigger(a[i], a[j]))
            {
                // swap
                int tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }
        }
    }

    for (int i = 0; i < n; i++)
    {
        cout << a[i]<<" ";
    }
}

int main()
{
    int a[6] = {13,14,7,2018,9,0};
    sortLex(6, a);
    return 0;
}
