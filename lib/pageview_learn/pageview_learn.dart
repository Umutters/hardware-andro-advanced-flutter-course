import 'package:flutter/material.dart';

class Pageviewlearn extends StatefulWidget {
  const Pageviewlearn({super.key});

  @override
  State<Pageviewlearn> createState() => _PageviewlearnState();
}

class _PageviewlearnState extends State<Pageviewlearn> {
  final PageController _pageController = PageController(viewportFraction: 1);
  late bool isForward;
  // Her sayfa için bir FocusNode tutacak liste
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    // 5 sayfa olduğu için 5 tane FocusNode oluşturuyoruz
    _focusNodes = List.generate(5, (index) => FocusNode());
    isForward = true; // Başlangıçta ileri yön
  }

  @override
  void dispose() {
    // ÇOK ÖNEMLİ: Sayfa kapandığında tüm node'ları bellekten siliyoruz
    for (var node in _focusNodes) {
      node.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(bool isNext) {
    final int currentPage = _pageController.page?.round() ?? 0;
    if (isNext) {
      if (currentPage < _focusNodes.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
        _focusNodes[currentPage + 1].requestFocus();
      }
    } else {
      if (currentPage > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
        _focusNodes[currentPage - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Klavye açıkken boşluğa basınca kapansın isterseniz bunu ekleyin:
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PageView(
          controller: _pageController,
          children: _makeContainerList(), // Artık sınıfın içinde
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Customfba(
            pageController: _pageController,
            focusNodes: _focusNodes,
            heroTag: "btn1",
            onPressed: () => _changePage(false),
            icon: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 10),
          Customfba(
            pageController: _pageController,
            focusNodes: _focusNodes,
            heroTag: "btn2",
            icon: const Icon(Icons.chevron_right),
            onPressed: () => _changePage(true),
          ),
        ],
      ),
    );
  }

  // Fonksiyonu sınıf içine taşıdık
  List<Widget> _makeContainerList() {
    return [
      // Listeden ilgili indexteki node'u gönderiyoruz
      buildContainer(Colors.red, "Red", _focusNodes[0]),
      buildContainer(Colors.blue, "Blue", _focusNodes[1]),
      buildContainer(Colors.green, "Green", _focusNodes[2]),
      buildContainer(Colors.yellow, "Yellow", _focusNodes[3]),
      buildContainer(Colors.purple, "Purple", _focusNodes[4]),
    ];
  }

  Widget buildContainer(Color color, String text, FocusNode focusNode) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
        children: [
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 40)),
          CustomTextField(text: text, focusNode: focusNode),
        ],
      ),
    );
  }
}

class Customfba extends StatelessWidget {
  const Customfba({
    super.key,
    required PageController pageController,
    required List<FocusNode> focusNodes,
    required String heroTag,
    required Icon icon,
    this.onPressed,
  }) : _pageController = pageController,
       _focusNodes = focusNodes,
       _heroTag = heroTag,
       _icon = icon;
  final String _heroTag;
  final PageController _pageController;
  final List<FocusNode> _focusNodes;
  final Icon _icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: _heroTag, // Birden fazla FAB varsa heroTag zorunludur
      onPressed: onPressed,
      child: _icon,
    );
  }
}

// Class isimleri büyük harfle başlar (customTextField -> CustomTextField)
class CustomTextField extends StatelessWidget {
  final String text;
  final FocusNode focusNode;

  const CustomTextField({
    required this.text,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        // DÜZELTİLEN KISIM BURASI:
        focusNode: focusNode, // Dışarıdan gelen focusNode'u buraya bağladık
        decoration: InputDecoration(
          hintText: 'Enter $text text',
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
