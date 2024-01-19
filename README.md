# Flutter-Bloc
Flutter Project in which i use many BLoC methods and options

Some tips:
BlocProvider.of<myBloc>(context, listen: false).myBlocMethod();
context.read<myBloc>().myBlocMethod();

This 2 are forms for getting the instance of the bloc and setting a method or adding an enven

while

blocInstance = BlocProvider.of<myBloc>(context);
blocInstance = context.watch<myBloc>();

Are the ways in which me can Instance variable bloc for it to show in a Widget

Adding a MultiBlocProvider to the Material App, will give the bloc in the provider to all the apps.
If you want to give bloc to specific Screens in the routes file, give them with the Injection Container and BlocProvider.value