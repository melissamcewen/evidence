```zero_pages
select * from panoply.zero_pages
```
# Pages with days of zero consecutive views

The following URLs are those that have had multiple days of 0 traffic

I used the raw google_analytics data because the GA4 view uses

>   REGEXP_REPLACE(CONCAT('https://www.withvector.com',REPLACE(landingpage, '(not set)', '')), '/$', '') as url,

Which casues "not set" and "-" pages to be read as the home page.


<DataTable data={zero_pages} compact=true/>
