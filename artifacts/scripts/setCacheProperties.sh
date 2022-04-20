if [[ -z $DEFAULT_INSIGHT_CACHEABLE ]]; then
echo "No default insight cacheable"
else sed -i "s@DEFAULT_INSIGHT_CACHEABLE.*@DEFAULT_INSIGHT_CACHEABLE\t$DEFAULT_INSIGHT_CACHEABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $DEFAULT_INSIGHT_CACHE_MINUTES ]]; then 
echo "No default insight cache minutes"
else sed -i "s@DEFAULT_INSIGHT_CACHE_MINUTES.*@DEFAULT_INSIGHT_CACHE_MINUTES\t$DEFAULT_INSIGHT_CACHE_MINUTES@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $DEFAULT_INSIGHT_CACHE_CRON ]]; then 
echo "No default insight cache cron"
else sed -i "s@DEFAULT_INSIGHT_CACHE_CRON.*@DEFAULT_INSIGHT_CACHE_CRON\t$DEFAULT_INSIGHT_CACHE_CRON@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $DEFAULT_INSIGHT_CACHE_ENCRYPT ]]; then
echo "No default insight cache encrypt"
else sed -i "s@DEFAULT_INSIGHT_CACHE_ENCRYPT.*@DEFAULT_INSIGHT_CACHE_ENCRYPT\t$DEFAULT_INSIGHT_CACHE_ENCRYPT@g" /opt/semosshome/RDF_Map.prop
fi
