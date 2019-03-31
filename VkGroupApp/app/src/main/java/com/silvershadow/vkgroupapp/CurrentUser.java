package com.silvershadow.vkgroupapp;

import com.vk.sdk.VKAccessToken;
import com.vk.sdk.VKSdk;

public class CurrentUser {
    public static String getAccessToken(){
        if(accessTokenIsNull())
            return null;

        return VKAccessToken.currentToken().accessToken;
    }

    public static String getId(){
        if(accessTokenIsNull())
            return null;
        return VKAccessToken.currentToken().userId;
    }

    public static boolean isAuthorized(){
        return VKSdk.isLoggedIn()
                && !accessTokenIsNull()
                && !VKAccessToken.currentToken().isExpired();
    }

//небольшое удаление дуляжа из кода выше
    public static boolean accessTokenIsNull(){
        return VKAccessToken.currentToken() == null;
    }

}



