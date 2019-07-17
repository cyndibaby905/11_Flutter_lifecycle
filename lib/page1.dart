import 'package:flutter/material.dart';
import './page2.dart';

class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with WidgetsBindingObserver{

  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("page1 initState......");
    WidgetsBinding.instance.addObserver(this);//注册监听器

    WidgetsBinding.instance.addPostFrameCallback((_){
      print("单次Frame绘制回调");//只回调一次
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      print("实时Frame绘制回调");//每帧都回调
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("page1 setState......");

  }

  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page1 didChangeDependencies......");
  }

  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("page1 build......");
    return Scaffold(
      appBar: AppBar(title: Text("Lifecycle demo")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("打开/关闭新页面查看状态变化"),
              onPressed: ()=> Navigator.push(
                context, MaterialPageRoute(builder: (context) => Parent()),
              ),
            )
          ],
        ),),
    );

  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(Page1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page1 didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('page1 deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('page1 dispose......');
    WidgetsBinding.instance.removeObserver(this);//移除监听器
  }

  //监听App生命周期回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("$state");
    if (state == AppLifecycleState.resumed) {
      //do sth
    }
  }
}
