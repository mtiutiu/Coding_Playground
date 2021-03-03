#ifndef UTIL_H
#define UTIL_H

namespace Util {

  static bool isnumeric(char *str) {
    while(*str) {
      if(!isdigit(*str)) {
        return false;
      }
      str++;
    }
    return true;
  }

  template <class T>
  class ArrayList {
    public:
      ArrayList(uint8_t size = 0):
      _size(size),
      _objList(NULL)
      {
        _objList = new T*[size];

        for(uint8_t i = 0; i < size; i++) {
          _objList[i] = NULL;
        }
      }

      ~ArrayList() {
        clear();

        if(_objList != NULL) {
          delete _objList;
        }
      }

      void add(T* newObj) {
        for(uint8_t i = 0; i < _size; i++) {
          if(_objList[i] == NULL) {
            _objList[i] = newObj;
            break;
          }
        }
      }

      T* get(uint8_t index) {
        if((index >= 0) && (index < _size) && (_objList[index] != NULL)) {
          return _objList[index];
        }
        return NULL;
      }

      T* operator[](uint8_t index) {
        return get(index);
      }

      void remove(uint8_t index) {
        if((index >= 0) && (index < _size) && (_objList[index] != NULL)) {
          delete _objList[index];
          _objList[index] = NULL;
        }
      }

      void clear() {
        for(uint8_t i = 0; i < _size; i++) {
          remove(i);
        }
      }

      // gets last non NULL element index
      uint8_t getLastIndex() {
        uint8_t lastIndex = 0;

        for(uint8_t i = 0; i < _size; i++) {
          if(get(i) != NULL) {
            lastIndex = i;
          }
        }

        return lastIndex;
      }

      // counts non NULL elements
      uint8_t count() {
        uint8_t itemCount = 0;

        for(uint8_t i = 0; i < _size; i++) {
          if(get(i) != NULL) {
            ++itemCount;
          }
        }

        return itemCount;
      }

      // total capacity
      uint8_t size() {
        return _size;
      }

    private:
      uint8_t _size;
      T** _objList;
  };
};

#endif
