class UserProgress {
  final double progress;

  UserProgress({required this.progress});

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      progress: (json['progress'] ?? 0.0).toDouble(),
    );
  }
}
