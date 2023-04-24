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
        body: Center(
          child: FutureBuilder(
            future: fpro!.apicall(),
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
              else if(snapshot.hasData)
              {
                Apimodel? a1 = snapshot.data as Apimodel?;
                return ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height:400,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${a1!.countriesStat![index].countryName}",),
                        Text("${a1!.countriesStat![index].activeCases}",),
                        Text("${a1!.countriesStat![index].deaths}",),
                        Text("${a1!.countriesStat![index].totalRecovered}"),
                        Text("${a1!.countriesStat![index].totalRecovered}"),
                      ],
                    ),
                  );
                },itemCount: a1!.countriesStat!.length,);
              }
              return CircularProgressIndicator();
            },

          ),
        ),
      ),
    );
  }
}
