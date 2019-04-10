package com.silvershadow.vkgroupapp.DependencyInjection.Component;

import com.silvershadow.vkgroupapp.DependencyInjection.Module.ApplicationModule;
import com.silvershadow.vkgroupapp.DependencyInjection.Module.ManagerModule;
import com.silvershadow.vkgroupapp.DependencyInjection.Module.RestModule;
import com.silvershadow.vkgroupapp.MainActivity;
import com.silvershadow.vkgroupapp.Ui.Activity.BaseActivity;
import com.silvershadow.vkgroupapp.Ui.Fragments.NewsFragment;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component (modules = {ApplicationModule.class, ManagerModule.class, RestModule.class})
public interface ApplicationComponent {
    void inject (BaseActivity activity);
    void inject (MainActivity activity);

    void inject (NewsFragment fragment);
}
