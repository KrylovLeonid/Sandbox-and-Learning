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
        mWallApi.get("-086529552", CurrentUser.getAccessToken(), 1, "5.67").enqueue(new Callback<Full<BaseItemResponse>>() {
            @Override
            public void onResponse(Call<Full<BaseItemResponse>> call, Response<Full<BaseItemResponse>> response) {
                Toast.makeText(getActivity(), "Count: " + response.body().response.getCount(), Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<Full<BaseItemResponse>> call, Throwable t) {
                t.printStackTrace();
            }
        });
    }

    @Override
    public int onCreateToolbarTitle() {
        return R.string.screen_name_news;
    }
}
