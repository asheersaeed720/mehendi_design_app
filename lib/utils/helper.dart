String generateUniqueId() {
  return '${DateTime.now().microsecondsSinceEpoch.remainder(100000)}';
}
