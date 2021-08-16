#! /bin/bash
base_url="http://chartmuseum-jx.34.67.22.199.nip.io"
charts='["zeebe-cluster-helm", "zeebe-operate-helm", "zeebe-full-helm", "zeebe-operator","zeebe-operator-cc", "zeebe-zeeqs-helm","zeebe-tasklist-helm" ]'

echo $charts | jq ".[]" | xargs -I ^ curl -s "$base_url/api/charts/^/" | jq '.urls[0]' | xargs -I ^ curl -Os "$base_url/^"


echo "Cleaing up release.yaml files from releases"
workDir="tmp"

if [ -d "$workDir" ]; then
  echo "Deleting working dir"
  rm -rf $workDir
  echo "Done"
  echo ""
fi

echo "Creating fresh working dir"
mkdir $workDir
echo "Done"
echo ""

files=`git status --porcelain | grep -v "^\sD" | grep ".*\.tgz$" | awk '{ if(system("tar -tf " $2 " | grep -c release.yaml > /dev/null") == 0 ) {print $2}}'`

for tarFile in ${files}
do

  echo "Decompressing ${tarFile}"
  tar xf ${tarFile} -C ${workDir}
  echo "Done"
  echo ""

  echo "Files to be deleted:"
  find ${workDir} -name "release.yaml" -delete -print
  echo "Done"
  echo ""

  echo "Compressing new File"
  cd ${workDir}
  DIR=`ls -1`
  tar -czf ../${tarFile} $DIR
  rm -rf $DIR
  cd - > /dev/null
  echo "Done"
  echo ""

done

echo "Cleaning up working dir"
rm -rf ${workDir}
echo "Done"
echo ""

echo "Creating Helm Index..."

helm repo index --url http://helm.camunda.io .

echo "Done."
