
<h1 align="center" style="font-size:28px; line-height:1"><b>Cashew</b></h1>

<a href="https://utar-pay.web.app/">
  <div align="center">
    <img alt="Icon" src="promotional/icons/icon.png" width="150px">
  </div>
</a>

<br />

<div align="center">
  <a href="https://apps.apple.com/us/app/cashew-expense-budget-tracker/id6463662930">
    <img alt="iOS App Store Badge" src="promotional/store-banners/app-store-badge.png" height="60px">
  </a>
  <a href="https://play.google.com/store/apps/details?id=com.jingjietan.utarpay">
    <img alt="Google Play Badge" src="promotional/store-banners/google-play-badge.png" height="60px">
  </a>
  <a href="https://github.com/jameskokoska/Cashew/releases/">
    <img alt="GitHub Badge" src="promotional/store-banners/github-badge.png" height="60px">
  </a>
  <a href="https://budget-track.web.app/">
    <img alt="PWA Badge" src="promotional/store-banners/pwa-badge.png" height="60px">
  </a>
</div>

<br />

<a href="https://utar-pay.web.app/">
  <div align="center">
    <img width="95%" src="promotional/GitHub/SocialPreviewGitHub.png" alt="Promo banner">
  </div>
</a>

<br />

---

Cashew is a full-fledged, feature-rich application designed to empower users in managing their finances effectively. Built using Flutter - with Drift's SQL package, and Firebase - this app offers a seamless and intuitive user experience across various devices. Development started in September 2021.

---

