1、为什么字符串的参数需要使用memory声明 ？
```
function f1(string memory n) public {}
function f1(int n) public {}

```

2、public声明的状态变量，被继承的子合约使用时，可以直接使用，被外部合约使用时，需要以方法的形式使用
    状态变量的默认修饰符是 internal
```
contract A {
    int public d1 = 10;
    int internal d2 = 20;
    int private d3 = 30;
}

contract B is A {
    function f1() public view returns (int) {
        return d1;
    }
}

contract C {
    A a = new A();
    function f1() public view returns (int) { 
        return a.d1();
    }
}

```

3、关键字`virtual`表示该函数可以在派生类中重写，被定义为virtual后，
即使没有修改状态变量，会消耗gas
```
contract Person {
    function f1() public pure virtual returns (uint) {
        uint age = 30;
        return age;
    }
}
```

4、
