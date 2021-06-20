import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jen_music/pages/user/user_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return _buildLoginView(context);
  }

  ///展示我的歌单
  Widget _buildLoginView(context) {
    // TODO Obx
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SmartRefresher(
        controller: controller.refreshController,
        header: WaterDropMaterialHeader(
          color: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: InkWell(
                          child: Row(
                            children: [
                              Hero(
                                tag: 'avatar',

                                /// TODO card obx
                                child: Card(
                                  margin: EdgeInsets.all(0),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 65,
                                    width: 65,
                                    imageUrl:
                                        'https://p1.music.126.net/KldAVxVBSIc9mYGAh-PjcQ==/18711488883234736.jpg?param=180y180',
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              80.0)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text('请先登录'),
                                  subtitle: Text('未登录'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  const IconData(0xec9f,
                                      fontFamily: 'iconfont'),
                                  size: 24.0,
                                  color: Colors.red.withOpacity(.8),
                                ),
                                onPressed: () {},
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  '电台',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  icon: Icon(
                                      const IconData(0xe62a,
                                          fontFamily: 'iconfont'),
                                      size: 24.0,
                                      color: Colors.red.withOpacity(.8)),
                                  onPressed: () {}),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  '云盘',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  icon: Icon(
                                      const IconData(0xe72f,
                                          fontFamily: 'iconfont'),
                                      size: 26.0,
                                      color: Colors.red.withOpacity(.8)),
                                  onPressed: () {}),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Text('本地',
                                    style: TextStyle(fontSize: 12.0)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  icon: Icon(
                                      const IconData(0xe619,
                                          fontFamily: 'iconfont'),
                                      size: 27.0,
                                      color: Colors.red.withOpacity(.8)),
                                  onPressed: () {}),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  '记录',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
            ),
            // SliverFixedExtentList(
            //   delegate: SliverChildBuilderDelegate(),
            //   itemExtent: 60.0,
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '我创建的',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.add), onPressed: () => {}),
                        IconButton(
                            icon: Icon(Icons.more_vert), onPressed: () => {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            controller.isNoCreate.value
                ? SliverToBoxAdapter(
                    child: Container(
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Wrap(
                            children: [
                              Icon(Icons.sentiment_neutral_outlined),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0)),
                              Text('暂无收藏歌单')
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverFixedExtentList(
                    itemExtent: 60.0,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return _buildUserSheetItem();
                    }, childCount: 3),
                  ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "我收藏的",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
            controller.isNoCreate.value
                ? SliverToBoxAdapter(
                    child: Container(
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Wrap(
                            children: [
                              Icon(Icons.sentiment_neutral_outlined),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0)),
                              Text('暂无收藏歌单')
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverFixedExtentList(
                    itemExtent: 60.0,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return _buildUserSheetItem();
                    }, childCount: 3),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserSheetItem() {
    return InkWell(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 2),
              child: Card(
                child: CachedNetworkImage(
                  width: 42,
                  height: 42,
                  imageUrl:
                      'http://p4.music.126.net/ENB8JqAjS4VhiVKFRMuA4A==/109951166080662923.jpg?param=100y100',
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: Text('我的最爱',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0)),
                ),
                Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: Text('10首',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14.0, color: Colors.grey[500])),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
