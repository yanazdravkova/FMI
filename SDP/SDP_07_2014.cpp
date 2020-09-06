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

pair<Node*, Node*> precedes(Node* start, int M, int N)
{
    Node* curr = start;
    while(curr->next != start)
    {
        if (curr->data == M && curr->next->data == N)
        {
            return make_pair(curr, curr->next);
        }
        else
        {
            curr = curr->next;
        }
    }

    return make_pair(nullptr, nullptr);
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

bool isPairEmpty(pair<Node*, Node*> p)
{
    return p.first == nullptr && p.second == nullptr;
}

void myMerge(Node* start1, Node* start2)
{
    Node* curr1 = start1;
    Node* curr2 = start2;
    int maxSum = 0;

    pair<Node*, Node*> currTopPair1;
    pair<Node*, Node*> currTopPair2;


    do
    {
        int M = curr1 -> data;
        int N = curr1 -> next -> data;
        pair<Node*, Node*> p1 = precedes(start1, M, N);
        pair<Node*, Node*> p2 = precedes(start2, N, M);

        if (!isPairEmpty(p1) && !isPairEmpty(p2) && ((M + N) > maxSum))
        {
            maxSum = M + N;
            currTopPair1 = p1;
            currTopPair2 = p2;
        }
        else
        {
            curr1 = curr1 -> next;
        }
    } while (curr1-> next != start1);

    // merge if possible

    if(!isPairEmpty(currTopPair1) && !isPairEmpty(currTopPair2))
    {
        Node* first1 = currTopPair1.first;
        Node* second1 = currTopPair1.second;
        Node* first2 = currTopPair2.first;
        Node* second2 = currTopPair2.second;

        first1 -> next = second2 -> next;
        first2 -> next = second1 -> next;

        cout<<"MERGED"<<endl;
        print(start1);
    }
    else
    {
        cout<<"MERGE IMPOSSIBLE, Call Tom Cruise"<<endl;
    }
}

int main()
{
    Node* sixth1 =  new Node(nullptr, 3);
    Node* fifth1 = new Node(sixth1, 5);
    Node* fourth1 = new Node(fifth1, 4);
	Node* third1 = new Node(fourth1, 3);
	Node* second1 = new Node(third1, 2);
	Node* start1 = new Node(second1, 1);

	sixth1->next = start1;

	cout<<"First list: "<<endl;
	print(start1);
	cout<<endl;

    Node* fifth2 = new Node(nullptr, 3);
    Node* fourth2 = new Node(fifth2, 4);
	Node* third2 = new Node(fourth2, 8);
	Node* second2 = new Node(third2, 5);
	Node* start2 = new Node(second2, 2);

	fifth2->next = start2;

	cout<<"Second list: "<<endl;
	print(start2);
	cout<<endl<<endl;

	myMerge(start1, start2);
    return 0;
}
