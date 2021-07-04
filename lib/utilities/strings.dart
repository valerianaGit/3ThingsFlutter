class Strings {
//MARK: - Named Routes
  static const String homePage = "/";
  static const String gratitudePage = "/gratitude";
  static const String fearPage = "/fear";
  static const String groundingPage = "/grounding";
  static const String calendarPage = "/calendar";
  static const String calendarDayPage = "/calendarDay";
  static const String gratitudePastEntriesPage = "/gratitudePastEntries";
  static const String fearPastEntriesPage = "/fearPastEntries";

  // routes to interchangeable widgets in the same screen
  static const String routeToGratitudePastEntries =
      "/routeToGratitudePastEntries";
  static const String routeToFearPastEntries = "/routeToFearPastEntries";

  // MARK: - Database names
  static const String calendarDayDataBase = "calendarDay";
  static const String fearDataBase = "fear";
  static const String gratitudeDataBase = "gratitude";
  static const String groundDataBase = "ground";

  //MARK: - Database columns
  // common column names
  static const String idColumn = "id";
  static const String dateColumn = "date";
  // Calendar day table
  static const String gratitudeArrayColum = "gratitude_array";
  static const String fearArrayColumn = "fear_array";
  static const String groundColumn = "ground_bool";
}
