#include <iostream>
using namespace std;

struct Point
{
    int x;
    int y;

    Point(int _x = 0, int _y = 0)
    {
        x = _x;
        y = _y;
    }

    Point* getNeighbours(char ** GameBoard, int n)
    {
        Point result[8];
        int k = 0;
        for (int i = x - 1; i < x + 2; i++)
        {
            for (int j = y - 1; j < y + 2; i++)
            {
                if (i > 0 && j > 0 && i < n && j < n)
                {
                    result[k] = Point(i, j);
                    k++;
                }
            }
        }

        return result;
    }

    bool hasNeighOfNeighFire(char ** GameBoard, int n) // checks whether any neighbour of the point has a neighbour who is fire
    {
        Point* neighbours = this->getNeighbours(GameBoard, n);

        for (int i = 0; i < 8; i++)
        {
            Point currNeighbourPoint = neighbours[i];
            if(GameBoard[currNeighbourPoint.x][currNeighbourPoint.y] == '1')
            {
                return true;
            }
        }
        return false;
    }
};

class GamePlayer
{
protected:
    Point currPos;
public:
    GamePlayer(int _x, int _y)
    {
        currPos.x = _x;
        currPos.y = _y;
    }
    virtual ~GamePlayer(){};
    Point getPosition()
    {
        return currPos;
    }

    virtual Point* allowedMoves(char ** GameBoard, int n) = 0;

};

class Knight : public GamePlayer
{
    public:
    Knight(int _x, int _y) : GamePlayer(_x, _y) {}
    Point* allowedMoves(char **GameBoard, int n)
    {
        int k = 0;
        Point allowedMoves[8];
        Point* neighbours =  currPos.getNeighbours(GameBoard, n);

        for (int l = 0 ; l < 8 ; l++)
        {
            Point currNeighbourPoint = neighbours[l];

            if (GameBoard[currNeighbourPoint.x][currNeighbourPoint.y] == '0' &&
                    !currNeighbourPoint.hasNeighOfNeighFire(GameBoard, n))
            {
                allowedMoves[l] = currNeighbourPoint;
                cout <<"currNeighbourPoint: "<<currNeighbourPoint.x<<" "<<currNeighbourPoint.y<<endl;
            }
        }

        return allowedMoves;
    }
};


int main()
{
    int n = 3;
    char ** board = new char*[n];
    for (int i = 0; i < n; i++)
    {
        board[i] = new char[n];
    }


    Knight k = Knight(1, 2);
    k.allowedMoves(board, 3);
    return 0;
}
