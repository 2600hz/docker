#!/bin/sh
cd /usr/local/src/freeswitch
./bootstrap.sh -j

cat <<'EOF' > modules.conf
loggers/mod_console
loggers/mod_logfile
loggers/mod_syslog
applications/mod_commands
applications/mod_dptools
applications/mod_spandsp
applications/mod_conference
applications/mod_http_cache
applications/mod_fsv
applications/mod_httapi
applications/mod_sms
applications/mod_av
dialplans/mod_dialplan_directory
dialplans/mod_dialplan_xml
endpoints/mod_loopback
endpoints/mod_sofia
endpoints/mod_rtc
endpoints/mod_verto
event_handlers/mod_event_socket
event_handlers/mod_kazoo
event_handlers/mod_amqp
event_handlers/mod_cdr_csv
formats/mod_sndfile
formats/mod_local_stream
formats/mod_tone_stream
formats/mod_native_file
formats/mod_png
formats/mod_shout
codecs/mod_amr
codecs/mod_amrwb
codecs/mod_b64
codecs/mod_g723_1
codecs/mod_g729
codecs/mod_h26x
codecs/mod_opus
codecs/mod_vp8
xml_int/mod_xml_curl
say/mod_say_en
say/mod_say_fr
say/mod_say_ru
say/mod_say_pt
EOF

./configure -C --prefix=/usr/local/freeswitch
