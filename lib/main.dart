import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bloc_provider.dart';
import 'package:instagram_clone/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/my_app.dart';
import 'package:instagram_clone/presentation/pages/auth/intro_screen.dart';
import 'package:instagram_clone/presentation/pages/home/home_screen.dart';

void main() => runApp(BlocProviderInit().init());
