extension NumberFormatter on num {
  String formatToUnits() {
    if (this >= 1000000000) {
      return 'B${(this / 1000000000).toStringAsFixed(1)}';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return 'K${(this / 1000).toStringAsFixed(1)}';
    } else {
      return this.toStringAsFixed(0);
    }
  }
}
