package com.nammayatri;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import java.util.Map;
import java.util.HashMap;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

public class DummyNativeModule extends ReactContextBaseJavaModule {

    Context context;
    DummyNativeModule(ReactApplicationContext context) {
        super(context);
        this.context = context;
    }

    @Override
    public String getName() {
        return "DummyNativeModule";
    }


    @ReactMethod(isBlockingSynchronousMethod = true)
    public String logEvent(String name, String location) {
        Log.d("DummyNativeModule", "Create event called with name: " + name
                + " and location: " + location);

//        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
//        SharedPreferences.Editor editor = preferences.edit();
//        editor.putString("Name","Harneet");
//        editor.apply();
        return "I am the return value";
    }

}
