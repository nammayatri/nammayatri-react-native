import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import React, { useContext, useState } from 'react';
// import { MainComponent } from './MainComponent';
import {useRef} from 'react';

let abc ;
export function funcccc(props){
  console.log("INside funcccc calling Main.purss");
  // window.Element = React.createElement(View, null, React.createElement(Text, null, "Open up App.js to changes inside secondScreenRendering working on your app!"));
  abc(props);
};
export default function App() {
  const viewRef = useRef(null);
  const {element} = useContext(ElementContext);

  const [state, setState] = useState();
  abc = setState;

  return (
    
    <ElementContext.Provider value={{element : state}}>
      
      <View >
        <Text>Open up App.js to changeddd working on your app!</Text> 
        {state}
    </View>
    </ElementContext.Provider>
  );
}


export const ElementContext = React.createContext({
  element : null
});


const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
