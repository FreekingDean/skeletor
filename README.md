# Skeletor

https://www.github.com/FreekingDean/skeletor

## What is it?

Skeletor is an application bootstrapper. It takes in a set of configurations we call 'bones', and puts them together to form
an application skeleton. These Skeletons can be either public or private. The bones can be either public or private. The bones
are a collection of settings for the skeleton the settings are always private to the bone (IE the same visibility as the bone its in).
The setting can be encrypted if needed as well. If a setting needs to be encrypted then it must be in a private bone.  After a skeleton
is built you can use the CLI tool to start a new project with your setup. You can make either rails apps or gem files at this point.
There is a lot of work to be done in adding support for other bootstrapping agents, frameworks, languages etc... All help is welcome
I anticipate this project to be fully open source always!

## How do I use it?

- First, [sign up](https://www.skeletorapp.com/accounts/new)
- Next [add a skeleton](https://www.skeletorapp.com/skeletons) to your account or [make your own](https://www.skeletorapp.com/skeletons/new)
- Then download & install the [skeletor cli](https://www.github.com/FreekingDean/skeletor_cli) `gem install skeletor_cli`
- Lastly run the cli tool with your skeleton! `skeletor build rails-api AppName`
