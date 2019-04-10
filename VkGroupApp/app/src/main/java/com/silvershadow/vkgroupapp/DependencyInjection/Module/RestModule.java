package com.silvershadow.vkgroupapp.DependencyInjection.Module;

import com.silvershadow.vkgroupapp.Rest.Api.WallApi;
import com.silvershadow.vkgroupapp.Rest.RestClient;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class RestModule {
    private RestClient mRestClient;

    public RestModule(){
        mRestClient = new RestClient();
    }

    @Singleton
    @Provides
    public RestClient providesRestClient(){
        return mRestClient;
    }

    @Singleton
    @Provides
    public WallApi provideWallApi(){
        return mRestClient.createServise(WallApi.class);
    }

}
