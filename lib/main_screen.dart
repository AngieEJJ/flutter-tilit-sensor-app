import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;
    return Scaffold(
        body: Stack(children: [
      StreamBuilder<AccelerometerEvent>(
          //AccelerometerEvent를 받는다.
          stream:
              accelerometerEventStream(), //stream data를 넣는 곳. -> 가속도계의 이벤트 값이 여기로 들어옴.
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // !을 붙여 데이터가 없을 경우
              return const Center(child: CircularProgressIndicator());
            }

            // 데이터가 잘 들어오는지 찍어보기
            final event = snapshot.data!; // if 문으로 한번 걸렀기 때문에 분명히 데이터가 있으므로 !
            List<double> accelerometerValues = [event.x, event.y];
            print(accelerometerValues);

            return Positioned(
              left: centerX,
              top: centerY,
              // 컨테이너 위치가 계속 바뀌는게 목표이기 때문에, stream으로 여러 값을 전달해야한다. -> positioned를 감싸기.
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  width: 100,
                  height: 100),
            );
          }),
    ]));
  }
}
