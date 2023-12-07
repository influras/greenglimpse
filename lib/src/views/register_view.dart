import 'package:flutter/material.dart';
import 'package:greenglimpse/src/controllers/register_controller.dart';
import 'package:greenglimpse/utils/country_util.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterController(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text('register'),
        ),
        body: const SingleChildScrollView(
          child: RegisterBody(),
        ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    // Calculate padding based on screen width
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: RegisterController().returnRegisterViewPadding(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/green_glimpse_logo.png'),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updateEmail(value),
            decoration: const InputDecoration(labelText: 'e-mail'),
          ),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updatePassword(value),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
              errorText: context.read<RegisterController>().passwordsMatch()
                  ? null
                  : 'Passwords do not match',
            ),
          ),
          TextField(
            obscureText: true,
            onChanged: (value) =>
                context.read<RegisterController>().updateRepeatPassword(value),
            decoration: InputDecoration(
              labelText: 'repeat password',
              errorText: context.read<RegisterController>().passwordsMatch()
                  ? null
                  : 'Passwords do not match',
            ),
          ),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updateFirstName(value),
            decoration: const InputDecoration(labelText: 'first name'),
          ),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updateLastName(value),
            decoration: const InputDecoration(labelText: 'last name '),
          ),
          Align( alignment: Alignment.centerLeft, 
            child: DropdownButton<String>(
            value: context.watch<RegisterController>().selectedCountry,
            onChanged: (value) {
              context.read<RegisterController>().updateSelectedCountry(value!);
            },
            items: CountryUtil.getAllCountries(),
            hint: const Text('Select a country'),
            
          )),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updateCity(value),
            decoration: const InputDecoration(labelText: 'city'),
          ),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updatePostcode(value),
            decoration: const InputDecoration(labelText: 'postcode'),
          ),
          TextField(
            onChanged: (value) =>
                context.read<RegisterController>().updateStreet(value),
            decoration: const InputDecoration(labelText: 'street'),
          ),
          const SizedBox(height: 20),
          IntrinsicWidth(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Row(
                  children: [
                    const Text('confirm the terms and condtitions'),
                    Checkbox(
                      value: context.watch<RegisterController>().acceptTerms,
                      onChanged: (value) {
                        // Update the state of the checkbox
                        context
                            .read<RegisterController>()
                            .updateAcceptTerms(value ?? false);
                      },
                    ),
                  ],
                ),
              ])),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(140, 40)),
            onPressed: () {
              // Check if terms are accepted before proceeding
              // ignore: dead_code
              if (context.read<RegisterController>().acceptTerms) {
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red[400],
                    content:
                        const Text('Please accept the terms and conditions.'),
                  ),
                );
              }
            },
            child: const Text('register',
                style: TextStyle(letterSpacing: 0.2, fontSize: 16)),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 200),
          const Text("powered by greenglimpse",
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
