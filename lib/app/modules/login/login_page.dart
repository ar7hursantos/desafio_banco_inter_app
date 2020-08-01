import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/util/theme_util.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  LinearGradient linearGradient = LinearGradient(
    colors: [
      const Color(0xFF356C83),
      const Color(0xFF012D46),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {
    ThemeUtil.init(context);

    return Scaffold(
      body: _buildPage(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: ScreenUtil.screenWidth,
      height: 274.h,
      //color: Color(0xFF012D46),
      decoration: BoxDecoration(
        gradient: linearGradient,
      ),
      child: Center(
        child: Image.asset(
          'assets/images/inter_logo.png',
          height: 68.h,
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    var userInfo = Container(
      width: ScreenUtil.screenWidth,
      child: ListTile(
        isThreeLine: false,
        onTap: () {},
        title: Text(
          'Operador',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        subtitle: Text("********"),
        trailing: Container(
          height: 50.h,
          child: FlatButton(
            child: Text(
              'TROCAR',
              style: TextStyle(color: Colors.grey[800], fontSize: 23.sp),
            ),
            //color: Color(0xFFF5F7FB),
            textColor: Colors.white,
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[300],
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        leading: Container(
          width: 95.w,
          height: 95.w,
          decoration: BoxDecoration(
            color: Color(0xFFD1D5E4),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'RA',
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          ),
        ),
      ),
    );

    var loginButton = Container(
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 150.w),
      child: FlatButton(
        child: Text('ENTRAR'),
        //color: Color(0xFF012D46),
        textColor: Colors.white,
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 29.h),
      ),
    );

    return Container(
      width: ScreenUtil.screenWidth,
      height: 290.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color(0XFFEFF2F6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          userInfo,
          loginButton,
        ],
      ),
    );
  }

  Widget _buildSecondCard() {
    var iSafe = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/shield.png',
          height: 82.h,
          color: Colors.grey[600],
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'i-safe',
          style: TextStyle(
              fontSize: 58.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600),
        ),
      ],
    );

    var circleImageAndText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 90.w,
          height: 106.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Text(
            '....',
            style: TextStyle(color: Colors.orange, fontSize: 65.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Gerar',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );

    return Container(
      width: ScreenUtil.screenWidth,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color(0XFFEFF2F6),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            iSafe,
            circleImageAndText,
          ],
        ),
      ),
    );
  }

  Widget _buildCards() {
    return Container(
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.only(top: 203.h, left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMainCard(),
          SizedBox(height: 30.h),
          _buildSecondCard(),
        ],
      ),
    );
  }

  Widget _buildContactText() {
    var contactText = '''Em caso de dúvidas entre em contato.
    Capitais e região metropolitana: 3003-4070
    Demais localidades: 0800 940 0007''';

    return Container(
      margin: EdgeInsets.only(top: 254.h),
      width: ScreenUtil.screenWidth,
      child: Text(
        contactText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.sp, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildPage() {
    return Stack(
      children: <Widget>[
        _buildHeader(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildCards(),
            _buildContactText(),
          ],
        ),
      ],
    );
  }
}
