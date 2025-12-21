import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:project_moneyTracker_kel2/common/color_extension.dart';
import 'package:project_moneyTracker_kel2/common_widget/subscription_cell.dart';

import '../../common/theme_manager.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();
  late DateTime selectedDateNotAppBBar;

  Random random = Random();

  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png", "price": "15.00"}
  ];

  @override
  void initState() {
    super.initState();
    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

        return ValueListenableBuilder<bool>(
        valueListenable: themeNotifier,
        builder: (context, isDarkMode, child) {
                    var bgColor = isDarkMode ? TColor.gray : Colors.white;
          var textColor = isDarkMode ? TColor.white : TColor.gray;
          var subTextColor = isDarkMode ? TColor.gray30 : TColor.gray50;

                    var headerBgColor = isDarkMode
              ? TColor.gray70.withOpacity(0.5)
              : TColor.gray10.withOpacity(0.5);

                    var calendarBgColor =
              Colors.transparent; 
                    var dateColor = isDarkMode ? TColor.white : TColor.gray;
          var selectedDateColor = isDarkMode
              ? TColor.white
              : TColor.white; 
                    var dateBoxColor = isDarkMode
              ? TColor.gray60.withOpacity(0.2)
              : Colors.white.withOpacity(0.5); 
                    var selectedDateBoxColor = isDarkMode
              ? TColor.gray60               : TColor.gray; 
                    var monthBoxColor =
              isDarkMode ? TColor.gray60.withOpacity(0.2) : Colors.white;
          var monthTextColor = isDarkMode ? TColor.white : TColor.gray;

                    var eventDotColor = isDarkMode ? TColor.gray30 : TColor.gray50;
          var selectedEventDotColor = TColor.white; 
          return Scaffold(
            backgroundColor: bgColor,             body: SingleChildScrollView(
              child: Column(
                children: [
                                    Container(
                    decoration: BoxDecoration(
                        color: headerBgColor,                         borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Kalender",
                                          style: TextStyle(
                                              color: subTextColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Jadwal\nLangganan",
                                  style: TextStyle(
                                      color: textColor,                                       fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 langganan hari ini",
                                      style: TextStyle(
                                          color: subTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),

                                                                        InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        calendarAgendaControllerNotAppBar
                                            .openCalender();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                TColor.border.withOpacity(0.1),
                                          ),
                                          color:
                                              monthBoxColor,                                           borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Januari",
                                              style: TextStyle(
                                                  color: monthTextColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Icon(
                                              Icons.expand_more,
                                              color: monthTextColor,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                                                    CalendarAgenda(
                            controller: calendarAgendaControllerNotAppBar,
                            backgroundColor: Colors.transparent,
                            fullCalendarBackgroundColor:
                                isDarkMode ? TColor.gray80 : Colors.white,
                            locale: 'id',
                            weekDay: WeekDay.short,
                            fullCalendarDay: WeekDay.short,

                                                        selectedDateColor: selectedDateColor,
                            dateColor: dateColor,

                            initialDate: DateTime.now(),
                            calendarEventColor:
                                eventDotColor, 
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 140)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 140)),

                            events: List.generate(
                                100,
                                (index) => DateTime.now().subtract(
                                    Duration(days: index * random.nextInt(5)))),

                            onDateSelected: (date) {
                              setState(() {
                                selectedDateNotAppBBar = date;
                              });
                            },

                                                        decoration: BoxDecoration(
                              border: Border.all(
                                color: TColor.border.withOpacity(0.15),
                              ),
                              color: dateBoxColor,
                              borderRadius: BorderRadius.circular(12),
                            ),

                                                        selectDecoration: BoxDecoration(
                              border: Border.all(
                                color: TColor.border.withOpacity(0.15),
                              ),
                              color:
                                  selectedDateBoxColor,                               borderRadius: BorderRadius.circular(12),
                            ),

                                                        selectedEventLogo: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: selectedEventDotColor,                                 borderRadius: BorderRadius.circular(3),
                              ),
                            ),

                                                        eventLogo: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: eventDotColor,                                 borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                                    Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Januari",
                              style: TextStyle(
                                  color: textColor,                                   fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp24.98",
                              style: TextStyle(
                                  color: textColor,                                   fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "08.01.2023",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "dalam tagihan mendatang",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1),
                      itemCount: subArr.length,
                      itemBuilder: (context, index) {
                        var sObj = subArr[index] as Map? ?? {};

                        return SubScriptionCell(
                          sObj: sObj,
                          onPressed: () {},
                        );
                      }),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
