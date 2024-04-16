import {
    BackHandler
  } from 'react-native';

export const registerBackPress = (onBackPress) => {
    return () => {
        BackHandler.addEventListener(
            'hardwareBackPress',
            onBackPress
        );
    }
}