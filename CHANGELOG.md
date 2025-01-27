## 0.0.1

### Initial Release
- Customizable width and height
- Fade Transition animation

## 0.0.2

### Added
- Initial implementation of `ChipNavigationBar` widget.
- `ChipNavigationBar` constructor with the following parameters:
  - `items`: List of `ChipNavigationBarItem`.
  - `currentIndex`: Index of the currently selected item.
  - `onTap`: Callback function when an item is tapped.
  - `backgroundColor`: Optional background color of the navigation bar.
  - `height`: Height of the navigation bar, default is 56.0.
  - `pageColors`: Optional list of colors for each page.
  - `width`: Optional width of the navigation bar.

## 1.0.0

## Added

- Customizable Animation:

  - Added `animationDuration` to control the duration of animations.

  - Added `animationCurve` to customize the animation curve.

- Customizable Shadow:
  - Added `selectedItemShadow` to allow customization of the shadow for the selected item.

- Haptic Feedback:

  - Added `enableHapticFeedback` to provide tactile feedback when an item is tapped.

- RTL Support:

  - Added `isRTL` to support right-to-left layouts.

- Customizable Item Padding:

  - Added `itemPadding` to adjust the padding around each item.

- Customizable Border Radius:

  - Added `borderRadius` to customize the border radius of the navigation bar.

  - Added `selectedItemBorderRadius` to customize the border radius of the selected item.

- Customizable Icon and Label Sizes:

  - Added `iconSize` to control the size of icons.

  - Added `labelFontSize` to control the size of labels.

- Background Gradient:

  - Added `backgroundGradient` to apply a gradient background to the navigation bar.

- Customizable Item Spacing:

  - Added `itemSpacing` to control the space between items.

- Customizable Label Font Weight:

  - Added `labelFontWeight` to customize the font weight of labels.

- Customizable Label Padding:

  - Added `labelPadding` to adjust the space between the icon and label.

- Customizable Item Alignment:

  - Added `itemAlignment` to control the alignment of items within the navigation bar.

- Customizable Active and Inactive Colors:

  - Added `inactiveIconColor` to customize the color of inactive icons.

  - Added `activeIconColor` to customize the color of active icons.

  - Added `activeLabelColor` to customize the color of active labels.


## Updated

- Improved documentation and example usage in the `README.md` file.