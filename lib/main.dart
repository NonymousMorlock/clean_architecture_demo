import 'package:clean_architecture_demo/demo.dart';
import 'package:clean_architecture_demo/step_content.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const StepperExampleApp());

class StepperExampleApp extends StatefulWidget {
  const StepperExampleApp({super.key});

  @override
  State<StepperExampleApp> createState() => _StepperExampleAppState();
}

class _StepperExampleAppState extends State<StepperExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const StepperExample(),
                  ),
                );
              },
              child: Lottie.asset('assets/lottie/layers.json'),
            ),
          ),
        );
      }),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < 9) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: const [
            Step(
              title: Text('Step 1: DOMAIN - Entities'),
              content: StepContent(
                text:
                    'Entities represent the core data models of the application.\n'
                    'They define the structure and properties of the data.\n'
                    'Create an entity to be passed around in the application.',
                lottie: 'entities_blueprint',
              ),
            ),
            Step(
              title: Text('Step 2: DOMAIN - Repositories'),
              content: StepContent(
                text:
                    'Repositories define the contract between the data layer and domain layer.\n'
                    'Create a repository to specify the methods for data operations.\n'
                    'They handle data operations and follow the DIP principle.',
                lottie: 'contract',
              ),
            ),
            Step(
              title: Text('Step 3: DOMAIN - Usecases'),
              content: StepContent(
                text:
                    'Usecases represent the business logic of the application.\n'
                    'They depend on the repository and call its methods to perform data operations.\n'
                    'Usecases enforce the SRP principle and focus on specific functionalities.',
                lottie: 'usecases',
              ),
            ),
            // Data
            Step(
              title: Text('Step 4: DATA - Models'),
              content: StepContent(
                text:
                    'Models are subclasses of the entities and handle data serialization.\n'
                    'They transform data between entities and data sources.\n'
                    'Models help to achieve the OCP principle.',
                lottie: 'sculpt',
              ),
            ),
            Step(
              title: Text('Step 5: DATA - Repositories'),
              content: StepContent(
                text:
                    'Repositories have the implementation of the repository contract defined in the domain layer.\n'
                    'They interact with data sources to retrieve data.\n'
                    'Repository implementations allow switching data sources without modifying the domain layer.',
                lottie: 'construction_repository_data',
              ),
            ),
            Step(
              title: Text('Step 6: DATA - DataSources'),
              content: StepContent(
                text:
                    'Data sources provide the actual data from external sources (e.g., APIs, databases).\n'
                    'They implement the repository interfaces defined in the domain layer.\n'
                    'Data sources promote modularity and adhere to the DIP principle.',
                lottie: 'data_sources_aliens',
              ),
            ),
            // Presentation
            Step(
              title: Text('Step 7: PRESENTATION - Bloc/Cubit'),
              content: StepContent.demo(
                text:
                    'Bloc/Cubit manages the state of the UI and business logic.\n'
                    'It depends on usecases to execute business operations.\n'
                    'Bloc/Cubit emits states to the UI, decoupling it from business logic.',
                lottie: 'bloc',
              ),
            ),
            Step(
              title: Text('Step 8: PRESENTATION - Views'),
              content: StepContent(
                text:
                    'Views are responsible for displaying UI components and listening to bloc/cubit states.\n'
                    'They react to state changes and update the UI accordingly.\n'
                    'Views promote the SRP principle by separating presentation logic from business logic.',
                lottie: 'views',
                height: 400,
                width: 200,
              ),
            ),
            Step(
              title: Text('Step 9: TDD - Test-Driven Development'),
              content: StepContent(
                text:
                    'TDD involves writing tests before implementing the actual code.\n'
                    'Each layer and module can be tested independently.\n'
                    'TDD helps in achieving better code quality and fewer bugs.',
                lottie: 'testing',
              ),
            ),
            Step(
              title: Text('Step 10: Dependency Injection'),
              content: StepContent(
                text:
                    'Dependency Injection is used to provide dependencies to different layers of the app.\n'
                    'It helps in managing the dependencies and allows easy swapping of implementations.\n'
                    'For example, GetIt can be used for dependency injection.',
                lottie: 'injection',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Demo'),
        icon: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const App()),
          );
        },
      ),
    );
  }
}
