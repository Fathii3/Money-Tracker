**Calendar agenda widget with a lot of customizable styles.**

<p align="left">
<a href="https:<a href="https:</p>

# Getting Started

1. Depend on it
Add it to your package's pubspec.yaml file
```yaml
dependencies:
  flutter:
    sdk: flutter
  calendar_agenda: version
```
2. Install it
Install packages from the command line
```sh
flutter pub get
```
3. Import it
Import it to your project
```dart
import 'package:calendar_agenda/calendar_agenda.dart';
```

 SelectedDayPosition.center         |  SelectedDayPosition.Left      | SelectedDayPosition.Right
:-------------------------:|:-------------------------:|:-------------------------:
![](https:
 FullCalendarScroll.vertical         |  FullCalendarScroll.horizontal
:-------------------------:|:-------------------------:
![](https:

### Demo

![](https:
# How to use?

Use the **CalendarAgenda** Widget
```dart
CalendarAgenda(
initialDate: DateTime.now(),
firstDate: DateTime.now().subtract(Duration(days: 140)),
lastDate: DateTime.now().add(Duration(days: 4)),
onDateSelected: (date) {
print(date);
},
)
```

# Props

| Props  | Types  | Required  | defaultValues  |
| ------------ | ------------ | ------------ |  ------------ |
| initialDate  | DateTime  | True  | |
| firstDate  |  DateTime | True  | |
| lastDate  | DateTime  | True  | |
| onDateSelected  | Funtion  | False  | |
| backgroundColor  | Color?  | False  | |
| selectedDayLogo  | ImageProvider\<Object>?  | False  | |
| controller  | CalendarAgendaController?  | False  | |
| selectedDateColor  | Color?  | False  | Colors.black |
| dateColor  | Color?  | False  | Colors.white |
| calendarBackground  | Color?  | False  |Colors.white |
| calendarEventSelectedColor  | Color?  | False  | Colors.white |
| calendarEventColor  | Color?  | False  | Colors.blue |
| locale  | String?  | False  | 'en' |
| leading  | Widget?  | False  | |
| appbar  | bool  | False  | False |
| events  | List\<DateTime>?  | False  | |
| fullCalendar  | bool  | False  | True |
| fullCalendarScroll  | FullCalendarScroll  | False  |FullCalendarScroll.vertical |
| fullCalendarDay  | WeekDay  | False  | WeekDay.short |
| weekDay  | WeekDay  | False  | WeekDay.short |
| selectedDayPosition  | SelectedDayPosition  | False  | SelectedDayPosition.left |

---



## Thank you
Special thanks goes to all contributors to this package. Make sure to check them out.<br />

<a href="https:  <img src="https:</a>


## Donate
You like the package ? Buy me a coffee :)


<a href="https:    <img src="https:</a>
  
<a href="https:    <img src="https:</a>
  