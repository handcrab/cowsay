my dummy rails project #learning

## Feature
- Everyone can receive messages from a cow
- You ask us to poke the cow,
  and when the job is done (_backgroud job_)
  you get the message (_live_ page update)
- You can ask to massage the cow
  and this will make the cow to post a message 
  every 1 minute (_recurring job_)

TODO: 
- Sidekiq / Sidetiq::Schedulable
- clear tasks when connection is closed (not all but only this user tasks)


## Setup
required packages: cowsay, fortune

```bash
# ubuntu
sudo apt-get install -y fortune-mod cowsay
```

run `rake jobs:work`