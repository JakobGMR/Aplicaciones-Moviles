
import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  @override
  Widget build(BuildContext context) {
    final DrawerWidget getDrawer = DrawerWidget();
    final _formKey = GlobalKey<FormState>();
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('FormValidation',)),
        drawer: getDrawer.getDrawer(context),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'No dejes este campo vacío';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 10,),
        
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando datos')),
                    );
                  }
                }, 
                child: const Text('Enviar datos'),
              )
            ],
          ),
        ),
      ),
    );
  }
}