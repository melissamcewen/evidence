# Organic Overview

## Organic Over Time


```organic_over_time
select * from panoply.organic_over_time
```

<DataTable data={organic_over_time} />


<LineChart data={organic_over_time}
x=date_column
y=views
/>

## Weekly Organic

```weekly_organic
select * from panoply.weekly_organic
```
<LineChart data={weekly_organic}
x=datetime_column
y=total_views
/>
