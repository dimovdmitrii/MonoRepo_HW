#!/bin/bash
Log_dir="/var/log"

report_file=/tmp/log_report.txt

error="(error|ERROR|Error|warning|Warning|WARNING)"

grep -r -E "$error" $Log_dir > $report_file | awk -F ':' '{print $2}' | sort | uniq -c | sort -nr > $report_file
echo "Log report genereted at $report_file"
cat $report_file