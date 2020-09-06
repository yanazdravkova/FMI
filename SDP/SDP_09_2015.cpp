#include <iostream>
using namespace std;

struct Graph
{
    int size;
    int* vertices;
    bool** edges;

    Graph(int* _vetrices, bool _edges[3][3], int _size)
    {
        size = _size;

        vertices = new int[size];
        for (int i = 0; i < size; i++)
        {
            vertices[i] = _vetrices[i];
        }

        edges = new bool*[size];
        for (int i = 0; i < size; i++)
        {
            edges[i] = new bool[size];
        }
        for (int i = 0; i < size; i++)
        {
            for (int j = 0; j < size; j++)
            {
                edges[i][j] = _edges[i][j];
            }
        }
    }
};

bool hasPath(Graph g, int i, int j)
{
    if (i == j)
        return true;

    for (int k = 0 ; k < g.size; k++)
    {
        if(g.edges[i][k] == 1)
        {
            if (hasPath(g, k, j))
            {
                return true;
            }
        }
    }

    return false;
}

bool isConnected(Graph g)
{
    for (int i = 0; i < g.size; i++)
    {
        for (int j = i+1; j < g.size; j++)
        {
            if(!hasPath(g, i, j) && !hasPath(g, j, i))
            {
                return false;
            }
        }
    }

    return true;
}

int main()
{
    int size = 3;
    int vertices[3] = {1, 2, 3};
    bool edges[3][3] =
    {
        {0, 1, 0},
        {0, 0, 1},
        {0, 0, 0}
    };

    Graph g(vertices, edges, 3);
    cout<<hasPath(g, 0, 2)<<endl;;
    cout<<isConnected(g);

    return 0;
}
