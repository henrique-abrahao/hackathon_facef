import 'package:apphackathon/api.dart';
import 'package:apphackathon/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'home_prof_screen.dart';

class RegisterScreen extends StatefulWidget {

  final User user;

  RegisterScreen(this.user);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime data = DateTime.now();
  String dataString = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  Api api = Api();
  TextEditingController controllerTaf = TextEditingController();
  TextEditingController controllerAti = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(dataString);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Materia'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Expanded(
          flex: 2,
          child: CalendarCarousel(
            weekFormat: true,
            width: 340,
            onDayPressed: (DateTime date, List event) {
              setState(() {
                print('${date.year}-${date.month}-${date.day}');
                print(date);
                data = date;
              });
            },
            selectedDateTime: data,
            maxSelectedDate: DateTime.now(),
            weekDayFormat: WeekdayFormat.standaloneNarrow,
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                        controller: controllerAti,
                        maxLines: 3,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.8,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0.8),
                          ),
                          hintText: 'Atividade do dia',
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                    SizedBox(
                      height: 18,
                    ),
                    TextField(
                        controller: controllerTaf,
                        maxLines: 3,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.8,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0.8),
                          ),
                          hintText: 'Tarefas do dia',
                          hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                        )),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 58,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          api.searchAluno(idUser: widget.user.id, data: dataString, atividade: controllerAti.text, tarefa: controllerTaf.text );
                          if(api.error == 'salvei') Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfHomeScreen(user: widget.user,)));

                        },
                        child: Text(
                          'Salvar Atividades:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ])),
        )
      ]),
    );
  }
}
