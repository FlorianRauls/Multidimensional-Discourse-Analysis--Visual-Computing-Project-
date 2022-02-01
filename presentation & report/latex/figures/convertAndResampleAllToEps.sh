
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
projectName="$( basename $scriptPath )"

suffix="_anti_aliased"
# 100.0 => same image size, 50.0 half image size
subsamplingPercentage="100.0"

cd $scriptPath

cd ..
#rm -r "${projectName}${suffix}"
if [ ! -d "${projectName}${suffix}" ];
then
  mkdir "${projectName}${suffix}"
fi

path="${scriptPath}"
savePath="${scriptPath}/../${projectName}${suffix}"
#rm *${suffix}.png
for d in $(find ${path} -maxdepth 100 -name '*.png')
do
  # skip the path directory 
  if [ $d == "$path/${file}" ] ;
  then
    continue
  fi
  #echo "Original: ${d}"
  if [ "." == $path ] ;
  then
    # extra handling for current directory "."
    subdir=`echo "${d}" | sed "s%\./%%g"`
  else
    subdir=`echo "${d}" | sed "s%${path}/%%g"`
  fi
  # 
  fileBaseName=$(basename "$subdir")
  fileDirName=$(dirname "$subdir")
  fileWithoutExtension="${fileBaseName%.*}"
  fileExtension="${fileBaseName##*.}"
  echo "Subdivided path: ${path}/${fileDirName}/${fileWithoutExtension}.${fileExtension}"
  convert -alpha Off -geometry ${subsamplingPercentage}%x "${path}/$fileBaseName" "${savePath}/${fileDirName}/${fileWithoutExtension}${suffix}.png"
  convert "${savePath}/${fileDirName}/${fileWithoutExtension}${suffix}.png" -background white -alpha remove -alpha off "eps3:${savePath}/${fileDirName}/${fileWithoutExtension}${suffix}.eps"
  #rm "${savePath}/${fileDirName}/${fileWithoutExtension}_anti_aliased.png"
done

#convert -alpha Off -geometry 12.5%x c60_fog.png c60_fog_anti_aliased.png
#convert c60_fog_anti_aliased.png -background white -alpha remove -alpha off eps3:c60_fog_anti_aliased.eps
#rm c60_fog_anti_aliased.png
