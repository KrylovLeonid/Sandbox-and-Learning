package com.silvershadow.vkgroupapp;

import android.app.Application;

import com.silvershadow.vkgroupapp.DependencyInjection.Component.ApplicationComponent;

import com.silvershadow.vkgroupapp.DependencyInjection.Component.DaggerApplicationComponent;
import com.silvershadow.vkgroupapp.DependencyInjection.Module.ApplicationModule;
import com.vk.sdk.VKSdk;

public class MyApplication extends Application {

    private static ApplicationComponent sApplicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();
        VKSdk.initialize(this);
        initComponent();
    }

    private void initComponent(){
        sApplicationComponent = DaggerApplicationComponent.builder().applicationModule(new ApplicationModule(this)).build();
    }

    public static ApplicationComponent getApplicationComponent(){
        return sApplicationComponent;
    }

}
