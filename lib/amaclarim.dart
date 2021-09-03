import 'package:flutter/material.dart';

class Amac extends StatelessWidget {
  const Amac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.amber,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Amaçlarım"),
              centerTitle: true,
              background:
                  Image.asset("assets/images/kopek3.png", fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                    "Emin olun, biz insanlar olarak kimi zaman onlar kadar paylaşımcı olamıyoruz. Sokaktaki hayvanlar küçük bir kap yemeğin etrafında toplanarak beslenebilirler çünkü onlar açlığın ne olduğunu en iyi bilenlerdir.Hepimizin bildiği üzere kış aylarında sokak hayvanları için besin bulmak oldukça zorlaşır. Herkes sokak hayvanlarının bir şekilde yiyecek bulduğunu zannetmektedir ya da böyle düşünerek içlerini rahatlatmaktadır fakat durumun bununla yakından uzaktan alakası yoktur.Aileleri tarafından hastalıklı hayvanlara dokunmaması yönünde uyarılan çocuklar hastalık kapabileceklerini düşünerek hayvanlardan uzak durmaya çalışırlar. Oysa hayvanlardaki çoğu hastalık insanlara bulaşmamaktadır. Tam tersi hasta bir canlı ile karşılaşıldığında yardım edilmelidir. Sokak hayvanları hiçbir sebep yokken insanlara saldırmazlar. Genellikle hayvanların heyecanlı hareketleri insanlar tarafından yanlış algılanır ve saldırganlık zannedilebilir. Oysa çoğu zaman sokaktaki dostlarımız sadece biraz sevgi ve ilgi görmek istemektedir. Herkesin yapabileceği birkaç ufak yardım, sokak hayvanlarının ölüm ile yaşam arasındaki konumunu değiştirmeye yeterli olabilir. Bu yardım faaliyeti sayesinde diğer canlılarla vakit geçirerek hem kendinizi hem de onları mutlu edebilirsiniz.Bize emanet olan hayvan dostlarımız için kapımızın önüne bir kap yemek ve su koymayı unutmayalım.Aslında sokaktaki zor yaşam koşullarında onların yaşam mücadelelerine yardımcı olmak, açlık ve susuzluk gibi zor durumlardan elimizden geldiği kadar onları kurtarmak, onları bir nefes olmak en büyük amacımız.",
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
