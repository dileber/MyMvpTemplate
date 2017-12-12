<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <#include "activity_layout_recipe.xml.ftl" />

    <instantiate from="src/app_package/classes/Activity.java.ftl"
      to="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />

    <instantiate from="src/app_package/classes/View.java.ftl"
      to="${escapeXmlAttribute(srcOut)}/view/${viewClass}.java" />


    <instantiate from="src/app_package/classes/Presenter.java.ftl"
      to="${escapeXmlAttribute(srcOut)}/presenter/${presenterClass}.java" />

    <instantiate from="src/app_package/classes/Adapter.java.ftl"
      to="${escapeXmlAttribute(srcOut)}/adapter/${adapterClass}.java" />


          <instantiate from="src/app_package/classes/ViewHolder.java.ftl"
      to="${escapeXmlAttribute(srcOut)}/adapter/viewholder/${viewHolderClass}.java" />
</recipe>
