import 'package:clean_architecture_demo/step_content.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clean Architecture Login')),
      body: const Center(
        child: Demo(),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _stepIndex = 0;
  String _response = '';

  void _loginButtonPressed() {
    // Simulate login process here and go to the next step
    _goToNextStep();
  }

  void _blocContinueButtonPressed() {
    // Simulate bloc processing and go to the next step
    _goToNextStep();
  }

  void _usecaseContinueButtonPressed() {
    // Simulate usecase processing and go to the next step
    _goToNextStep();
  }

  void _repositoryContinueButtonPressed() {
    // Simulate repository processing and go to the next step
    _goToNextStep();
  }

  void _datasourceContinueButtonPressed() {
    // Simulate data source processing and go to the next step
    _goToNextStep();
  }

  void _sendRequestButtonPressed() {
    // Simulate sending a request to the server and go to the next step
    _goToNextStep();
  }

  void _serverResponseButtonPressed() {
    // Simulate server response and go to the next step (back to data source)
    _goToNextStep();
  }

  void _goToNextStep() {
    setState(() {
      _stepIndex = (_stepIndex + 1) % 10; // Total number of steps (0 to 8)
    });
  }

  void _goToPreviousStep() {
    setState(() {
      _stepIndex = (_stepIndex - 1) % 10; // Total number of steps (0 to 8)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepIndex,
      onStepCancel: _goToPreviousStep,
      controlsBuilder: (context, details) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: details.onStepContinue,
              child: Text(_stepIndex == 0 ? 'Login' : 'Continue'),
            ),
            TextButton(
              onPressed: details.onStepCancel,
              child: const Text('Back'),
            ),
          ],
        );
      },
      onStepContinue: () {
        debugPrint('Step index: $_stepIndex');
        if (_stepIndex == 0) {
          _loginButtonPressed();
        } else if (_stepIndex == 3) {
          _blocContinueButtonPressed();
        } else if (_stepIndex == 5) {
          _usecaseContinueButtonPressed();
        } else if (_stepIndex == 6) {
          _repositoryContinueButtonPressed();
        } else if (_stepIndex == 7) {
          _datasourceContinueButtonPressed();
        } else if (_stepIndex == 8) {
          _sendRequestButtonPressed();
        } else if (_stepIndex == 4) {
          _serverResponseButtonPressed();
        } else {
          _goToNextStep();
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _stepIndex = index;
        });
      },
      steps: const [
        Step(
          title: Text('Step 1: User Interaction'),
          content: StepContent.demo(
            text: 'When the user clicks "Login," it triggers the next step.',
            lottie: 'login',
          ),
        ),
        Step(
          title: Text('Step 2: BLOC - Business Logic'),
          content: StepContent.demo(
            text: 'The BLOC (Business Logic Component) handles the login '
                'process.\n'
                'When the user logs in, the BLOC continues to the next step.',
            lottie: 'bloc',
          ),
        ),
        Step(
          title: Text('Step 3: Usecases - Business Logic'),
          content: StepContent.demo(
            text: 'Usecases will hand over the login process to the '
                'repositories.\n',
            lottie: 'usecase_handover', // You can change 'login' to the
            // appropriate lottie animation for this step
          ),
        ),
        Step(
          title: Text('Step 4: Repositories - Data Operations'),
          content: StepContent.demo(
            text:
                'Repositories define the contract between data and domain layers.\n'
                'They will make a call to the data source.'
                'The repository will be the implementation of our contract or '
                'interface',
            lottie:
                'repo_processing', // You can change 'login' to the appropriate
            // lottie
            // animation for this step
          ),
        ),
        Step(
          title: Text('Step 5: DataSources - Data Retrieval'),
          content: StepContent.demo(
            text: 'DataSources provide actual data from external sources.\n'
                'They interact with repositories and continue to the next step.',
            lottie: 'datasource', // You can change 'login' to the appropriate
            // lottie animation for this step
          ),
        ),
        Step(
          title: Text('Step 6: DataSources - Server Response'),
          content: StepContent.demo(
            text: 'Server responded. (Emulation)',
            lottie:
                'server_response', // You can change 'login' to the appropriate
            // lottie animation for this step
          ),
        ),
        Step(
          title: Text('Step 7: Repositories - Data Return'),
          content: StepContent.demo(
            text: 'Data source sends the response back to the repository.',
            lottie:
                'receive', // You can change 'login' to the appropriate lottie
            // animation for this step
          ),
        ),
        Step(
          title: Text('Step 8: Usecases - Business Logic'),
          content: StepContent.demo(
            text: 'Usecase handles the server response.',
            lottie:
                'receive', // You can change 'login' to the appropriate lottie animation for this step
          ),
        ),
        Step(
          title: Text('Step 9: BLOC - Business Logic'),
          content: StepContent.demo(
            text: 'BLOC handles the final response from the usecase.',
            lottie:
                'receive', // You can change 'login' to the appropriate lottie animation for this step
          ),
        ),
        Step(
          title: Text('Step 10: View - User Result'),
          content: StepContent.demo(
            text: 'The view receives the final result from the BLOC. '
                'The login process is complete.',
            lottie: 'user_view', // You can change 'login' to the appropriate
            // lottie animation for this step
          ),
        ),
      ],
    );
  }
}
