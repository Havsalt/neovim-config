heading = (
  "////////////////////////////////////////////////////////",
  "///   ////  //    //      //  ////  /// ///  ///////  //",
  "//     //   /  ////  ///  ///  ///  //  //     ///    //",
  "//  //  /  //    //  ///  ////  //  //  //  //  /  /  //",
  "//  ///    //  ////  ///  ////  /  ///  //  //  /  /  //",
  "//  ////   //     /      //////  /////  //  ///  ///  //",
  "////////////////////////////////////////////////////////"
)


for line in heading:
    edited = (
        line
        .replace(" ", "´")
        # .replace("/", "+")
    )
    print(f'  "{(edited)}",')
