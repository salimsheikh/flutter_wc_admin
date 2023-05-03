import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/enum/page_type.dart';
import 'package:flutter_wc_admin/models/category_model.dart';
import 'package:flutter_wc_admin/provider/categories_provider.dart';
import 'package:flutter_wc_admin/provider/loader_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../base_page.dart';

class CategoryAddEditPage extends BasePage {
  final PageType pageType;
  final CategoryModel? model;

  const CategoryAddEditPage({
    Key? key,
    required this.pageType,
    this.model,
  }) : super(key: key);

  @override
  State<CategoryAddEditPage> createState() => _CategoryAddEditPageState();
}

class _CategoryAddEditPageState extends BasePageState<CategoryAddEditPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  late CategoryModel categoryModel;

  @override
  void initState() {
    super.initState();
    pageTitle =
        widget.pageType == PageType.add ? "Add Category" : "Edit Category";

    if (widget.pageType == PageType.edit) {
      categoryModel = widget.model!;
    } else {
      categoryModel = CategoryModel(id: 0, name: '', description: '');
    }
  }

  @override
  Widget pageUI() {
    return Form(
      key: globalKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "name",
                "Category Name",
                "",
                (onValidateVal) {
                  if (onValidateVal == "") {
                    return "Category name cant be empty";
                  }
                  return null;
                },
                (onSaveValue) {
                  categoryModel.name = onSaveValue;
                },
                initialValue: categoryModel.name,
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                showPrefixIcon: false,
                borderRadius: 10,
                paddingLeft: 0,
                paddingRight: 0,
              ),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "description",
                "Category Description",
                "",
                (onValidateVal) {
                  return null;
                },
                (onSaveValue) {
                  categoryModel.description = onSaveValue;
                },
                initialValue: categoryModel.description,
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                showPrefixIcon: false,
                borderRadius: 10,
                paddingLeft: 0,
                paddingRight: 0,
                isMultiline: true,
                containerHeight: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FormHelper.submitButton(
                  "Save",
                  () {
                    Provider.of<LoaderProvider>(context, listen: false)
                        .setLoadingStatus(true);
                    /*Save Start form Here */
                    if (validateAndSave()) {
                      if (widget.pageType == PageType.add) {
                        Provider.of<CategoriesProvider>(context, listen: false)
                            .createCategory(
                          categoryModel,
                          (val) {
                            Provider.of<LoaderProvider>(context, listen: false)
                                .setLoadingStatus(false);

                            if (val) {
                              Get.snackbar(
                                "Add App",
                                "Category Created",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 3),
                              );
                            }
                          },
                        );
                        /*Add Completed */
                      } else {
                        Provider.of<CategoriesProvider>(context, listen: false)
                            .updateCategory(
                          categoryModel,
                          (val) {
                            Provider.of<LoaderProvider>(context, listen: false)
                                .setLoadingStatus(false);

                            if (val) {
                              Get.snackbar(
                                "Add App",
                                "Category Updated",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 3),
                              );
                            }
                          },
                        );
                        /*Edit Completed */
                      }
                    }
                    /*Save End form Here */
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
