if [[ -z $PIPELINE_LANDING_FILTER ]]; then
echo "No pipline landing filter"
else sed -i "s@PIPELINE_LANDING_FILTER.*@PIPELINE_LANDING_FILTER\t$PIPELINE_LANDING_FILTER@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $PIPELINE_SOURCE_FILTER ]]; then
echo "No pipeline source filter"
else sed -i "s@PIPELINE_SOURCE_FILTER.*@PIPELINE_SOURCE_FILTER\t$PIPELINE_SOURCE_FILTER@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $WIDGET_TAB_SHARE_EXPORT_LIST ]]; then
echo "No widget tab share/export filtering"
else sed -i "s@WIDGET_TAB_SHARE_EXPORT_LIST.*@WIDGET_TAB_SHARE_EXPORT_LIST\t$WIDGET_TAB_SHARE_EXPORT_LIST@g" /opt/semosshome/RDF_Map.prop
fi
