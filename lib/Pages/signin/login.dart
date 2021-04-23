import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _passwordController = new TextEditingController();

class _LoginState extends State<Login> {
  AuthMode _authMode = AuthMode.Login;
  @override
  void initState() {
    super.initState();
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = false;
    });
  }

  bool _saveAttempted = false;
  String _username, _email, _password, _confirmpassword;

  _submit() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _saveAttempted = true;
      });
      _formKey.currentState.save();
    }
  }

  _buildEmailField() {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(
            Icons.account_circle,
            size: 32,
          )),
      keyboardType: TextInputType.emailAddress,
      initialValue: 'njc@gmail.com',
      style: TextStyle(fontSize: 22),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email must be provided';
        }
        if (!RegExp(
                r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$')
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassordField() {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: _toggle,
            child: Icon(
              _obscureText ? Icons.lock : Icons.panorama_fish_eye,
              size: 15.0,
              color: Colors.black,
            ),
          ),
          labelText: 'Password',
          focusColor: Colors.deepOrange,
          icon: Icon(
            Icons.lock,
            size: 32,
          )),
      style: TextStyle(fontSize: 20),
      obscureText: _obscureText,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password must be provided';
        }
        if (value.length < 5 || value.length > 12) {
          return 'Password must be between 5 and 12 characters';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildConfirmPassordField() {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          icon: Icon(
            Icons.verified_user,
            size: 32,
          )),
      style: TextStyle(fontSize: 20),
      cursorColor: Colors.orange,
      obscureText: true,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen......");
    return Scaffold(
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TopBg(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                      child: Column(
                        children: [
                          Text(
                            "Sign into Musama ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange),
                          ),
                          _buildEmailField(),
                          SizedBox(height: 10),
                          _buildPassordField(),
                          SizedBox(height: 10),
                          _authMode == AuthMode.Signup
                              ? _buildConfirmPassordField()
                              : Container(),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.all(10),
                color: Colors.teal,
                child: Text(
                  'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _authMode = _authMode == AuthMode.Login
                        ? AuthMode.Signup
                        : AuthMode.Login;
                  });
                },
              ),
              RaisedButton(
                padding: EdgeInsets.all(10),
                elevation: 2,
                color: Colors.orange,
                onPressed: _submit,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgpost.png"), fit: BoxFit.cover)),
    );
  }
}
