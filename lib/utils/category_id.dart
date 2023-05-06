class CategoryId {
  static int getID(String category) {
    switch (category) {
      case 'General':
        return 9;
      case 'Animal':
        return 27;
      case 'Art':
        return 25;
      case 'Book':
        return 10;
      case 'Celebrity':
        return 26;
      case 'Comic':
        return 29;
      case 'Computer':
        return 18;
      case 'Geography':
        return 22;
      case 'History':
        return 23;
      case 'Movie':
        return 11;
      case 'Music':
        return 12;
      case 'Sport':
        return 21;
      case 'Video Game':
        return 15;
      default:
        return 0;
    }
  }
}
