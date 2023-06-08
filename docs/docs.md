 # Start
 $
 dart run build_runner watch -d

# deploy
$
cd ~/myapp/repeatandlearn && flutter build web --dart-define=keyApplicationId=123 --dart-define=keyClientKey=456  && cd back4app/repeatAndLearn && b4a deploy
 