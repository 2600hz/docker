#!/bin/bash
systemctl enable httpd
systemctl enable freeswitch
systemctl start httpd
systemctl start freeswitch

