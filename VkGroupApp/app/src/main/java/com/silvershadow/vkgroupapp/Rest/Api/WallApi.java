package com.silvershadow.vkgroupapp.Rest.Api;

import com.silvershadow.vkgroupapp.Rest.model.response.BaseItemResponse;
import com.silvershadow.vkgroupapp.Rest.model.response.Full;
import com.silvershadow.vkgroupapp.Rest.model.response.WallGetResponse;

import java.util.Map;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;
import retrofit2.http.QueryMap;

public interface WallApi {

    @GET(ApiMethods.WALL_GET)
    Call<WallGetResponse> get(@QueryMap Map<String, String> map);


}
