import 'package:flutter/material.dart';
import 'package:app/login.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: SignInScreen(),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordVisible = false;
  bool _agreeToTerms = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Getting started",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Create an account to continue!",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.contact_page),
                        hintText: 'Username',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintText: '********',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        // Add more password strength checks if needed
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'By continuing you agree to our terms and conditions',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your sign-up logic here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 109, 71, 246)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(16.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward, color: Colors.white),
                      Text(
                        ']',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigate to SignInPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
