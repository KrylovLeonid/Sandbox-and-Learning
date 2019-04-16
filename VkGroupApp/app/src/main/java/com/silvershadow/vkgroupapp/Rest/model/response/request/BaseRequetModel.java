package com.silvershadow.vkgroupapp.Rest.model.response.request;

import com.google.gson.annotations.SerializedName;
import com.silvershadow.vkgroupapp.Constants.ApiConstatnts;
import com.silvershadow.vkgroupapp.CurrentUser;
import com.vk.sdk.api.VKApiConst;

import java.util.HashMap;
import java.util.Map;

public abstract class BaseRequetModel {
    @SerializedName(VKApiConst.VERSION)
    Double version = ApiConstatnts.DEFAULT_VERSION;

    @SerializedName(VKApiConst.ACCESS_TOKEN)
    String accessToken = CurrentUser.getAccessToken();

    public String getAccessToken(){
        return accessToken;
    }

    public Double getVersion(){
        return version;
    }

    public Map<String, String> toMap(){
        Map<String, String> map = new HashMap<>();
        map.put(VKApiConst.VERSION, String.valueOf(getVersion()));
        if(accessToken != null){
            map.put(VKApiConst.ACCESS_TOKEN, getAccessToken());
        }
        onMapCreate(map);
        return map;
    }

    public abstract void onMapCreate(Map<String,String> map);
}
