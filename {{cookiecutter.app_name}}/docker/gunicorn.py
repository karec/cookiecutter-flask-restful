workers = 1
bind = '0.0.0.0:5100'
worker_class = "meinheld.gmeinheld.MeinheldWorker"
timeout = 600

loglevel = 'info'
logfile = "/dev/stdout"
pythonpath = "/app"
