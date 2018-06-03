shinken
-------

This is my first attempt to do puppet module for shinken to manage:
1. shinken user and ssh keys
-- to regenerate the ssh keys:
    $ cd files
    $ ssh-keygen -t rsa -b 2048 -f id_rsa-shinken
    -- this will regenerate id_rsa-shinken and id_rsa-shinken.pub
    $ cat id_rsa-shinken.pub |awk '{print $1}'
    -- put the output into params.pp:$shinken_pubkey 
    -- will need to find an easy way

2. shinken ssh keys for nagios
-- optional class

3. shinken enterprise rpm
-- need to put into repo?

4. mongodb rpm
-- need to put into repo?

5. graphite installatin and configuration
-- files?

6. configuration files for daemons
-- files?


Info
----

