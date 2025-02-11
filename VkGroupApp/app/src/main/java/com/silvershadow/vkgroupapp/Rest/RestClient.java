package com.silvershadow.vkgroupapp.Rest;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class RestClient {
    private static final String VK_BASE_URL = "https://api.vk.com/method/";
    private Retrofit mRetrofit;

    public RestClient(){
        mRetrofit = new Retrofit.Builder().addConverterFactory(GsonConverterFactory.create()).baseUrl(VK_BASE_URL).build();
    }

    public <S>S createServise(Class<S> serviceClass){
        return  mRetrofit.create(serviceClass);
    }

}
