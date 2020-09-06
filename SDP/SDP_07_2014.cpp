#include <iostream>
using namespace std;

struct Node
{
    Node* next;
    int data;

    Node(Node* _next, int _data): next(_next), data(_data) {}
    Node()
    {
        next = nullptr;
    };
};

bool precedes(Node* start, int M, int N)
{
    Node* curr = start;
    while(curr->next != start)
    {
        if (curr->data == M && curr->next->data == N)
        {
            return true;
        }
        else
        {
            curr = curr->next;
        }
    }

    return false;
}

void print(Node* start)
{
    Node* curr = start;
    cout<<curr->data<<"->";
    while(curr->next != start)
    {
        curr = curr->next;
        cout<<curr->data<<"->";
    }
}

int main()
{
    Node* sixth =  new Node(nullptr, 3);
    Node* fifth = new Node(sixth, 5);
    Node* fourth = new Node(fifth, 4);
	Node* third = new Node(fourth, 3);
	Node* second = new Node(third, 2);
	Node* first = new Node(second, 1);

	sixth->next = first;

	print(first);
    return 0;
}
