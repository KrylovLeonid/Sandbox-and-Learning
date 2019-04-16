package com.silvershadow.vkgroupapp.Ui.Fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.Toast;

import com.silvershadow.vkgroupapp.CurrentUser;
import com.silvershadow.vkgroupapp.MyApplication;
import com.silvershadow.vkgroupapp.R;
import com.silvershadow.vkgroupapp.Rest.Api.WallApi;
import com.silvershadow.vkgroupapp.Rest.model.response.BaseItemResponse;
import com.silvershadow.vkgroupapp.Rest.model.response.Full;
import com.silvershadow.vkgroupapp.Rest.model.response.WallGetResponse;
import com.silvershadow.vkgroupapp.Rest.model.response.request.WallGetRequestModel;

import javax.inject.Inject;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class NewsFragment extends BaseFragment {

    @Inject
    WallApi mWallApi;

    public NewsFragment(){

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MyApplication.getApplicationComponent().inject(this);
    }

    @Override
    protected int getMainContentLayout() {
        return R.layout.news_fragment;
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mWallApi.get(new WallGetRequestModel(-86529552).toMap()).enqueue(new Callback<WallGetResponse>() {
            @Override
            public void onResponse(Call<WallGetResponse> call, Response<WallGetResponse> response) {
                Toast.makeText(getActivity(), "Likes: " + response.body().response.getItems().get(0).getLikes().getCount(), Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<WallGetResponse> call, Throwable t) {
                t.printStackTrace();
            }
        });
    }

    @Override
    public int onCreateToolbarTitle() {
        return R.string.screen_name_news;
    }
}
