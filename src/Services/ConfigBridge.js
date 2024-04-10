import AsyncStorage from '@react-native-async-storage/async-storage';

export const setKeyInSharedPrefKeysImpl = function (key) {
  console.log("This is it ....1 ");
  return function (value) {
    console.log("This is it ....2 ");
    // return function (){
        console.log("This is it ....3 ")
        storeData(key, value).then(() => {
            console.log("AsyncStorage storage successful : ", " Key - " , key, " | value - ", value);
        }).catch(error => {
            console.log("AsyncStorage storage unsuccessful : ", " Key - " , key, " | value - ", value);
        });
    // }
  }
}

export const getKeyInSharedPrefKeysImpl = function (key) {
   getData(key).then((value) => {
      console.log("AsyncStorage fetching successful : ", " Key - " , key, " | value - ", value);
      return value;
   }).catch(error => {
      console.log("AsyncStorage fetching unsuccessful : ", " Key - " , key);
      return "__failed";
   })

   return "Hellow";
}

const storeData = async (key, value) => {
  try {
    await AsyncStorage.setItem(key, value); 
  } catch (e) {
    console.log("Error in storing data in async storage");
  }
}


const getData = async (key) => {
  try {
    const value = await AsyncStorage.getItem(key);
    if (value !== null){
      return value;
    }
  } catch (e){
    console.log("Error in fetching data from async storage");
  }
  return null;
}
