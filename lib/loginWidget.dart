import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black, // Base color
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight, // Gradient from top right
                    radius: 0.6,
                    colors: [
                      Color(0xFFE91E63), // Pink color
                      Colors.transparent, // Transition to transparent
                    ],
                    stops: [0.3, 1.0], // Stops for the gradient effect
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.bottomLeft, // Gradient from bottom left
                    radius: 0.6,
                    colors: [
                      Color(0xFFE91E63), // Pink color
                      Colors.transparent, // Transition to transparent
                    ],
                    stops: [0.3, 1.0], // Stops for the gradient effect
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(color: Colors.white),
                      Text('Continue with email',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      SizedBox(width: 48), // Placeholder to balance the row
                    ],
                  ),
                  const SizedBox(height: 100), // Adjust spacing here
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Sign in your account to continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: const Icon(Icons.visibility,
                                color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    onChanged: (bool? value) {},
                                    activeColor: Colors.pink),
                                const Text('Remember me',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            TextButton(
                              onPressed:
                                  () {}, // Forgot Password Screen Navigation
                              child: const Text('Forgot Password?',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {}, // Sign In Action
                            child: const Text('Sign In',
                                style: TextStyle(fontSize: 18)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF33F5E),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 150), // Increased padding
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextButton(
                            onPressed: () {}, // Sign Up Screen Navigation
                            child: const Text('Don\'t have an account? Signup',
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0), // Remove padding
                              tapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // Remove extra tap area
                              minimumSize: const Size(
                                  double.infinity, 40), // Stretch to full width
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
