@ECHO OFF
mongoimport -d operating_expenses -c population --file population.json
mongoimport -d operating_expenses -c city_or_province --file city_or_province.json
mongoimport -d operating_expenses -c local --file local.json