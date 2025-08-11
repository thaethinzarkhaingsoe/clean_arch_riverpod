// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../common_widgets/app_button.dart';
// import '../../../../common_widgets/app_text_field.dart';
//
// import '../../../../core/utils/validators.dart';
// import '../providers/login_provider.dart';
//
// class LoginPage extends ConsumerWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final memberIDController = TextEditingController();
//     final loginState = ref.watch(loginProvider);
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),
//               Text(
//                 'Welcome Back!',
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 32),
//
//               // ✅ Card container for form
//               Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       AppTextField(
//                         label: 'Email',
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         prefixIcon: Icons.email,
//                         validator: validateEmail,
//                       ),
//                       const SizedBox(height: 16),
//                       AppTextField(
//                         label: 'Password',
//                         controller: passwordController,
//                         obscureText: true,
//                         prefixIcon: Icons.lock,
//                       ),
//                       const SizedBox(height: 16),
//                       AppTextField(
//                         label: 'Member ID',
//                         controller: memberIDController,
//                         obscureText: true,
//                         prefixIcon: Icons.lock_outline,
//                       ),
//                       const SizedBox(height: 24),
//
//                       // ✅ Buttons Row
//                       Row(
//                         children: [
//                           Expanded(
//                             child: OutlinedButton(
//                               onPressed: () {
//                                 emailController.clear();
//                                 passwordController.clear();
//                                 memberIDController.clear();
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                               ),
//                               child: const Text('Cancel'),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: loginState is AsyncLoading
//                                   ? null
//                                   : () {
//                                 if (passwordController.text != memberIDController.text) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(content: Text('Passwords do not match')),
//                                   );
//                                   return;
//                                 }
//                                 ref.read(loginProvider.notifier).login(
//                                   emailController.text.trim(),
//                                   passwordController.text.trim(),
//                                   memberIDController.text.trim() ,
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                               ),
//                               child: loginState is AsyncLoading
//                                   ? const SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(strokeWidth: 2),
//                               )
//                                   : const Text('Login'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
