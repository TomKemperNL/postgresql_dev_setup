normal['postgresql']['config']['listen_addresses'] = '*'
normal['postgresql']['password']['postgres'] = 'postgres'
normal['postgresql']['pg_hba'] = [
  { type: 'local', db: "all", user: 'postgres', addr: nil, method: 'ident' },
  { type: 'local', db: "all", user: 'all', addr: nil, method: 'ident' },
  { type: 'host', db: "all", user: 'all', addr: "0.0.0.0/0", method: 'md5' },
  { type: 'host', db: "all", user: 'all', addr: "::1/128", method: 'md5' }
]

normal["poise-python"]["install_python2"] = false
normal["poise-python"]["install_python3"] = true
