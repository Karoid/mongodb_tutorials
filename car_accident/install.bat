@ECHO OFF
mongoimport -d car_accident -c area --file area.json
mongoimport -d car_accident -c by_month --file by_month.json
mongoimport -d car_accident -c by_road_type --file by_road_type.json
mongoimport -d car_accident -c by_type --file by_type.json