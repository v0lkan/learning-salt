module pkg:
  def refresh_db():
    ret = {}
    cmd = 'apt-get -q update'
    
    out = __salt__['cmd.run_stdout'](cmd, output_loglevel='trace')
    
    for line in out.splitlines():
      cols = line.split()
      
      if not cols:
        continue
      
      ident = ' '.join(cols[1:])
      
      ret[ident] = True
      
    return ret