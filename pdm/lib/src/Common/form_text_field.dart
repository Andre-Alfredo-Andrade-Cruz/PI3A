import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pdm/src/Features/auth/presentation/view/page/forgot_screen.dart';
import 'package:pdm/src/Features/auth/presentation/view/page/signup_screen.dart';

extension CoreFormTextField on Widget {
  Widget createFormField({
    required String title,
    required ThemeData theme,
    TextInputType keyboardType = TextInputType.name,
    TextInputAction textInputAction = TextInputAction.done,
    Color borderColor = Colors.black54,
    double borderWidth = 1,
    bool obscureText = false,
    bool enabled = true,
    String? hint,
    FormFieldValidator? validator,
    String? mask,
    String? errorText,
    Map<String, RegExp>? maskFilter,
    ValueChanged<String>? onChange,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
  }) {
    final maskFormatter = MaskTextInputFormatter(
      mask: mask,
      filter: maskFilter,
      type: MaskAutoCompletionType.lazy,
    );

    final border = OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(title, style: theme.textTheme.headline5),
          ),
          const SizedBox(height: 40),
          TextFormField(
            inputFormatters: [maskFormatter],
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              //constraints: const BoxConstraints(maxHeight: 48),
              isDense: true,
              hintText: hint,
              errorText: errorText,
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
            ),
            validator: validator,
            onChanged: onChange,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
          )
        ],
      ),
    );
  }
}
