#include <iostream>
using namespace std;

bool member (int x, int a[], int s)
{
    if (s == 0) return false;
    return a[s/2] == x ||
           (a[s/2] < x && member(x, a + s/2 + 1, s/2)) ||
           (a[s/2] > x && member(x, a, s/2));
}

/*
void selectionSort (int nums[], int N)
{
    for (int i = 0; i < N - 1; i++)
    {
        int mini = i;
                   for (int j = i + 1; j < N; j++)
        {
            if(nums[j] < nums[mini]) mini = j;
        }
        if(mini != i)
        {
            int x = nums[i];
            nums[i] = nums[mini];
            nums[mini] = x;
        }
    }
}
*/

int main()
{
    int arr[] =  {1, 2, 3, 4, 5, 6, 7, 8, 9};
    cout<<member(12, arr, 9)<<endl;

    int a = 0;
    int b = 15;
    int result = -1;
    if (b < 10 && b / a < 10)
    {
        result = 0;
    }
    else
    {
        result = 1;
    }
    cout<<"result: "<<result<<endl; // B 1
    int tmp = 6 | 11;
    cout <<tmp; // 15 = 1111
    return 0;
}
