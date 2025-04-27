import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/storage/storage_service.dart';
import '../../../../core/utils/constants/app_text.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/snackBar.dart';
import '../../../../core/utils/validators/validators.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.login)),
      body: Obx(() {
        // Listen for auth status changes
        if (controller.isAuthenticated) {
          Future.delayed(const Duration(milliseconds: 100), () {
            Get.offAllNamed(Routes.BOTTOM_NAVBAR);
          });
        } else if (controller.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            SnackBarMessage.error(context: context, message: controller.errorMessage ?? "Authentication failed");
          });
        }

        return Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace24),
          child: Form(
            key: controller.validator,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Logo Title & Subtitle
                //const AppLoginHeader(),
                SizedBox(height: AppSizes.spaceBtwInputFields12),

                ///Email
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.email,
                  validator: (value) => AppValidators.validateEmail(value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: AppText.email),
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields6),

                ///Password
                Obx(() => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.password,
                      obscureText: controller.showPassword.value,
                      validator: (value) => AppValidators.validatePassword(value),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: AppText.password,
                          suffixIcon: IconButton(
                            onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                            icon: Icon(controller.showPassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          )),
                    )),

                const SizedBox(height: AppSizes.spaceBtwInputFields6),

                Obx(() => ElevatedButton(
                      onPressed: controller.isLoading
                          ? null // Disable button when loading
                          : () {
                              if (!controller.validator.currentState!.validate()) {
                                SnackBarMessage.warning(context: context, message: AppText.requiredFieldMsg);
                                return;
                              }
                              controller.signIn(
                                controller.email.text,
                                controller.password.text,
                              );
                            },
                      child: controller.isLoading ? const CircularProgressIndicator() : Text(AppText.login.toUpperCase()),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
