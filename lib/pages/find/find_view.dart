import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_controller.dart';
import 'package:jen_music/utils/jen_utils.dart';
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
                  ))
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
}
