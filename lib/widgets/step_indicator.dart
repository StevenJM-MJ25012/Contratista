import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> labels;

  const StepIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: List.generate(
          totalSteps,
          (index) => Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index <= currentStep
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                  ),
                  child: Center(
                    child: index < currentStep
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: index <= currentStep
                                  ? Colors.white
                                  : Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: index <= currentStep
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: index <= currentStep
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
