# Topics to Investigate

- walklex: List data segments (after major segmentors)
`| walklex index=av type=term | stats sum(count) by term`
- base64: https://answers.splunk.com/answers/671087/render-base64-image-in-dashboard.html
- Buckets
`index=_internal | eval bkt=_bkt | stats count by bkt`
- https://docs.splunk.com/Documentation/Splunk/8.1.2/Search/Findingandremovingoutliers
