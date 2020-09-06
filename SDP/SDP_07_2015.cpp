#include <iostream>
#include <vector>
using namespace std;

struct Node
{
    int data;
    vector<Node*> children;
    Node(int _data, vector<Node*> _children)
    {
        data = _data;
        children = _children;
    }
};

bool member(Node* root, int x)
{
    if (root == nullptr)
    {
        return false;
    }

    if (root -> data == x)
    {
        return true;
    }

    for (Node* child : root->children)
    {
        member(child, x);
    }
    return false;
}

void deleteTree(Node* root)
{
    if(root != nullptr)
    {
        cout<<"root -> data "<<root->data;
        for (Node* child : root->children)
        {
            deleteTree(child);
        }
        delete root;
    }
}

void filterOdd(Node* root)
{
    if(root == nullptr)
    {
        return;
    }
    for (Node* child : root->children)
    {

        if (child != nullptr && child->data % 2 == 1)
        {
            deleteTree(child);
            cout<<endl<<"after delete"<<endl;
        }
    }

    print(root);
}

int main()
{
    vector<Node*> children;
    children.push_back(nullptr);
    Node* six = new Node(6, children);

    Node* five = new Node(5, children);

    Node* four = new Node(4, children);

    Node* two = new Node(2, children);

    children.push_back(four);
    children.push_back(five);
    children.push_back(six);


    Node* three = new Node(3, children);


    vector<Node*> rootChildren;
    rootChildren.push_back(two);
    rootChildren.push_back(three);

    Node* eight = new Node(8, rootChildren);
    filterOdd(eight);
    return 0;
}
