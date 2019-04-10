package com.silvershadow.vkgroupapp.DependencyInjection.Module;

import com.silvershadow.vkgroupapp.Managers.VKFragmentManager;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class ManagerModule {


    @Singleton
    @Provides
    VKFragmentManager provideVKFragmentManager(){
        return new VKFragmentManager();
    }

}
