# Blueprint: Urba y Flow

## Overview

This project is a Flutter application for an urban clothing store called "Urba y Flow". The application showcases products in a modern and visually appealing interface, inspired by current e-commerce trends. It is designed to be responsive and easily adaptable for both mobile and web platforms.

## Style, Design, and Features

### Version 1.0 (Current)

*   **Modern & Bold Aesthetics:** The UI uses a combination of gradients, shadows, and strong typography to create a contemporary look and feel.
*   **Custom Typography:**
    *   Integrated `google_fonts` to use "Bebas Neue" for titles and headlines, and "Montserrat" for body text.
    *   Centralized font styles in the `ThemeData` for consistency across the app.
*   **Color Palette:** A cohesive color scheme has been defined in `ThemeData`:
    *   **Primary:** Deep blue (`#002B80`)
    *   **Secondary:** Bright blue (`#0059B3`)
    *   **Background:** Light blue gradient (`#E6F0FF` to `#B3D1FF`)
*   **Layout & Components:**
    *   **Persistent Header (`SliverAppBar`):** The header, featuring the brand name and logo, remains visible at the top as the user scrolls.
    *   **Hero Section:** A prominent promotional section with a gradient background to attract user attention.
    *   **Product Grid:** Products are displayed in a responsive `GridView` that adapts to different screen sizes.
    *   **Product Cards:** Each product is presented in a card with a clean design, including an image, name, price, and an optional discounted price.
*   **Code Structure:**
    *   **Centralized Theme:** All colors, fonts, and component styles are defined in the `MaterialApp`'s `ThemeData`, making the app's look and feel easy to manage.
    *   **Widget-based Architecture:** The UI is broken down into reusable widgets (`_buildAppBar`, `_buildHeroSection`, `_buildProductCard`, etc.) for better organization and maintainability.
    *   **Correct Flutter Structure:** The application now has a valid entry point (`main()`), a root widget (`MyApp`), and uses `MaterialApp` to manage routing and theme.

## Current Plan: Code Correction and Refactoring

This iteration focused on fixing critical architectural issues and improving the overall code quality.

### Steps Completed:

1.  **Added `google_fonts`:** The `google_fonts` package was added to the `pubspec.yaml` to easily use custom fonts.
2.  **Created `main()` Entry Point:** Implemented the standard `void main() => runApp(const MyApp());` to make the app runnable.
3.  **Implemented `MaterialApp`:** Wrapped the application in a `MaterialApp` widget, which is essential for any Flutter app using Material Design.
4.  **Centralized Theming:** Created a global `ThemeData` to define all colors and text styles. This replaces the inline styling previously used in each widget, making the code much cleaner and easier to maintain.
5.  **Refactored Widgets:** Modified existing widgets to use the centralized theme (`Theme.of(context).textTheme...`) instead of hardcoded `TextStyle` properties.
6.  **Improved Image Loading:** Added a `loadingBuilder` and `errorBuilder` to the `Image.network` widgets to provide a better user experience while images are loading or if they fail to load.
7.  **Replaced Placeholders:** Updated the placeholder image URLs with new ones that are guaranteed to be available.
