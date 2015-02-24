dummy rails project #learning

## Features
- Everyone can receive messages from the cow
- You ask us to poke the cow,
  and when the job is done (_backgroud job_)
  you get a message (_live_ page update)
- You can ask to massage the cow,
  and this will make the cow to post a message 
  every minute (_recurring job_)

TODO: 
- recurring job: ActiveJob::Scheduler, Sidekiq / Sidetiq::Schedulable
- clear tasks when connection is closed (not all, but only this user tasks)
- ??? ActionController::Live::ClientDisconnected
- Notify when someone is massaging the cow

## Setup
required packages: cowsay, fortune

```bash
# install on ubuntu
sudo apt-get install -y fortune-mod cowsay
```

## Run
`foreman start`