package ${packageName}.activity;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import ${applicationPackage}.R;
import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};
import butterknife.Bind;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import ${packageName}.adapter.${adapterClass};


import com.aspsine.swipetoloadlayout.OnLoadMoreListener;
import com.aspsine.swipetoloadlayout.OnRefreshListener;
import com.aspsine.swipetoloadlayout.SwipeToLoadLayout;
import com.xiaohe.baonahao_school.widget.EmptyPageLayout;
import java.util.List;



public class ${activityClass} extends BaseActivity<${viewClass} ,${presenterClass}> implements ${viewClass}
{

	@Bind(R.id.swipToLoadLayout)
    SwipeToLoadLayout swipeToLoadLayout;
    @Bind(R.id.swipe_target)
    RecyclerView recyclerView;
    @Bind(R.id.emptyPage)
    EmptyPageLayout emptyPage;
    ${adapterClass} mAdapter;

	public static void startFrom(Context context) {
        LauncherManager.getLauncher().launch((Activity) context, ${activityClass}.class);
    }


	@Override
    protected ${presenterClass} createPresenterInstance() {
        return new ${presenterClass}();
    }

    @Override
    protected int getLayoutId() {
        return R.layout.${layoutName};
    }

   @Override
    protected void onViewCreated() {
        super.onViewCreated();
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
	private void displayHasData() {
        emptyPage.setVisibility(View.GONE);
        swipeToLoadLayout.setVisibility(View.VISIBLE);
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

	private void initRecycleView() {
        mAdapter = new ${adapterClass}(visitActivity());
        LinearLayoutManager layoutManager = new LinearLayoutManager(visitActivity());
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setHasFixedSize(true);
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
        swipeToLoadLayout.setLoadMoreEnabled(false);

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
