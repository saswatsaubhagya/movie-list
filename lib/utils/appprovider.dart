import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/movies.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => Movies(),
  ),
];
