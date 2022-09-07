import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //add const pois construtor está const
}

/*O widget STATELESS nao muda de estado
           STATEFULL muda de estado
            */
//Widget Responsável pelas configurações
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //Reaproveitando um widget
  @override //sobrescrever
  Widget build(BuildContext context) {
    //Faz a construção do objeto e permite HOTRELOAD
    //Sempre é chamado
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int count = 0; //Estado da tela
  bool get isEmpty => count == 0; //Getter que depende do estado
  bool get isFull => count == 20;
  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/restaurante.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull
                  ? 'Lotado'
                  : (isEmpty ? 'Não há clientes' : 'Pode entrar!'),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.25) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.25) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
