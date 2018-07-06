
cf = default[:coldfusion]
cf[:user]='coldfusion'
cf[:dir]='/opt/coldfusion'
cf[:install_dir]='/opt/coldfusion/installer'
cf[:folder]='/opt/coldfusion/11'
cf[:installer]='ColdFusion_11_WWEJ_linux64_011315.bin'
cf[:url]='https://github.com/capnregex/cold_fusion_installers/releases/download/CF11.15.01.13/ColdFusion_11_WWEJ_linux64_011315.bin'

cf[:mode]='developer' # full/trial/developer 
cf[:serial_number]=nil # for full install
cf[:prev_serial_number]=nil # Use when it is upgrade
cf[:type]='standalone' # ear/war/standalone 
cf[:profile]=:dev # :secure/:prod/:default/:dev

cf[:install_odbc]=true
cf[:install_jnbridge]=true
cf[:install_admin]=true
cf[:install_solr]=true
cf[:install_pdfg]=true

cf[:enable_rds]=true
cf[:enable_wsrp]=true
cf[:enable_jsdebug]=true
cf[:enable_cfr]=true
cf[:enable_cfswf]=true
cf[:enable_cfforms]=true

#Remote administrator component for server remote start/stop
cf[:admin_ip]='0.0.0.0' # Administrator service
cf[:admin_username]='admin'
cf[:admin_password]='Adm1n$12'

cf[:rds_password]='Adm1n$12'

cf[:jetty_ip]='0.0.0.0' # PDFG/Solr service
cf[:jetty_username]='admin'
cf[:jetty_password]='Adm1n$12'

cf[:j2ee_context_root]=nil
#automatically check for serverupdates. 
cf[:auto_update]=false

#Migration (Needed for non-windows OSes.For Windows,it is automatically taken from registries).
cf[:migrate]=false
cf[:prev_cf_dir]= '/opt/coldfusion/10' # C:\\ColdFusion10


