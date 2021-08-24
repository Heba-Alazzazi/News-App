import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/webView.dart';

Widget bulidArticalItem(artical, context) {
  // String check = checkImage('${artical['urlToImage']}');
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => webView(artical['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              // child: FadeInImage.assetNetwork(

              //     placeholder: "assets/images/news.webp",
              //     image: '${artical['urlToImage']}',
              //     ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                //   image: DecorationImage(
                //     image: NetworkImage(
                //       '${artical['urlToImage']}',
                //     ),
                //     fit: BoxFit.cover,
                //   ),
              ),
              child: CachedNetworkImage(
                imageUrl: '${artical['urlToImage']}',
                placeholder: (context, url) => new CircularProgressIndicator(),
                //errorWidget: (context, url, error) => new Icon(Icons.error),
                errorWidget: (context, url, error) =>
                    new Image(image: AssetImage("assets/images/news.webp")),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${artical['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    //style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  Text(
                    '${artical['publishedAt']}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// String checkImage(String check) {
//   // ignore: unnecessary_null_comparison
//   if (check == null) {
//     return 'https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.egyptianewspapers.com%2Fpages%2FNewspapers%2Fakhbarelyom.html&psig=AOvVaw0oj6zDKFZqi1lLUAUQ5TI2&ust=1628238046546000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLDl2se5mfICFQAAAAAdAAAAABAD';
//   } else {
//     return check;
//   }
// }

Widget DefaultTextField({
  required String label,
  required TextEditingController controller,
  required TextInputType type,
  required IconData icon,
  // required Function(String)? onSubmit,
  required Function(String)? onChange,
  required Function()? onTap,
  required String? Function(String?)? validate,
}) {
  return TextFormField(
    validator: validate,
    controller: controller,
    keyboardType: type,
    onChanged: onChange,
    // onFieldSubmitted: onSubmit,
    onTap: onTap,
    decoration: InputDecoration(
      fillColor: Colors.white,
      border: OutlineInputBorder(),
      labelText: label,
      prefixIcon: Icon(
        icon,
      ),
    ),
  );
}
