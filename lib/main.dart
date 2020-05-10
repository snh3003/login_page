import "package:flutter/material.dart";

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }

}
class LoginPage extends StatefulWidget{
  @override
  State createState()=> new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation=new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.loose,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/mcintyre.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.colorBurn,
          ),
          new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlutterLogo(
                    size: _iconAnimation.value*100,
                  ),
                  new Form(
                      child: Theme(
                        data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.yellow,
                          inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                            )
                          )
                        ),
                        child: new Container(
                          padding: const EdgeInsets.all(40.0),

                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Enter Email",
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  labelText: "Enter Password",
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              new Padding(padding: const EdgeInsets.all(20.0)),
                              new MaterialButton(
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  child: new Text("Login"),
                                  onPressed: ()=>{}
                              )
                            ],
                          ),
                        ),
                      )
                  ),
//                  new Image(
//                    image:new AssetImage("assets/wwe.png"),
//                    size: _iconAnimation.value,
//                  )
                ],
              ),
          ),

        ],
      ),
    );
  }
}