filename=/opt/semosshome/RDF_Map.prop
cacheable="DEFAULT_INSIGHT_CACHEABLE"
cache_minutes="DEFAULT_INSIGHT_CACHE_MINUTES"
cache_cron="DEFAULT_INSIGHT_CACHE_CRON"
cache_encrypt="DEFAULT_INSIGHT_CACHE_ENCRYPT"

if ! grep -R "${cacheable}" $filename
then
    sed -i "/^#SET IF INSIGHTS ON SAVE ARE CACHEABLE.*/a ${cacheable}\t true" $filename
else
    sed -i "s/^${cacheable}.*/${cacheable}\t true/g" $filename
fi

if ! grep -R "${cache_minutes}" $filename
then
    sed -i "/${cacheable}*/a ${cache_minutes}\t -1" $filename
else
    sed -i "s/^${cache_minutes}.*/${cache_minutes}\t -1/g" $filename
fi

if ! grep -R "${cache_cron}" $filename
then
    sed -i "/^${cache_minutes}.*/a ${cache_cron}" $filename
else
    sed -i "s/^${cache_cron}.*/${cache_cron}/g" $filename
fi

if ! grep -R "${cache_encrypt}" $filename
then
    sed -i "/^${cache_cron}.*/a ${cache_encrypt}\t false" $filename
else
    sed -i "s/^${cache_encrypt}.*/${cache_encrypt}\t false/g" $filename
fi