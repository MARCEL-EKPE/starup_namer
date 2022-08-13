import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const  SignupScreen(),
        '/LoginScreen' : (context) => const LoginScreen(),
        '/RandomWords' : (context) => const RandomWords(),

      },
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() =>SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up form'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                ),
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'password must be at lease 4 characters';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                onPressed: (){
                  formKey.currentState?.validate();
                 Navigator.pushNamed(context,'/LoginScreen');
                },
                child: const Text('Sign up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() =>LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'you@email.com',
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                ),
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'password must be at lease 4 characters';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                onPressed: (){
                  formKey.currentState?.validate();
                  Navigator.pushNamed(context,'/RandomWords');
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class RandomWords  extends StatefulWidget {
  const RandomWords ({super.key});
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();

            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        ),
      ),
    );
  }
}