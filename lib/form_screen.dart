import 'package:flutter/material.dart';


class Formval extends StatefulWidget {

  @override
  _FormvalState createState() => _FormvalState();
}

class _FormvalState extends State<Formval> {

  String? _name;
  String? _email;
  String? _password ;
  String? _url ;
  String? _phone ;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name',
      border: InputBorder.none, prefixIcon: Icon(Icons.person),labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
      keyboardType: TextInputType.name,
      maxLength: 15,
      validator: (String? value){
        if (value!.isEmpty){
          return 'Name is Required';
        }
      },
      onSaved: (String? value){
        _name = value;
       },

    );
  }
  Widget _buildEmail(){
    return TextFormField(
        decoration:const InputDecoration(labelText: 'Email',border: InputBorder.none, prefixIcon: Icon(Icons.mail),labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (String? value){
    if (value!.isEmpty){
    return 'Email is Required';
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
      return 'Please enter a valid Email';
    }
    return null;
    },
      onSaved: (String? value){
        _email = value;
      },
    );
  }
  Widget _buildPassword(){
    return TextFormField(
      decoration:const InputDecoration(labelText: 'Password',border: InputBorder.none, prefixIcon: Icon(Icons.password),labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value){
        if (value!.isEmpty){
          return 'Password is Required';
        }

      },
        onSaved: (String? value){
          _password = value;
        },
    );
  }
   Widget _buildUrl(){
     return TextFormField(
       decoration:const InputDecoration(labelText: 'Url',border: InputBorder.none, prefixIcon: Icon(Icons.link),labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
       ),
       keyboardType: TextInputType.url,
       validator: (String? value){
         if (value!.isEmpty){
           return 'Url is Required';
         }

       },
         onSaved: (String? value){
           _url = value;
         },
     );
  }
  Widget _buildPhone(){
    return TextFormField(
      decoration:const InputDecoration(labelText: 'Phone',border: InputBorder.none, prefixIcon: Icon(Icons.phone),labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 11,
      validator: (String? value){
        if (value!.isEmpty){
          return 'Phone is Required';
        }

      },
      onSaved: (String? value){
        _phone = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Center(child: Text('Register')),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        margin:const EdgeInsets.all(24),
        child: Form(
          key:_formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildName(),
            _buildEmail(),
            _buildPassword(),
            _buildUrl(),
            _buildPhone(),
            const SizedBox(height: 100,),
            ElevatedButton(
                child:const Text('Submit', style:TextStyle(color: Colors.black38, fontSize: 16)),
                onPressed: (){
                  if(!_formkey.currentState!.validate()){
                    return;
                  }
                  _formkey.currentState!.save();

                  print(_name);
                  print(_email);
                  print(_password);
                  print(_url);
                  print(_phone);

                },
            )
          ],
        ),),
      ),

    );
  }
}
