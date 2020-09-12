#include <iostream>
#include <vector>
#include <fstream>
using namespace std;

struct Node
{
    int data;
    vector<Node*> children;
    bool isLeaf()
    {
        return children.empty();
    }
};

Node* readTree(istream& fi)
{
    Node* tree = new Node();
    char c;
    c = fi.get();

    if (c == ')')
    {
        return nullptr;
    }

    int n = 0;
    fi >> n;

    if (!fi)
    {
        fi.clear();
    }

    tree->data = n;
    while((c = fi.get()) != ')')
    {
        if (c == '(')
        {
            tree->children.push_back(readTree(fi));
        }
        if(c == ',' || c == ' ')
        {
            fi.get();
            tree->children.push_back(readTree(fi));
        }
    }

    return tree;
}

Node* readTreeFromFile(char* filename)
{
    ifstream fi;
    fi.open(filename);
    return readTree(fi);
}

void maxSumRec(Node* node, int& currMax, int currSum)
{
    currSum += node->data;

    if(node->isLeaf() && currSum > currMax)
    {
        currMax = currSum;
    }
    else
    {
        for (Node* child : node->children)
        {
            maxSumRec(child, currMax, currSum);
        }
    }
}

int maxSum(Node* root)
{
    int currMax = -1;
    maxSumRec(root, currMax, 0);

    return currMax;
}

print(Node* root)
{
    if(root != nullptr)
    {
        cout<<root->data<<" ";
        for (Node* child : root->children)
        {
            print(child);
        }
    }
}
int main()
{
    Node* tree = readTreeFromFile("test_SDP_07_2016.txt");
    print(tree);
    cout<<"MAX "<<maxSum(tree);
    return 0;
}
