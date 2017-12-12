package ${packageName}.fragment;

import android.app.Activity;
import android.support.v4.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import ${applicationPackage}.R;
import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};
import com.aspsine.swipetoloadlayout.OnLoadMoreListener;
import com.aspsine.swipetoloadlayout.OnRefreshListener;
import com.aspsine.swipetoloadlayout.SwipeToLoadLayout;
import com.xiaohe.baonahao_school.widget.EmptyPageLayout;
import butterknife.Bind;
import android.support.v7.widget.RecyclerView;
import java.util.List;
import ${packageName}.adapter.${adapterClass};
import android.view.View;

public class ${activityClass} extends BaseLazyFragment<${viewClass} ,${presenterClass}> implements ${viewClass}
{

	@Override
    protected ${presenterClass} createPresenterInstance() {
        return new ${presenterClass}();
    }

    @Override
    protected int getLayoutId() {
        return R.layout.${layoutName};
    }


    public static ${activityClass} newInstance() {
        ${activityClass} fragment = new ${activityClass}();
        return fragment;
    }

  @Override
    public void refreshCompleted() {
        swipeToLoadLayout.setRefreshing(false);
    }

    @Override
    public void loadMoreCompleted() {
        swipeToLoadLayout.setLoadingMore(false);
    }

    @Override
    public void displayEmptyPage(EmptyPageLayout.Empty empty) {
        emptyPage.setVisibility(View.VISIBLE);
        switch (empty) {
            case NetworkError:
                emptyPage.setEmptyType(empty);
                swipeToLoadLayout.setVisibility(View.GONE);
                break;
            case EmptyData:
                emptyPage.setEmptyType(empty, getEmptyTip());
                break;
        }
        if (mAdapter != null) {
            mAdapter.clean();
            mAdapter.notifyDataSetChanged();
        }
    }

    @Override
    public void setData(List<Object> data, boolean isRefreshLast) {
        displayHasData();
        if (isRefreshLast) {
            mAdapter.refresh(data);
        } else {
            mAdapter.addData(data);
        }
    }

    private void displayHasData() {
        emptyPage.setVisibility(View.GONE);
        swipeToLoadLayout.setVisibility(View.VISIBLE);
    }


    @Bind(R.id.swipToLoadLayout)
    SwipeToLoadLayout swipeToLoadLayout;
    @Bind(R.id.swipe_target)
    RecyclerView recyclerView;
    @Bind(R.id.emptyPage)
    EmptyPageLayout emptyPage;
    ${adapterClass} mAdapter;

    @Override
    protected void onViewCreated() {

        initRecycleView();
        initViews();
        initRefreshEmptyPage();
        recyclerView.post(new Runnable() {
            @Override
            public void run() {
                if (swipeToLoadLayout != null) {
                    swipeToLoadLayout.setRefreshing(true);
                }
            }
        });

    }

    private void initRecycleView() {
        mAdapter = new ${adapterClass}(visitActivity());
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext());
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(mAdapter);
    }

    private void initRefreshEmptyPage() {
        emptyPage.setOnRefreshDelegate(new EmptyPageLayout.OnRefreshDelegate() {
            @Override
            public void onRefresh() {
                _presenter.onRefreshErrorPage();
            }
        });
    }


    private void initViews() {
        swipeToLoadLayout.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                _presenter.loadMore();
            }
        });

        swipeToLoadLayout.setOnRefreshListener(new OnRefreshListener() {
            @Override
            public void onRefresh() {
                _presenter.refreshLast();
            }
        });
    }


    private String displayEmptyTip;

    private String getEmptyTip() {


        displayEmptyTip = "?";

        return displayEmptyTip;
    }

    @Override
    public void refreshPage() {
        super.refreshPage();
        swipeToLoadLayout.setRefreshing(false);
        _presenter.onRefreshErrorPage();
    }






}
