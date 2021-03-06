#include <list>
#include <unordered_map>
using namespace std;
class LRUCache {
public:
    LRUCache(int capacity) 
        :_cap(capacity)
    {}
    
    int get(int key) 
    {
        auto it = _m.find(key);
        if(it == _m.end())
        {
            return -1;
        }
        int val = it->second->second;
        _list.erase(it->second);
        _list.push_front(make_pair(key,val));
        _m[key] = _list.begin();
        return it->second->second;
    }
    
    void put(int key, int value) {
        auto it = _m.find(key);
        if(it != _m.end())
        {
            _list.erase(it->second);
        }
        
        _list.push_front(make_pair(key,value));
        _m[key] = _list.begin();
        if(_list.size()>_cap)
        {
            int key = _list.back().first;
            _m.erase(key);
            _list.pop_back();
        }
    }
private:
    unordered_map<int,list<pair<int,int>>::iterator> _m;
    list<pair<int,int>> _list;
    int _cap;
};
