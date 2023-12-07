import 'package:get/get.dart';

class CalenderController extends GetxController {
  RxList<EventModel> events = <EventModel>[].obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    // Load events here, for example, from an API or a database
    // Initialize events with some sample data
    events.addAll([
      EventModel(DateTime(2023, 12, 1), 'Booking 1'),
      EventModel(DateTime(2023, 12, 8), 'Booking 2'),
      EventModel(DateTime(2023, 12, 20), 'Booking 3'),
      EventModel(DateTime(2023, 12, 20), 'Booking 4'),
      EventModel(DateTime(2023, 12, 20), 'Booking 5'),
      EventModel(DateTime(2024, 01, 8), 'Booking 6'),
      EventModel(DateTime(2024, 01, 8), 'Booking 7'),

      // Add more events here
    ]);
  }
}

class EventModel {
  final DateTime date;
  final String eventName;

  EventModel(this.date, this.eventName);
}
