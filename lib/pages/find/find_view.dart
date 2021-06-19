import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_controller.dart';
import 'package:jen_music/utils/jen_utils.dart';
import 'package:jen_music/widget/preload_page_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindView extends GetView<FindController> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return ScrollConfiguration(
          // TODO: 需要替换
          behavior: ScrollBehavior(),
          child: OrientationBuilder(builder: (context, orientation) {
            return SmartRefresher(
              header: WaterDropMaterialHeader(
                color: Theme.of(context).accentColor,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              controller: controller.refreshController,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _today()),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  const IconData(
                                    0xe607,
                                    fontFamily: 'iconfont',
                                  ),
                                  size: 30.0,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                                onPressed: () {}),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                'FM',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  const IconData(0xe680,
                                      fontFamily: 'iconfont'),
                                  size: 26.0,
                                  color: Colors.red.withOpacity(.8),
                                ),
                                onPressed: () {}),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                '歌单',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  const IconData(0xe684,
                                      fontFamily: 'iconfont'),
                                  size: 24.0,
                                  color: Colors.red.withOpacity(.8),
                                ),
                                onPressed: () {}),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                '排行',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  const IconData(0xe61f,
                                      fontFamily: 'iconfont'),
                                  size: 26.0,
                                  color: Colors.red.withOpacity(.8),
                                ),
                                onPressed: () {}),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                '歌手',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Text(
                        "推荐歌单",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Visibility(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),

                              /// TODO: 准备替换Obx
                              child: DotsIndicator(
                                dotsCount: 2,
                                position: controller.currentIndexPage.value
                                    .toDouble(),
                                decorator: DotsDecorator(
                                    size: const Size.square(6.0),
                                    activeSize: const Size(12.0, 6.0),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    color: Colors.grey[500],
                                    // Inactive color
                                    activeColor:
                                        Theme.of(Get.context).accentColor),
                              )),
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text('更多',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12.0)),
                                  Icon(Icons.keyboard_arrow_right,
                                      size: 18.0, color: Colors.grey[500])
                                ],
                              ),
                            ),
                            onTap: () => {},
                          )
                        ],
                      ),
                    ),
                    visible: orientation == Orientation.portrait,
                  )),
                  SliverToBoxAdapter(
                      child: orientation == Orientation.portrait
                          ? Container(
                              height: 180,
                              child: PreloadPageView.builder(
                                controller: controller.pageController,
                                itemBuilder: (context, index) {
                                  /// TODO 准备替换obx
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemExtent: (MediaQuery.of(Get.context)
                                            .size
                                            .width) /
                                        3,

                                    ///  TODO controller.sheet.length
                                    itemCount: 3,
                                    itemBuilder: (context, index1) {
                                      return _sheetItem(
                                          orientation: orientation);
                                    },
                                  );
                                },
                                itemCount: 2,
                              ),
                            )
                          : Container(
                              height: 180.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0.0),
                                itemBuilder: (context, index) {
                                  return _sheetItem(orientation: orientation);
                                },
                              ))),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Text(
                        "新歌推荐",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0.0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _newSongItem(index);
                      },
                      itemExtent: 110.0,
                      itemCount: 20,
                    ),
                  )
                ],
              ),
            );
          }));
    });
  }

  Widget _today() {
    return Hero(
        tag: 'today',
        child: Card(
          child: Column(
            children: [
              InkWell(
                  child: Row(
                children: [
                  Container(
                    child: Image.asset('assets/images/today.png'),
                    padding: EdgeInsets.all(5.0),
                    height: 120.0,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: const Text(
                          '每日推荐',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        height: 120,
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            Text(
                              JenUtil.dateToString(DateTime.now(), 2),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Theme.of(Get.context).accentColor),
                            ),
                            Text(
                              JenUtil.dateToString(DateTime.now(), 1),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Theme.of(Get.context).accentColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ))
            ],
          ),
        ));
  }

// http://p3.music.126.net/P4BySxDoTuWlOPQbLvcaMQ==/109951166099769706.jpg
  Widget _sheetItem({Orientation orientation}) {
    return Container(
      width: orientation == Orientation.portrait
          ? (MediaQuery.of(Get.context).size.width - 10) * 3
          : (MediaQuery.of(Get.context).size.width - 10) * 6,
      alignment: Alignment.center,
      child: Card(
        child: InkWell(
          child: Container(
            width: 120,
            height: 170,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Hero(
                    tag: 'P4BySxDoTuWlOPQbLvcaMQ',
                    child: CachedNetworkImage(
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://p3.music.126.net/P4BySxDoTuWlOPQbLvcaMQ==/109951166099769706.jpg',
                    )),
                Container(
                  height: 45.0,
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: 110.0),
                  child: Text("当你烦恼是",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _newSongItem(index) {
    return InkWell(
      child: Container(
        height: 110,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 6.0),
              height: 100.0,
              width: 110.0,
              child: Card(
                child: CachedNetworkImage(
                  height: 100.0,
                  width: 110.0,
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://p2.music.126.net/EAC2X_nM8l0t9onQMkAfeQ==/109951166004498861.jpg?param=300y300',
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    height: 38,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '米津玄师专辑',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text('米津玄师',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[500])),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text("时长：20",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[500])),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
