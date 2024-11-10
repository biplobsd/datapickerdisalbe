# datapickerdisalbe

Show only months that are in the first date and last date range and other months disabled.

For this behavior we can simple write a function to first determined is that month in the range then we can just pass this function to the `selectableMonthPredicate`argument

```dart
bool isMonthInRange(DateTime startDate, DateTime endDate, int month) {
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('startDate should be before endDate');
    }
    int startMonth = startDate.month;
    int endMonth = endDate.month;

    if (startDate.year == endDate.year) {
      return month >= startMonth && month <= endMonth;
    } else {
      return month >= startMonth || month <= endMonth;
    }
  }
```

Passing the `isMonthInRange` function to `selectableMonthPredicate`

```dart
 selectableMonthPredicate: (year, month) =>
            isMonthInRange(firstDate, lastDate, month),
```

![image](https://github.com/user-attachments/assets/515eb32a-3a99-4151-9c28-f26287bf439f)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
