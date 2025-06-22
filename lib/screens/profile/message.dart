import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Sample messages
    final messages = List.generate(
      6,
      (index) => {
        'title': 'پیام شماره ${index + 1}',
        'subtitle': 'قرعه‌کشی برای دریافت جایزه',
        'time': '${index + 10}:${index}0',
        'isRead': index > 2, // Some read, some unread
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('پیام‌ها'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final isRead = msg['isRead'] as bool;

          return Dismissible(
            key: Key('message_$index'),
            background: Container(
              color: colorScheme.error,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.delete,
                color: colorScheme.onError,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // Handle message deletion
            },
            child: InkWell(
              onTap: () {
                // Handle message tap
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isRead
                      ? theme.cardColor
                      : colorScheme.primary.withOpacity(0.05),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.dividerColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Read status indicator
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(top: 4, left: 4),
                      decoration: BoxDecoration(
                        color:
                            isRead ? Colors.transparent : colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Message icon
                    Icon(
                      Icons.message,
                      color: isRead ? theme.disabledColor : colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                    // Message content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            msg['title']!.toString(),
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight:
                                  isRead ? FontWeight.normal : FontWeight.bold,
                              color: isRead
                                  ? textTheme.bodyLarge?.color?.withOpacity(0.8)
                                  : textTheme.bodyLarge?.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['subtitle']!.toString(),
                            style: textTheme.bodyMedium?.copyWith(
                              color: isRead
                                  ? theme.hintColor
                                  : textTheme.bodyMedium?.color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Time and status
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          msg['time']!.toString(),
                          style: textTheme.bodySmall?.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
