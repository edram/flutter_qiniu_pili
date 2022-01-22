import 'package:flutter/material.dart';
import 'package:flutter_qiniu_pili_example/components/douyin_player.dart';

void main() {
  runApp(const MyApp());
}

var urls = [
  "https://shortvideo.jingmaiwang.com/Fs0_aniHj4S56yXpXbY_FUbJIYCl",
  "https://shortvideo.jingmaiwang.com/FqysKx_FFSnSTBGRPo6tRtpr5Vr0",
  "https://shortvideo.jingmaiwang.com/Fvh-okusDy5SHCScECfXxYkVBWWd",
  "https://img.jingmaiwang.com/edram/tt1.mp4",
  "https://shortvideo.jingmaiwang.com/Fil0O_krWvxRtdbMZ11U7kIG8Ufb",
  "https://shortvideo.jingmaiwang.com/FsfjHPU3S489-ot9DanyT9YOX-Pn",
  "https://shortvideo.jingmaiwang.com/FlVJcv3oOZxqnhrd0eHmSMGpk9-p",
  "https://shortvideo.jingmaiwang.com/FhMNqYy61THIwV9BMmeoCWWhD76D",
  "https://video.jingmaiwang.com/305849_20210129204731.mp4",
  "https://video.jingmaiwang.com/34350_20210130102205.mp4",
  "https://video.jingmaiwang.com/34350_20210130103806.mp4",
  "https://shortvideo.jingmaiwang.com/FnYLEHneExBTygaJ8YUUiBjXNK61",
  "https://shortvideo.jingmaiwang.com/FlQZmEtz66okOLeDOWgXsoI5ul90",
  "https://shortvideo.jingmaiwang.com/FsJ8jxBbXZ8xuPJSalTRUww3E1HS",
  "https://shortvideo.jingmaiwang.com/FqTsV3yDJDDgCy4IyEBd-Kn5ySIN",
  "https://video.jingmaiwang.com/34319_20210130183840.mov",
  "https://video.jingmaiwang.com/40329_20210130190038.mov",
  "https://video.jingmaiwang.com/85753_20210130193341.mp4",
  "https://video.jingmaiwang.com/80832_20210130194148.mp4",
  "https://video.jingmaiwang.com/98501_20210130194307.mp4",
  "https://video.jingmaiwang.com/94555_20210130200002.mp4",
  "https://video.jingmaiwang.com/80832_20210130201006.mp4",
  "https://video.jingmaiwang.com/94555_20210130201349.mp4",
  "https://shortvideo.jingmaiwang.com/FgtNoonjhpijObbXFtvgPgrX3jCQ",
  "https://video.jingmaiwang.com/306213_20210130202141.mp4",
  "https://video.jingmaiwang.com/306213_20210130202440.mp4",
  "https://video.jingmaiwang.com/65750_20210130202716.mp4",
  "https://video.jingmaiwang.com/65750_20210130202736.mp4",
  "https://shortvideo.jingmaiwang.com/FiK7Bce88-dr3f6CCYpM80AwVLew",
  "https://shortvideo.jingmaiwang.com/Flvl3RbCjYTG0oU-xuwBZwp8fq2w",
  "https://video.jingmaiwang.com/84653_20210130212412.mp4",
  "https://video.jingmaiwang.com/76972_20210130213035.mp4",
  "https://video.jingmaiwang.com/76972_20210130213849.mp4",
  "https://video.jingmaiwang.com/22903_20210130214217.mov",
  "https://video.jingmaiwang.com/90065_20210130215343.mp4",
  "https://video.jingmaiwang.com/64932_20210130230147.mov",
  "https://video.jingmaiwang.com/52073_20210130232718.mov",
  "https://video.jingmaiwang.com/52073_20210131002402.mov",
  "https://video.jingmaiwang.com/45942_20210131004658.mp4",
  "https://video.jingmaiwang.com/22903_20210131061518.mov",
  "https://video.jingmaiwang.com/26260_20210131070119.mp4",
  "https://video.jingmaiwang.com/34862_20210131081037.mp4",
  "https://video.jingmaiwang.com/22593_20210131085439.mp4",
  "https://video.jingmaiwang.com/22593_20210131090313.mp4",
  "https://video.jingmaiwang.com/25267_20210131091917.mp4",
  "https://video.jingmaiwang.com/25267_20210131092248.mp4",
  "https://video.jingmaiwang.com/10399_20210131094914.mov",
  "https://video.jingmaiwang.com/306213_20210131100102.mp4",
  "https://video.jingmaiwang.com/31735_20210131102423.mov",
  "https://video.jingmaiwang.com/31735_20210131102522.mov",
  "https://video.jingmaiwang.com/30587_20210131165914.mov",
  "https://video.jingmaiwang.com/37994_20210131173038.mp4",
  "https://video.jingmaiwang.com/33285_20210131211035.mp4",
  "https://video.jingmaiwang.com/82934_20210201020548.mp4",
  "https://video.jingmaiwang.com/82934_20210201021010.mp4",
  "https://video.jingmaiwang.com/82934_20210201021818.mp4",
  "https://video.jingmaiwang.com/45470_20210201022851.mp4",
  "https://video.jingmaiwang.com/45470_20210201023107.mp4",
  "https://video.jingmaiwang.com/45470_20210201023424.mp4",
  "https://video.jingmaiwang.com/45470_20210201023556.mp4",
  "https://video.jingmaiwang.com/45470_20210201023635.mp4",
  "https://video.jingmaiwang.com/45470_20210201023705.mp4",
  "https://video.jingmaiwang.com/7474_20210201070802.mp4",
  "https://video.jingmaiwang.com/7474_20210201071202.mp4",
  "https://video.jingmaiwang.com/25257_20210201075000.mp4",
  "https://video.jingmaiwang.com/86712_20210201090821.mov",
  "https://video.jingmaiwang.com/86712_20210201091722.mov",
  "https://video.jingmaiwang.com/45470_20210201093352.mp4",
  "https://video.jingmaiwang.com/94555_20210201093605.mp4",
  "https://video.jingmaiwang.com/69555_20210201102116.mp4",
  "https://video.jingmaiwang.com/24542_20210201162247.mp4",
  "https://video.jingmaiwang.com/29572_20210201185040.mp4",
  "https://video.jingmaiwang.com/67695_20210202024504.mov",
  "https://video.jingmaiwang.com/67695_20210202024747.mov",
  "https://video.jingmaiwang.com/67695_20210202025155.mov",
  "https://video.jingmaiwang.com/104078_20210202111527.mp4",
  "https://video.jingmaiwang.com/69069_20210202114013.mp4",
  "https://video.jingmaiwang.com/61935_20210202144203.mp4",
  "https://video.jingmaiwang.com/smallvideo/326180_20210202200839.mp4",
  "https://video.jingmaiwang.com/smallvideo/326180_20210202201055.mp4",
  "https://video.jingmaiwang.com/smallvideo/67695_20210203104228.mov",
  "https://shortvideo.jingmaiwang.com/FnH2UXnkr42iyUs1YxgYBsxEI_Ht",
  "https://shortvideo.jingmaiwang.com/FtXpaLmwK-7KcZ-f1O7glcGDd-hl",
  "https://shortvideo.jingmaiwang.com/FjKnHiDjnUJYi4jtDr0J-ZM-lBZx",
  "https://shortvideo.jingmaiwang.com/Fg0eM9PWVHi879glq9O5R6qdhhbv",
  "https://video.jingmaiwang.com/smallvideo/69555_20210203182645.mp4",
  "https://shortvideo.jingmaiwang.com/FvCCwrXnTJ9CRsR4pAWNt4w2gXd9",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204083402.mp4",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204084341.mp4",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204084630.mp4",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204084918.mp4",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204085032.mp4",
  "https://video.jingmaiwang.com/smallvideo/16347_20210204085139.mp4",
  "https://video.jingmaiwang.com/smallvideo/30587_20210204112433.mov",
  "https://video.jingmaiwang.com/smallvideo/306500_20210204123239.mov",
  "https://video.jingmaiwang.com/smallvideo/34350_20210205161643.mp4",
  "https://shortvideo.jingmaiwang.com/Fi4bxuYfqLkrQ0fS2DwZ77Ec_WiH",
  "https://video.jingmaiwang.com/smallvideo/326180_20210205194534.mp4",
  "https://video.jingmaiwang.com/smallvideo/104078_20210206164259.mp4",
  "https://video.jingmaiwang.com/smallvideo/77524_20210206203033.mp4",
  "https://shortvideo.jingmaiwang.com/FqoedYm4FDNDLYYIBaHy8H-fCoLH",
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllers = urls.map((url) => DouyinPlayerController(url)).toList();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var controller = controllers[index];
            return Column(
              children: [
                Expanded(
                  child: DouyinPlayer(
                    controller: controller,
                  ),
                ),
              ],
            );
          },
          itemCount: urls.length,
          onPageChanged: (int position) {
            var controller = controllers[position];

            controller.play();
          },
        ),
      ),
    );
  }
}
