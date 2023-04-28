import 'package:exam24/screen/apicalling/model/apimodel.dart';
import 'package:exam24/screen/apicalling/provider/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<apiprovider>(context,listen: false).apicall();
  }

  apiprovider? tpro;
  apiprovider? fpro;

  @override
  Widget build(BuildContext context) {
    tpro = Provider.of<apiprovider>(context, listen: true);
    fpro = Provider.of<apiprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Corona"),centerTitle: true),
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
              else if(snapshot.hasData) {
                Apimodel? a1 = snapshot.data ;
                return ListView.builder(itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Contry ${a1!.countriesStat![index].countryName}",style: TextStyle(color: Colors.cyanAccent)),
                      SizedBox(height: 10,),
                      Text("test=======${a1!.countriesStat![index].totalTests}"),
                      SizedBox(height: 10,),
                      Text("total death====${a1!.countriesStat![index].deaths}",),
                      SizedBox(height: 10,),
                      Text("Recovered===${a1!.countriesStat![index].totalRecovered}"),
                      SizedBox(height: 10,),
                      Text("active case ======${a1!.countriesStat![index].activeCases}",),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                }, itemCount: a1!.countriesStat!.length,);
              }

              return CircularProgressIndicator();
            },
            future: fpro!.apicall(),
          ),
        ),
      ),
    );
  }
}