## Feature
Cashew was featured on [YouTube](https://www.youtube.com/watch?v=2MwWmqcn--s&t=261s)!
Thanks [Sam Beckman](https://www.youtube.com/@sambeckman)!

<a href="https://www.youtube.com/watch?v=2MwWmqcn--s&t=261s">
  <div align="center">
    <img width="80%" src="promotional/youtube-promo/thumbnail.png" alt="Review Video">
  </div>
</a>

## Release
Check out the [official website](https://utar-pay.web.app/)!


This application is available on the [App Store](https://apps.apple.com/us/app/cashew-expense-budget-tracker/id6463662930), [Google Play](https://play.google.com/store/apps/details?id=com.jingjietan.utarpay), [GitHub](https://github.com/jameskokoska/Cashew/releases/) and as a [Web App (PWA)](https://budget-track.web.app/).

### Changelog

Changes and progress about development is all heavily documented in GitHub [commits](https://github.com/jameskokoska/Cashew/commits/main) and in the [changelog](https://github.com/jameskokoska/Cashew/blob/main/budget/lib/widgets/showChangelog.dart)

## Key Features

### 💸 Budget Management
- Custom Budgets and Time Periods: Set up personalized budgets with flexible time periods, such as monthly, weekly, daily, or any custom time period that suits your financial planning needs. A custom time period is useful if you plan on setting a one-time travel budget!
- Added Budgets: Selectively add transactions to specific budgets, allowing you to focus on specific expense categories.
- Category Spending Limits per Budget: Set limits for each category within a budget, ensuring responsible spending.
- Past Budget History Viewing: Analyze your spending habits over time by accessing past budget history, enabling comparison and tracking of financial progress.
- Goals: Create spending and saving goals and put transactions towards different purchases or savings. Track your progress towards achieving your financial goals.

### 💰 Transaction Management
- Support for Different Transaction Types: Categorize transactions effectively based on types such as upcoming, subscription, repeating, debts (borrowed), and credit (lent). Each type behaves in certain ways in the interface. Pay your upcoming transactions when you're ready, or mark your lent out transactions as collected.
- Custom Categories: Create personalized categories to organize transactions according to your unique spending habits. Search through multiple icons and select the default option as expenses or income when adding transactions.
- Custom Titles: Automatically assign transactions with the same name to specific categories, saving time and ensuring consistency. These titles are stored in memory and popup when you add another transaction with a similar name.
- Search and Filters: Easily search and filter transactions based on various criteria such as date, category, amount, or custom tags, enabling quick access to information.
- Easy Editing: Long-press and swipe to select multiple budgets, edit accordingly as needed or delete multiple at once.

### 💱 Financial Flexibility
- Multiple Currencies and Accounts: Manage finances across different currencies and accounts with up-to-date conversion rates for accurate calculations and effortless currency conversions. The interface shows the original amount added and the converted amount to the selected account.
- Switch Accounts and Currencies with Ease: On the homepage, easily select a different account and currency and everything will be converted automatically in an instant.

### 🔒 Enhanced Security and Accessibility
- Biometric Lock: Secure budget data using biometric authentication, adding an extra layer of privacy.
- Google Login: Conveniently log in to the app using your Google account, ensuring a streamlined and hassle-free authentication process.

### 🎨 User Experience and Design
- Material You Design: Enjoy a visually appealing and modern interface, following the principles of Material You design for a delightful user experience.
- Custom Accent Color: Personalize the app by selecting a custom accent color that suits your style, or follow that of the system.
- Light and Dark Mode: Seamlessly switch between light and dark themes to optimize visibility and reduce eye strain.
- Customizable Home Screen: Tailor the home screen layout and widgets to display the financial information that matters most to you, providing a personalized and efficient dashboard.
- Detailed Graph Visuals: Gain valuable insights into spending patterns through detailed and interactive graphs, visualizing financial data at a glance.
- Beautiful Adaptive UI: A responsive user interface that adapts flawlessly to both web and mobile platforms, providing an immersive and consistent user experience across devices.

### ☁ Backup and Syncing
- Cross-Device Sync: Keep budget data synchronized across all devices, ensuring access to financial information wherever you go.
- Google Drive Backup: Safeguard budget data by utilizing Google Drive's backup functionality, allowing easy restoration of data if needed.
- ~~Discontinued: Budget Sharing (Alpha): Collaborate with family members, friends, or colleagues by sharing budgets, enabling collective tracking and management of shared expenses.~~

### 💿 Smart Automation
- Notifications: Stay informed about important financial events and receive timely reminders for budget goals, transactions, and upcoming due dates.
- Import CSV Files: Seamlessly import financial data by uploading CSV files, facilitating a smooth transition from other applications or platforms.
- Import Google Sheets: Seamlessly import Google Sheets tables, quickly importing many transactions from a spreadsheet.
- ~~Unsupported: Auto Email Transaction Parsing (Beta): Automatically parse transaction details from email receipts, making expense tracking effortless and efficient.~~


## Bundled Packages
This repository contains, bundled in, modified versions of the discontinued packages listed below. They can be found in the folder `/budget/packages`
* https://pub.dev/packages/implicitly_animated_reorderable_list
* https://pub.dev/packages/sliding_sheet

## Translations
The translations are available here: https://docs.google.com/spreadsheets/d/1QQqt28cmrby6JqxLm-oxUXCuM3alniLJ6IRhcPJDOtk/edit?usp=sharing. If you would like to help translate, please reach out on email: dapperappdeveloper@gmail.com

### To Update Translations
1. Run `budget\assets\translations\generate-translations.py`
2. Restart the application

## Developer Notes

### Android Release
* To build an app-bundle Android release, run `flutter build appbundle --release`

Note: required Android SDK.

### iOS Release
* To build an IPA iOS release, run `flutter build ipa`

Note: requires MacOS.

### Firebase Deployment
* To deploy to firebase, run `firebase deploy`

Note: required Firebase.

### GitHub release
* Create a tag for the current version specified in `pubspec.yaml`
* `git tag <version>`
* Push the tag
* `git push origin <version>`
* Create the release and upload binaries
* https://github.com/jameskokoska/Cashew/releases/new

### Scripts
`deploy_and_build_windows.bat`
* Deploy to Firebase and build the apk and appbundle

`open_release_builds.bat`
* Opens the location of the built apk and appbundle

`update_translations.bat`
* Downloads the latest version of Cashew translations. Runs `budget\assets\translations\generate-translations.py`

### Develop Wirelessly on Android
* `adb tcpip 5555`
* `adb connect <IP>`
* Get the phone's IP by going to `About Phone` > `Status Information` > `IP Address`

### Migrate Database
1. Make any database changes to the schema and tables
2. Bump the schema version
    * Change `int schemaVersionGlobal = ...+1` in `tables.dart`
3. Make sure you are in application root directory
    * `cd .\budget\`
4. Generate database code
    * Run `dart run build_runner build`
5. Export the new schema
    * Generate schema dump for the newly created schema
    * Replace `[schemaVersion]` in the command below with the value of `schemaVersionGlobal`
    * Run `dart run drift_dev schema dump lib\database\tables.dart drift_schemas//drift_schema_v[schemaVersion].json`
    * Read more: https://drift.simonbinder.eu/docs/advanced-features/migrations/#exporting-the-schema
6. Generate step-by-step migrations
    * Run `dart run drift_dev schema steps drift_schemas/ lib\database\schema_versions.dart`
7. Implement migration strategy 
    * Edit `await stepByStep(...)` function in `tables.dart` and add the migration strategy for the new version migration

### Get Platform
* Use `getPlatform()` from `functions.dart`
* Since `Platform` is not supported on web, we must create a wrapper and always use this to determine the current platform 

### Push Route
* If we want to navigate to a new page, stick to `pushRoute(context, page)` function from `functions.dart`
* It handles the platform routing and `PageRouteBuilder`

### Wallets vs. Accounts
* `Wallets` have been been renamed to `Accounts` on the front-end but internally, the name `Wallet` is still used.

### Objectives vs. Goals
* `Objectives` have been been renamed to `Goals` on the front-end but internally, the name `Objectives` is still used.
