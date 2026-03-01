import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/auth/presentation/provider/auth_provider.dart';
import 'package:fotocolab_admin/util/assets/assets.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late AuthNotifierProvider provider;
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future<void> loginOnTap() async {
    bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      bool isLogin = await provider.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (isLogin) {
        gotoHome();
      }
    }
  }

  void gotoHome() {
    context.go(RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authProvider);
    provider = ref.read(authProvider.notifier);
    return BaseLayout(
      child: Expanded(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Image.asset(Assets.logo),
                  ),
                  BrandVSpace.gap16(),
                  BrandText.white(
                    data: context.loc.fotocolab_admin,
                    fontSize: BrandFontSize.size28,
                    fontWeight: FontWeight.bold,
                  ),
                  BrandText.grey(
                    data: context.loc.secure_enterprise_access,
                    fontColor: AppColors.greyA3,
                  ),
                  BrandVSpace.gap100(),
                  BrandTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: context.loc.email,
                    validator: (value) {
                      return Validator.emailValidator(
                        context: context,
                        value: value,
                      );
                    },
                    onChanged: (val) {},
                  ),

                  BrandVSpace.gap16(),
                  BrandTextField(
                    hintText: context.loc.password,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.password(
                        pwd: value ?? '',
                        context: context,
                      );
                    },
                  ),
                  BrandVSpace.gap16(),

                  BrandVSpace.gap100(),
                  BrandButton.primary(
                    title: context.loc.login,
                    isLoading: provider.isLoading,
                    onTap: loginOnTap,
                    fontColor: AppColors.secondary,
                    rightIcon: Icon(Icons.arrow_forward_rounded),
                  ),

                  BrandVSpace.gap16(),
                  BrandSelectableChip(
                    isSelected: true,
                    title: context.loc.secure_admin_access,
                  ),
                  BrandVSpace.gap100(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
