import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Text showText(
    {required String label, required double size, required Color color}) {
  return Text(
    label,
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}

Widget textfieldeditor(
    {required TextEditingController controller,
    required InputDecoration decoration,
    TextInputType? keyboardType}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(25))
    ),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding:const EdgeInsets.symmetric(horizontal: 15),  
    child: TextFormField( 
      keyboardType: keyboardType,
      style: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
      controller: controller,
      decoration: decoration,
    ),
  );
}

class Primarybutton extends StatefulWidget {
  final double size;
  final double fontsize;
  final Widget? icon;
  final Color colors;
  final double? height;
  final String label;
  final void Function()? onpressed;
  const Primarybutton({
    super.key,
    this.height = 45,
    this.onpressed,
    required this.size,
    this.icon,
    required this.colors,
    required this.label,
    required this.fontsize,
  });

  @override
  State<Primarybutton> createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: widget.size,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), 
            color: widget.colors,
          ),
          child: MaterialButton(
            onPressed: widget.onpressed,
            shape: const OvalBorder(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon ?? const SizedBox(),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.fontsize,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordcontroller;
  PasswordTextField({
    super.key,
    required this.passwordcontroller,
  });

  bool obscuretext = true;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
        obscureText: widget.obscuretext,
        controller: widget.passwordcontroller,
        decoration: InputDecoration(
          // ink well to switch the visiblity to true and false
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  widget.obscuretext = !widget.obscuretext;
                });
              },
              child: widget.obscuretext == false
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.visibility_off)),
          labelText: "Password",
          labelStyle: const TextStyle(
              color: Color.fromARGB(151, 43, 43, 43), fontSize: 20),
        ),
      ),
    );
  }
}
class SplineChartgraph extends StatelessWidget {
  final double percentagerate;
final  String label;

  const SplineChartgraph({super.key, required this.percentagerate, required this.label});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label, style: const TextStyle(
                    color:  Color.fromARGB(255, 255, 255, 255),
                    fontSize:18  ,
                  ),), 

          LinearPercentIndicator(
            width: 260.0, 
            lineHeight: 40.0,
            percent: percentagerate /100,
            
            barRadius: const Radius.circular(30),
            center:  Text("$percentagerate %",style: TextStyle(color: Colors.white),),
            animation: true,
         
            backgroundColor: Color.fromARGB(255, 46, 46, 46),
            progressColor: Color.fromARGB(255, 8, 110, 194),
            
           
          ),
        ],
      ),
    );
  }
}
