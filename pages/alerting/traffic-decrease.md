# Alerting

Potential issues

```traffic_decrease
select * from panoply.traffic_decrease
WHERE
  older > ${inputs.floor}
  AND (older - most_recent) / older * 100 >= 45;
```

<Slider
    title="Traffic Floor"
    name=floor
    defaultValue=10
    step=10
/>

<DataTable data={traffic_decrease} compact=true>
    <Column id=url />
    <Column id=percentage_decrease contentType=colorscale scaleColor=red/>
</DataTable>

