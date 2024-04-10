import registerRootComponent from 'expo/build/launch/registerRootComponent'
import App , {funcccc} from '../App.js';
import { AppRegistry } from 'react-native';
import React, { useContext } from 'react';
import { Text, View } from 'react-native';
import {main} from '../output/Main1/index.js';

window.Element = null;
// window.JBridge = top.JBridge;
// const purescipt = require('./output/Main1/index.js');


const baseAppFlow = () => {
  console.log("INside baseAppFlow calling Main.purss");
  mainFlow();
}

const mainFlow = () => {
  console.log("INside mainFlow calling Main.purss");
  // AppRegistry.registerComponent("main", () => App);
  main();
  // firstScreenRendering();
}

const firstScreenRendering = () => {
  // window.Element = React.createElement(View, null, React.createElement(Text, null, "Open up App.js to changeddd working on your app!"));
  const timerId = setTimeout(() => {
    secondScreenRendering();
  }, 5000);
}

const secondScreenRendering = () => {
  console.log("INside secondScreenRendering calling Main.purss");
  funcccc(React.createElement(View, null, React.createElement(Text, null, "Open up App.js to changes inside secondScreenRendering working on your app!")));
  // window.Element = React.createElement(View, null, React.createElement(Text, null, "Open up App.js to changes inside secondScreenRendering working on your app!"));
}

baseAppFlow();