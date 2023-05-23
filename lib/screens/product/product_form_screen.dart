import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajulo_new/components/util/custom_dialog.dart';
import 'package:bajulo_new/components/util/exception_handler.dart';
import 'package:bajulo_new/components/util/snackbar_message.dart';
import 'package:bajulo_new/models/product.dart';
import 'package:bajulo_new/controllers/product_controller.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _descriptionFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateUrlImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments != null) {
        Product product = arguments as Product;

        _formData["id"] = product.id;
        _formData["name"] = product.name;
        _formData["description"] = product.description;
        _formData["price"] = product.price;
        _formData["urlImage"] = product.urlImage;

        imageUrlController.text = product.urlImage;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateUrlImage);
    _imageUrlFocus.dispose();
  }

  void updateUrlImage() {
    setState(() {});
  }

  dynamic _validator({required ProductEnum field, required String? value}) {
    if (field == ProductEnum.name) {
      if ((value ?? '').trim().isEmpty) {
        return 'Insert the product name';
      } else if ((value ?? '').trim().length < 3) {
        return 'The product name must have more than 3 characters';
      }
      return null;
    } else if (field == ProductEnum.description) {
      if ((value ?? '').trim().isEmpty) {
        return 'Insert the product description';
      } else if ((value ?? '').trim().length < 3) {
        return 'The product description must have more than 3 characters';
      }
      return null;
    } else if (field == ProductEnum.price) {
      if ((value ?? '').trim().isEmpty) {
        return 'Insert the product price';
      } else if (double.tryParse(value ?? '') == null) {
        return 'The product price is invalid';
      }
      return null;
    } else if (field == ProductEnum.urlImage) {
      if ((value ?? '').trim().isEmpty) {
        return 'Insert the product image URL';
      } else if (!(Uri.tryParse(value!)?.hasAbsolutePath ?? false)) {
        return 'The product image URL is invalid';
      }
      return null;
    }
  }

  Future<void> _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? true)) {
      SnackBarMessage(
        context: context,
        messageType: MessageType.error,
        messageText: 'Errors in the form, check the fields',
      );
    } else {
      _formKey.currentState?.save();
      setState(() => _isLoading = true);

      try {
        await Provider.of<ProductController>(
          context,
          listen: false,
        ).saveProduct(
            product: ProductController.dataToProduct(data: _formData));

        SnackBarMessage(
          context: context,
          messageType: MessageType.sucess,
          messageText: '${_formData['name']} saved successfully',
        );
      } on ExceptionHandler catch (error) {
        CustomDialog(context).errorMessage(message: error.toString());
      } finally {
        setState(() => _isLoading = false);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(title: const Text('Product Form')),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['name']?.toString(),
                      decoration: const InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_descriptionFocus),
                      onSaved: (value) => _formData['name'] = value ?? '',
                      validator: (value) =>
                          _validator(field: ProductEnum.name, value: value),
                    ),
                    TextFormField(
                      initialValue: _formData['description']?.toString(),
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      focusNode: _descriptionFocus,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_priceFocus),
                      onSaved: (value) =>
                          _formData['description'] = value ?? '',
                      validator: (value) => _validator(
                          field: ProductEnum.description, value: value),
                    ),
                    TextFormField(
                      initialValue: _formData['price']?.toString(),
                      decoration: const InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      focusNode: _priceFocus,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_imageUrlFocus),
                      onSaved: (value) =>
                          _formData['price'] = double.parse(value ?? '0'),
                      validator: (value) =>
                          _validator(field: ProductEnum.price, value: value),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.url,
                            focusNode: _imageUrlFocus,
                            controller: imageUrlController,
                            onSaved: (value) =>
                                _formData['urlImage'] = value ?? '',
                            onFieldSubmitted: (_) => _submitForm(),
                            validator: (value) => _validator(
                                field: ProductEnum.urlImage, value: value),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.purple,
                            width: 1,
                          )),
                          alignment: Alignment.center,
                          child: imageUrlController.text.isEmpty
                              ? const Text("Insert the URL")
                              : Image.network(imageUrlController.text),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () => _submitForm(),
        child: const Icon(Icons.save),
      ),
    );
  }
}
