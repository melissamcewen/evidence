```position_change
select * from panoply.position_change
WHERE
  avg_position_past_six_months < 10
```
# Position Crashes

This looks in the Google Search Console data to calculate the average 6-month and 30-day rankings for query/page combinations. Then calculate the average decrease in rank. It excludes queries with low average clicks.

<DataTable data={position_change} compact=true rows=50>
   <Column id=query wrap=true />
   <Column id=page wrap=true />
   <Column id=avg_position_past_six_months />
   <Column id=position_percentage_change contentType=colorscale scaleColor={['#ce5050','white','#6db678']} colorMid=0 />
</DataTable>
