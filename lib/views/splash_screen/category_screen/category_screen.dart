import 'package:get/get.dart';
import 'package:tathagatmart/consts/consts.dart';
import 'package:tathagatmart/consts/list.dart';
import 'package:tathagatmart/controllers/product_controller.dart';
import 'package:tathagatmart/views/splash_screen/category_screen/category_details.dart';
import 'package:tathagatmart/widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(categoryImage[index],
                        height: 120, width: 200, fit: BoxFit.cover),
                    10.heightBox,
                    categoriesList[index]
                        .text
                        .color(darkFontGrey)
                        .align(TextAlign.center)
                        .make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadowSm
                    .make()
                    .onTap(() {
                  controller.getSubCategories(categoriesList[index]);
                  Get.to(() => CategoryDetails(title: categoriesList[index]));
                });
              }),
        ),
      ),
    );
  }
}
