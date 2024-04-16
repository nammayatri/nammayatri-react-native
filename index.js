/**
 * @format
 */

import {main} from './output/Main/index.js';
import {NativeModules} from 'react-native';
const {DummyNativeModule} = NativeModules;
import FastImage from 'react-native-fast-image'
import { StyleSheet, AppRegistry, Text, View } from "react-native";



window.Element = null;

const baseAppFlow = () => {
  console.log("Inside baseAppFlow calling Main.purs");
  console.log("calling dummyNativeModule", DummyNativeModule.logEvent("Hello World", "Everything will be okay...")), 
  mainFlow();
}

const mainFlow = () => {
  console.log("Inside mainFlow calling Main.purs");
  main();
}

baseAppFlow();

// AppRegistry.registerComponent("main",() => App1);


// const App1 = () => {
//   return (
//     <View style={styles.container}>
//       <FastImage
//         style={styles.image}
//         source={{ uri: 'https://assets.juspay.in/beckn/nammayatri/user/images/ny_ic_chevron_left_white.png' }}
//         resizeMode={FastImage.resizeMode.contain}  // Example of using 'cover'
//         onLoad={e => console.log('Image loaded with dimensions:', e.nativeEvent.width, e.nativeEvent.height)}
//       />
//     </View>
//   );
// };

// const styles = StyleSheet.create({
//   container: {
//     width: 100,
//     height: "auto",
//     // justifyContent: 'center',
//     // alignItems: 'center',
//     backgroundColor: "#909090"
//   },
//   image: {
//     width: 100,
//     height: 100,
//   }
// });

