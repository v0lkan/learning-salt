__virtualname__ = 'pkg'

def __virtual__():
  if __grains__.get('os_family', False) != 'Debian':
    return False

  return __virtualname__

# TODO: create a git repo for this too.

# __opts__ :: gives access to the minions configuration options. (minion config)
# __pillar__ :: gives access to global pillar data.
# pillar is a secure storage for arbitrary data for minions.
# ^ related to states.