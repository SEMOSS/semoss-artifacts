if [[ -z "${VIRUS_SCANNING_ENABLED}" ]];
then
  echo "Virus Scanning Enabled is not defined"
else
  echo "Custom Virus Scanning Enabled is defined"
  sed -i "s@VIRUS_SCANNING_ENABLED.*@VIRUS_SCANNING_ENABLED\t$VIRUS_SCANNING_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${VIRUS_SCANNING_METHOD}" ]];
then
  echo "Custom Virus Scanning Method is not defined"
else
  echo "Custom Virus Scanning Method is defined"
  sed -i "s@VIRUS_SCANNING_METHOD.*@VIRUS_SCANNING_METHOD\t$VIRUS_SCANNING_METHOD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CLAMAV_SCANNING_PORT}" ]];
then
  echo "Custom CLAMAV Scanning Port is not defined"
else
  echo "Custom CLAMAV Scanning Port is defined"
  sed -i "s@CLAMAV_SCANNING_PORT.*@CLAMAV_SCANNING_PORT\t$CLAMAV_SCANNING_PORT@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CLAMAV_SCANNING_ADDRESS}" ]];
then
  echo "Custom CLAMAV Scanning Address is not defined"
else
  echo "Custom CLAMAV Scanning Address is defined"
  sed -i "s@CLAMAV_SCANNING_ADDRESS.*@CLAMAV_SCANNING_ADDRESS\t$CLAMAV_SCANNING_ADDRESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CLAMAV_SCANNING_FS}" ]];
then
  echo "Custom CLAMAV Scanning FS is not defined"
else
  echo "Custom CLAMAV Scanning FS is defined"
  sed -i "s@CLAMAV_SCANNING_FS.*@CLAMAV_SCANNING_FS\t$CLAMAV_SCANNING_FS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${VIRUSTOTAL_API_KEY}" ]];
then
  echo "Custom Virus Total Api Key is not defined"
else
  echo "Custom Virus Total Api Key is defined"
  sed -i "s@VIRUSTOTAL_API_KEY.*@VIRUSTOTAL_API_KEY\t$VIRUSTOTAL_API_KEY@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${VIRUSTOTAL_USE_CERT}" ]];
then
  echo "Custom Virus Total Use Cert is not defined"
else
  echo "Custom Virus Total Use Cert is defined"
  sed -i "s@VIRUSTOTAL_USE_CERT.*@VIRUSTOTAL_USE_CERT\t$VIRUSTOTAL_USE_CERT@g" /opt/semosshome/RDF_Map.prop
fi
