package ${packageName}.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import ${applicationPackage}.R;
import ${packageName}.adapter.viewholder.${viewHolderClass};


import java.util.ArrayList;
import java.util.List;

public class ${adapterClass} extends MyAdapter<${viewHolderClass},Object>  implements IAdapterData<Object> {

    public ${adapterClass}(Context context){
        super(context);
    }

@Override
    protected void addViewHolderData(${viewHolderClass} holder, int position) {

    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return null;
    }
}