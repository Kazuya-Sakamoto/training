-- * CASE文 単純CASE式
case gender
	when '男' then 1
	when '女' then 2
	else 99
end

--* 検索CASE式
case 
	when gender = '男' then 1
	when gender = '女' then 2
	else 99
end


-- ? 県名を地方名に再分類する
SELECT CASE pref_name
	WHEN'徳島' THEN'四国'
	WHEN'香川' THEN'四国'
	WHEN'愛媛' THEN'四国'
	WHEN'高知'THEN'四国'
	WHEN'福岡'THEN'九州'
	WHEN'佐賀'THEN'九州'
	WHEN'長崎'THEN'九州'
ELSE 'その他' END AS district,

GROUP BY CASE pref_name
	WHEN'徳島'THEN'四国'
	WHEN'香川'THEN'四国'
	WHEN'愛媛'THEN'四国'
	WHEN'高知'THEN'四国'
	WHEN'福岡'THEN'九州'
	WHEN'佐賀'THEN'九州'
	WHEN'長崎'THEN'九州'
ELSE'その他'END;

-- WHERE句で条件分岐させるのは素人のやること。プロはSELECT句で分岐させる
SELECT pref_name, 
	--男性の人口
	SUM(
		CASE WHEN sex='1'
		THEN population ELSE 0 END
	) AS cnt_m,
	--女性の人口
	SUM(
		CASE WHEN sex='2'
		THEN population ELSE 0 END
	)AS cnt_f 
	FROM PopTbl2 
GROUP BY pref_name;

-- 例「女性社員の給料は20万円以下」
CONSTRAINT check_salary CHECK(
	CASE WHEN sex='2' THEN CASE WHEN salary<=200000
	THEN 1 ELSE 0 END ELSE 1 END=1
)

