```ctr_change
select * from panoply.ctr_change
WHERE
  avg_ctr_six_months > ${inputs.floor}  -- Ensure only pages with average CTR > 1% are included
ORDER BY
  ctr_decline_percentage DESC
```

# CTR Change

This utilizes Google Search Console data to calculate the following:

- The average SERP CTR (click-through rate) in the past six months excluding the current month
- The average SERP CTR in the past 30 days
- The percentage decrease between the six month average and the past 30 days average

The goal is to identify key pages (pages with high click-through rate) that have had declines in their CTR metric.

The slider can be used to adjust the minimum average SERP CTR (click-through rate) in the past six months

<Slider
    title="CTR Floor"
    name=floor
    defaultValue=1
    step=1
    max=100
/>

<DataTable data={ctr_change} compact=true/>
