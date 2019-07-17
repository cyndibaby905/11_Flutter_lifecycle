import 'package:flutter/material.dart';


class Parent extends StatefulWidget {
  Parent({Key key}) : super(key: key);

  _ParentState createState() => _ParentState();
}


class _ParentState extends State<Parent> {
  int _counter = 0;

  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("page2 parent initState......");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("page2 parent setState......");

  }

  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page2 parent didChangeDependencies......");
  }

  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("page2 parent build......");
    return Scaffold(
      appBar: AppBar(title: Text("setState demo")),
      body: Center(
          child: RaisedButton(
            ///点击事件
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Child(count:_counter),
          )),
    );

  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(Parent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page2 parent didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('page2 parent deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('page2 parent dispose......');
  }
}

class Child extends StatefulWidget {
  final int count;
  Child({Key key, this.count}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("child build......");
    return Text('点击按钮查看状态变化 count: ${widget.count}');
  }

  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("page2 child initState......");
  }


  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page2 child didChangeDependencies......");
  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page2 child didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('page2 child deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('page2 child dispose......');
  }
}