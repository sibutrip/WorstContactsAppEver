# Worst Contacts App Ever 

## Activity Description
You are a junior developer working on an app to store a user's contacts. Unfortunately, the developer before you was not very intentional about designing with accessibility. Without changing the functionality of the app, implement the given user stories.

## Learning Objectives
* I can implement Accessibility features
* I can use the accessibility inspector in xcode
* I can structure an app localization using xcode
* I can understand and complete user stories

## User Stories (Tasks)
Implement these user stories, starting with the ones that are highest priority for your app.

### Dynamic Type
**As a user I want the text font size to scale dynamically according to my iPhone's system settings.**

> [!NOTE]
> Acceptance Criteria
> * Text changes size based on the user's system text size.

### Photos Scale with Dynamic Type
**As a user with Dynamic Text Size enabled, I would like the profile pictures in each ContactCardView to scale with the text size.**

> [!NOTE]
> Acceptance Criteria
> * Profile picture in ContactCardView scales to user's preferred text size.

> [!TIP]
> Declare a property in your ContentView with the ScaledMetric property wrapper:
> https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-scaledmetric-property-wrapper

### Text does not truncate or wrap with large dynamic type sizes
**As a user, I want the text to scale according to my Dynamic Type setting without the text truncating or wrapping at large sizes.**

> [!NOTE]
> Acceptance Criteria
> * when the sizeCategory is set to .accessibilityExtraExtraExtraLarge I should be able to read the names  without text wrapping weirdly or truncating

### Dark Mode
**As a Dark Mode user, I want a Dark Mode that provides a comfortable viewing experience tailored for low-light environments.**

> [!NOTE]
> Acceptance Criteria
> * The background color set (called BackgroundColor in the assets folder) provides a unique light and dark mode experience while maintaining its  color hue.
> * Foreground and background contrast ratio meets the HIG's criteria.

### Increase Contrast Mode
**As a user I want the Increase Contrast system setting to increase the contrast between visual elements like text, glyphs, and controls.**

> [!NOTE]
> Acceptance Criteria
> * Increase Contrast setting provides greater contrast between foreground and background colors than the system default setting.

### Smart Invert support
**As a user with Smart Invert enabled, I want photos to not invert color.**

> [!NOTE]
> Acceptance Criteria
> * Photos do not invert color when Smart Invert is enabled. Everything else should invert color normally.

> [!TIP]
> Smart Invert behavior is not reliable on the Simulator. Run the app on your phone to test this functionality.

### VoiceOver support
**As a user who uses VoiceOver, I want clear and understandable element labels.**

> [!NOTE]
> Acceptance Criteria
> * Voice over labels clearly describe what buttons are selected.
> * Voice over navigation is smooth and intuitive.

> [!TIP]
> Using Voiceover
> * Tap on item to read OR swipe to go to next/previous item
> * Double tap screen to select / open a contact
> https://support.apple.com/guide/iphone/turn-on-and-practice-voiceover-iph3e2e415f/ios

### Localization - Date Format
**As a user in Spain, I would like the dates in the app to be represented in my preferred date format.**

> [!NOTE]
> Acceptance Criteria
> * "Last contacted on" field displays a date format localized to the user's current region.

> [!TIP]
> Test this by changing the  region in the Simulator to Spain in Settings > General > Language & Region

### Localization - Translated Interface
**As a Spanish speaker, I would like the text to be translated to my preferred language.**

> [!NOTE]
> Acceptance Criteria
> * "Contacts" title, and "Last Contacted on" field translate to Spanish when the user is in a Spanish-speaking country.

> [!TIP]
> https://developer.apple.com/documentation/xcode/adding-support-for-languages-and-regions

### Reduce Motion
**As a user with sensitivity to motion, I would like animations be less intense when Reduce Motion is enabled.**

> [!NOTE]
> Acceptance Criteria
> * ContactCardView animation is less intense when Reduce Motion is enabled.

> [!TIP]
> Declare a property in your ContentView with the Environment property wrapper. Use the keypath `\.accessibilityReduceMotion`. Pass this argument into your ContactCardView to change the parameters of its animation.

### Limited Motor Control
**As a user with limited motor control, I want the app to natively support deleting a contact without using the swipe gesture.**

> [!NOTE]
> Acceptance Criteria
> * I can tap an "edit" button in the toolbar that displays delete buttons on the Contacts List. 

### Bonus: Color Redesign
**As a user, I want the app to use the system dark/light mode background while still using the blue colorset in the app.**

> [!NOTE]
> Acceptance Criteria
> * The app uses the system light/dark mode background but still has the color used within the app.
> * Color contrast ratios meet the HIG's criteria

## Guiding Resources
* Accessibility: https://developer.apple.com/accessibility/
* Localization: https://developer.apple.com/localization/
* Localizing your project: https://developer.apple.com/documentation/xcode/adding-support-for-languages-and-regions
* Dark mode: https://developer.apple.com/design/human-interface-guidelines/foundations/dark-mode/
* Color: https://developer.apple.com/design/human-interface-guidelines/foundations/color/
* Color and Effects: https://developer.apple.com/design/human-interface-guidelines/foundations/accessibility/#color-and-effects
* Motion: https://developer.apple.com/design/human-interface-guidelines/foundations/motion
* Icons: https://developer.apple.com/design/human-interface-guidelines/foundations/icons
