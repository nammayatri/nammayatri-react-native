
import AsyncStorage from '@react-native-async-storage/async-storage';

export const setKeyValue = function (key) {
  console.log("setKeyValue", "stage1")
  return function (value) {
    console.log("setKeyValue", "stage2")
    return function(_error, success) {
      console.log("setKeyValue", "stage3")
      AsyncStorage.setItem(key, value).then(() => {
          console.log("Storage successful: ", "Key -", key, "| value -", value);
          success();
      }).catch(error => {
          console.error("Storage unsuccessful: ", "Key -", key, "| error -", error);
          throw error; // Important to rethrow the error for the .catch in Aff to work
      });
    }
  }
}

export const getValueByKey = function (key) {
  return function(_error, success) {
    AsyncStorage.getItem(key).then((value) => {
            console.log("fetching successful: ", "Key -", key, "| value -", value);
            success(value);
        }).catch(error => {
            console.error("fetching unsuccessful: ", "Key -", key, "| error -", error);
            throw error; // Important to rethrow the error for the .catch in Aff to work
        });
  }
}