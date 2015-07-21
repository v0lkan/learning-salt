import salt.utils.event

sock_dir = '/var/run/salt/master'
payload = {'sample_msg': 'This is a test.'}
event = salt.utils.event.SaltEvent('master', sock_dir)
event.fire_event(payload, 'salt/mycustomtag')


# other file

import salt.client

caller = salt.client.Caller()
caller.function('event.send', 'salt/mycustomtag', {'foo': 'bar'})