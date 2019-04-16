package com.silvershadow.vkgroupapp.Rest.model.response.request;

import com.google.gson.annotations.SerializedName;
import com.silvershadow.vkgroupapp.Constants.ApiConstatnts;
import com.vk.sdk.api.VKApiConst;

import java.util.Map;

public class WallGetRequestModel extends BaseRequetModel {
    @SerializedName(VKApiConst.OWNER_ID)
    private int ownerId;
    @SerializedName(VKApiConst.OFFSET)
    private int count = ApiConstatnts.DEFAULT_COUNT;
    @SerializedName(VKApiConst.EXTENDED)
    private int offset;
    int extendrt = 1;

    public WallGetRequestModel(int ownerId, int count, int offset) {
        this.ownerId = ownerId;
        this.count = count;
        this.offset = offset;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getExtendrt() {
        return extendrt;
    }

    public void setExtendrt(int extendrt) {
        this.extendrt = extendrt;
    }

    public WallGetRequestModel(int ownerId) {
        this.ownerId = ownerId;
    }

    @Override
    public void onMapCreate(Map<String, String> map) {
        map.put(VKApiConst.OWNER_ID, String.valueOf(getOwnerId()));
        map.put(VKApiConst.COUNT, String.valueOf(getCount()));
        map.put(VKApiConst.OFFSET, String.valueOf(getOffset()));
        map.put(VKApiConst.EXTENDED, String.valueOf(getExtendrt()));

    }
}
