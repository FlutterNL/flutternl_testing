# Golden Testing

## What is golden testing?

If you look at the test pyramid widget tests are basically *component tests* and lie between the unit tests and integration tests layers.

Widget tests typically test the *behavior* and *user interaction* on your component. If the user taps button X something happens on the screen. But how do you test if the text or the background of your widget has a certain color? Or if some icon in your widget has the correct padding? This is where golden tests, another form of component testing, comes in.

The term **golden file** refers to an image file that is considered the true rendering of a given widget, state, application, or other visual representation you have chosen to capture.

Golden tests are like widget tests, except you don't verify the behavior of a widget (i.e. when you click on a button something happens on screen) but you verify a rendered widget state against the expected output, which is stored in a separate (golden) image file.

## Why is golden testing useful?

> “With visuals, it's often difficult to express correctness. Someone can design lots of specific checks for, say, element size, positioning and styling, but the whole composition on the screen might still be wrong, weird, or just ugly. Though people can easily spot when something is off, because it's difficult to express expected results, automation traditionally wasn’t very helpful.” 
> 
> — Gojko Adzic, creator of visual testing tool Appraise

Or phrased differently; it is hard to see (small) differences in the UI of your widgets with the bare eye. 

You can verify that something *looks good* but to see a 1 pixel padding difference, or that the background color is 5% lighter, or if some component is 2 pixels higher is very difficult for the human eye.

This is where golden test come to the rescue.

## How do these golden tests work?

Flutter *golden tests* are basically *widget tests*. A special matcher compares your widget with a baseline image file and expects that it looks the same.

### matchesGoldenFile

[API Docs](https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html)

`matchesGoldenFile` is an asynchronous matcher, so you can do something like this:

```
await expectLater(find.byType(YourWidget), matchesGoldenFile(‘your_widget_golden_master.png'));
```

It uses a `GoldenFileComparator` to do a pixel by pixel comparison of the image on disk and rendered in memory. If you want you can extend the `GoldenFileComparator` and use that for matching.

The image files that we will use as the baseline can be created or updated by running the following command: 

```
flutter test --update-goldens
```

Then, when you're happy with the golden files and since golden tests are basically widget tests under the hood, you can run the golden tests with:

```
flutter test
```

### Conclusion

* The default golden image files has a 800x600 resolution, which is probably not what you want.
* The golden files generated show the Ahem font, which is not very nice to look at.
* You have to wrap the widgets in a `Scaffold` and/or a `MaterialApp` all the time.

## Ebay's `golden_toolkit`

Creating golden tests already brings along some boilerplate code for every test

* Wrapping widgets in `Scaffold` and/or `MaterialApp` widgets
* Doing extra steps to load fonts
* Creating the right screen size for the golden test
* etc.

The Flutter developers at eBay have assembled all this knowledge into the [`golden_toolkit`](https://pub.dev/packages/golden_toolkit) package

The `golden_toolkit` supports testing of widgets with multiple layout variations and testing of a composition of multiple widgets


## The benefits of adding golden tests to your test suite

* Every miniscule UI change (the smallest difference in padding, color, font size etc) which are hard to see with the eye, will be captured by these tests.
* You can use the generated images as documentation for all the variants that your widget is capable of rendering
* It is very easy to verify the hard to reproduce states in these golden tests so you can focus on the more generic states in your integration and exploratory tests

## Caveats

* Golden files generated on a MacBook won’t match when run on a Linux machine
* Showing images you get from some remote server is hard to do in golden tests. If you use the [`cached_network_images`](https://pub.dev/packages/cached_network_image) library you can work around this by injecting a custom `BaseCacheManager` in your `CachedNetworkImage` instance to display images in your golden test files. More detail on how to do this exactly can be found in [this article](https://medium.com/flutter-community/golden-testing-using-cachednetworkimage-1b488c653af3)
* At the moment, it is only possible to load a single .ttf file for a font family. This means it may not be possible to get the proper visuals to appear. For example, different font weights may not work.


