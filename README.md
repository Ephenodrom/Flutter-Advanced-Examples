# Advanced Flutter Example

An advanced flutter example project.

## Table of Contents

1. [Install](#install)  
2. [Structure](#structure)
3. [Examples](#examples)
   * [Filtering list](#filtering-list)
   * [Reading json file](#reading-json-file)
   * [Managing favorites in shared preferences](#managing-favorites-in-shared-preferences)
   * [Managing inputs within a modal or bottom sheet](#managing-inputs-within-a-modal-or-bottom-sheet)
   * [Shopping Cart](#shopping-cart)
   * [Global Message](#global-message)
4. [Changelog](#changelog)
5. [Contributing](#contributing)
6. [Support](#support)
7. [Copyright and license](#copyright-and-license)

## Structure

Every example has it's own folder containing a **README.md** file and other files needed for that example.
Thse **README.md** files contain more detailed explanations of the examples.

## Install

You can find the corresponding app for this examples in the [play store](https://play.google.com/store/apps/details?id=de.feuerbergsoftware.advancedflutterexample).
It shows every example in action and has a link to the corresponding files within this repository.

## Examples

### Filtering list

Sorting a list of objects by different filters. The example contains a list of cars that can be filtered in different ways.

* [Example1.dart](lib/examples/filterList/Example1.dart)
* [Documentation](lib/examples/filterList/README.md)

### Reading json file

Reading a json file from the asset folder and displaying it's content in the ui.

* [Example2.dart](lib/examples/readingJsonFile/Example2.dart)
* [Documentation](lib/examples/readingJsonFile/README.md)

### Managing favorites in shared preferences

Mark items from a list as your favorite and save the favorites in the shared preferences. The example contains a list of meals.
Each meal can be marked as favorite.

* [Example3.dart](lib/examples/managingFavoritesInSharedPreferences/Example3.dart)
* [Documentation](lib/examples/managingFavoritesInSharedPreferences/README.md)

### Managing inputs within a modal or bottom sheet

Outsourcing checkboxes, radiobuttons and switches to a modal or a bottomsheet.

* [Example4.dart](lib/examples/managingInputsWithinModalBottomsheet/Example4.dart)
* [Documentation](lib/examples/managingInputsWithinModalBottomsheet/README.md)

### Shopping Cart

A simple shopping cart with the possibility to add an remove items. The example consist of an app bar icon which displays the amount of items in the cart, a product list screen and the shopping cart screen, displaying each item of the cart and the calculated costs of the cart. This example uses BLOC logic.

* [Example5.dart](lib/examples/shoppingCart/Example5.dart)
* [Documentation](lib/examples/shoppingCart/README.md)

### Global Message

Display messages that were created anywhere in the app. Simply push messge to the MessageBloc and the messagewrapper will display them. This example uses BLOC logic.

* [Example6.dart](lib/examples/globalMessage/Example6.dart)
* [Documentation](lib/examples/globalMessage/README.md)

## Changelog

For a detailed changelog, see the [CHANGELOG.md](CHANGELOG.md) file

## Contributing

You want to see new examples ? You have a nice example, that you want to share with others ? Feel free to make a pull request!
Check [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## Support

You like this repository or even use it in one of your projects? Feel free to donate a cup of
coffee!
Flattr : <https://flattr.com/@Ephenodrom>

## Copyright and license

MIT License

Copyright (c) 2019 Ephenodrom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.