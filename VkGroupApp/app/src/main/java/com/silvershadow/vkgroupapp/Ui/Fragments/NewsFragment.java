package com.silvershadow.vkgroupapp.Ui.Fragments;

import com.silvershadow.vkgroupapp.R;

public class NewsFragment extends BaseFragment {

    public NewsFragment(){

    }

    @Override
    protected int getMainContentLayout() {
        return R.layout.news_fragment;
    }

    @Override
    public int onCreateToolbarTitle() {
        return R.string.screen_name_news;
    }
}
