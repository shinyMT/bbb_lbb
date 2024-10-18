import 'package:bbb_lbb/pages/home/cook/add.dart';
import 'package:bbb_lbb/utils/com_ui_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _categoryAddController = TextEditingController();
  var addedList = []; // 购物车中添加的元素

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _categoryAddController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('私家厨房'),
        actions: _buildActions(),
        bottom: TabBar(
          controller: _tabController,
          tabs: _buildTabList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildContent("荤菜"),
          _buildContent("素菜"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("点击了购物车");
          _buildCarDrawer();
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  /// 构建购物车列表内容
  Widget _buildCarDrawer() {
    List<Widget> content = [];
    content.add(const Text("已加"));
    for (var item in addedList) {
      content.add(
        ListTile(
          title: Text(item["name"].toString()),
        ),
      );
    }
    return SizedBox(
      height: 300,
      child: Column(
        children: content,
      ),
    );
  }

  /// 构建appBar的操作按钮
  List<Widget> _buildActions() {
    return [
      PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 0,
              child: Text('添加分类'),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text('添加菜品'),
            ),
          ];
        },
        onSelected: (val) {
          if (val == 0) {
            _showAddCategoryDialog();
          } else {
            Get.to(() => const CookAddPage());
          }
        },
      )
    ];
  }

  /// 构建顶部菜单分类
  List<Widget> _buildTabList() {
    // TODO: 获取分类列表
    return [
      const Tab(
        text: '荤',
      ),
      const Tab(
        text: '素',
      )
    ];
  }

  /// 构建分类菜单对应的内容
  Widget _buildContent(txt) {
    var testList = txt == '荤菜'
        ? [
            {
              "name": "beaf",
              "material": ["item1", "item2"],
              "img":
                  "https://tse4-mm.cn.bing.net/th/id/OIP-C.UWoTYY9KEUNMYlnldYqufwHaHa?w=217&h=217&c=7&r=0&o=5&pid=1.7",
              "count": 0
            },
            {
              "name": "pork",
              "material": ["item3"],
              "img":
                  "https://tse2-mm.cn.bing.net/th/id/OIP-C.-2xCP_6kc--wQU5zHMAcygHaHP?w=202&h=198&c=7&r=0&o=5&pid=1.7",
              "count": 0
            },
          ]
        : [];
    return Container(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: testList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = testList[index];
          return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 150,
                          height: 100,
                          child: Image.network(
                            item["img"].toString(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(item["name"].toString()),
                          subtitle: item["material"] != null
                              ? ComUiUtil.buildTagList(
                                  list: item["material"] as List<String>)
                              : const Text(""),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    right: 50,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          item['count']--;
                          addedList.remove(item);
                        });
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 45,
                    child: Center(
                      child: Text(
                        "${item['count']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          item['count']++;
                          addedList.add(item);
                          print(item['count']);
                        });
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  /// 构建添加菜单分类弹窗
  Future<void> _showAddCategoryDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加菜单分类'),
          content: TextField(
            controller: _categoryAddController,
            decoration: const InputDecoration(hintText: '请输入菜单分类名称'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('确认'),
              onPressed: () {
                /// TODO: 缺少接口添加分类
                Get.back();
              },
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "取消",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
