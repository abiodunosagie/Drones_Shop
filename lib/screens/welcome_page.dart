import 'package:flutter/material.dart';
import 'package:intern/constants/constants.dart';
import 'package:intern/screens/drone_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/28.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('See the world',
                    textScaleFactor: 1.0, style: kHeaderText),
                const SizedBox(
                  height: 1,
                ),
                const Text(
                  'We will show you the best \n view there is anywhere!',
                  style: kSubText,
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProductCard()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                              Icon(Icons.arrow_forward_ios, color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
