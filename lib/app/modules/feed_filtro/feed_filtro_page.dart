import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';

class FeedFiltroPage extends StatefulWidget {
  final String title;
  const FeedFiltroPage({Key key, this.title = "FeedFiltro"}) : super(key: key);

  @override
  _FeedFiltroPageState createState() => _FeedFiltroPageState();
}

class _FeedFiltroPageState extends State<FeedFiltroPage> {
  SignUpCompanyController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        // title: Text(titulo),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: controller.categorias.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/cartaz2.jpg'),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${controller.categorias[index]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
