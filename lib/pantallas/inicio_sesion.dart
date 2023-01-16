import 'package:flutter/material.dart';
import 'package:logistica/pantallas/configuracion_inicial.dart';
import 'package:http/http.dart' as http;
//desde: almacenamiento
import './../almacenamiento/img_logo.dart';

class InicioSesion extends StatefulWidget {
  InicioSesion({super.key});

  @override
  State<InicioSesion> createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  TextEditingController url = TextEditingController();
  List urls = [];

  void _updateUrl() async {
    final data = await SQLOperations.getItems();
    setState(() {
      //print("data = ${data.length}");
      urls = data;
      print(urls);
    });
  }

  Widget imagenInicio() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return (urls.length == 0)
              ? const Image(image: AssetImage('assets/img.jpeg'))
              : Image(image: NetworkImage(urls[index]['url']));
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateUrl();
    print(':::: NUMBER OF ITEMS ON urlImage TABLE ${urls.length}');
  }

  Future<void> _addItem(url) async {
    await SQLOperations.createItem(url);
    _updateUrl();
    print('number of marcas: ${urls.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Prsesiona la imagen para cambiar'),
            //imagenInicio(),
            GestureDetector(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Ingrese URL'),
                  content: TextField(
                    controller: url,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _addItem(url.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => InicioSesion()));
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: imagenInicio(),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const TextField(
              decoration: InputDecoration(label: Text('Ingrese su correo')),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  label: Text('Ingrese su contraseña'),
                  suffixIcon: Icon(Icons.visibility)),
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(_inicio());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: const Center(
                    child: Text(
                  'Acceder',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _inicio() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          ConfiguracionInical(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /* Widget gerT(urls) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Text(urls[index]['url;']);
        },
      ),
    );
  } */
}
