// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraPage extends StatefulWidget {
//   const CameraPage({super.key});

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   CameraController? controller;

//   Future<void> initializeCamera()async{
//     var camera = await availableCameras();
//     controller = CameraController(camera[0], ResolutionPreset.medium);
//     await controller!.initialize();
//   }

//   @override
//   void dispose(){
//     controller!.dispose();
//     super.dispose();
//   }

//     Future<File> takePicture()async{
//       Directory root = await getTemporaryDirectory();
//       String directoryPath = "${root.path}/guide_camera";
//       await Directory(directoryPath).create(recursive: true);
//       String filePath = "$directoryPath/${DateTime.now()}.jpg";

//       try {
//         await controller!.takePicture();
//       } catch (e) {
//         print(e);
//       }
//       return File(filePath);
//     }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: initializeCamera(),
//         builder: (context, snapshot) => (snapshot.connectionState == ConnectionState.done) ? Column(
//           children: [
//             SizedBox(width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / controller!.value.aspectRatio,
//             child: CameraPreview(controller!),
//             ),
//             InkWell(
//               onTap: () async{
//                 if (!controller!.value.isTakingPicture) {
//                   File result = await takePicture();
//                   Navigator.pop(context, result);
//                 }
//               },
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 margin: EdgeInsets.only(top: 50),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue
//                 ),

//               ),
//             ),
//           ],
//         ) : Center(
//           child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(),),
//         ),),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future pickCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                pickCamera();
              },
              child: Text(
                "pick from camera",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: Text(
                "pick from gallery",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
