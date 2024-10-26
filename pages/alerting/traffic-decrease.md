# Traffic Decreases

```traffic_decrease
select * from panoply.traffic_decrease
WHERE
  older > ${inputs.floor}
  AND (older - most_recent) / older * 100 >= 45;
```

This utilizes GA4 data to calculate the average *organic* traffic:

- In the past six months excluding current month
- The current month
- Decrease between the two


<Slider
    title="Traffic Floor"
    name=floor
    defaultValue=10
    step=10
    max=500
/>

<DataTable data={traffic_decrease} compact=true>
    <Column id=url />
    <Column id=percentage_decrease contentType=colorscale scaleColor=red/>
</DataTable>

