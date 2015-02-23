my dummy rails project

## Feature
- Everyone can receive messages from a cow
- You ask us to poke the cow,
  and when the job is done (backgrou job)
  you get the message (live page update)

## Setup
required packages: cowsay, fortune

```bash
# ubuntu
sudo apt-get install -y fortune-mod cowsay
```

run `rake jobs:work`