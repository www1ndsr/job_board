import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  Color _getBadgeColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    switch (status.toLowerCase()) {
      case 'интервью':
        return Colors.green.shade600;
      case 'просмотрен':
        return scheme.primary;
      case 'отправлен':
        return Colors.orange.shade700;
      case 'отказ':
        return scheme.error;
      default:
        return scheme.outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getBadgeColor(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}