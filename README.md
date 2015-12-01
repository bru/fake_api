# Fake API

Experiments in building fake APIs.

This repository is part of the Devember initiative. You should do it
too!
For more info, see http://devember.org/

You can follow my progress through the commits; I'll also do my best to
update this README file as the days go by.

## 1.12

# devember
let's start with something ugly, and pretty simple.
Let's start with an API that mocks data.
I had this idea bouncing in my head recently, about "wireframing" APIs
as a way to provide the front end developers with something to work with
while progressively developing the real data connections and business
logic.

The easiest way I can think to do this is to use sinatra.
Sinatra is a very simple, quite elegant framework for building web apps,
and it could serve us pretty well in mocking up our API, at least in
this phase. My goal for today is setting up a skeleton app, ready to
host the fake API.

First, let's create the repository that will hold the app.
```
> mkdir fake_api
> cd fake_api
> git init
```

Now that we have a local repository, let's start from the Gemfile,
that's the file that describes the dependencies of your project

```
source :rubygems

gem 'sinatra'
```
This should do for now.

I tend to use `rbenv` to manage my ruby versions (yes, sadly I need more
than one installed to keep hacking on legacy projects), so let's add a
file named `.ruby-version` to declare what version of ruby I want
(2.2.0), and also create a file called `.gitignore` where we tell git
that the ruby version file is to be ignored, as ymmv:
```
> echo 2.2.0 > .ruby-version
> echo .ruby-version > .gitignore
```

now, let's create a simple sinatra app.
We're going to use the modular way, just because it's what I'm less
accustomed with, and I should learn something every day during Devember
after all...

I'm going to split the app in two files for now: one loader called
`config.ru` and one file containing the application definition, called
`app.rb`
The config file will be ridiculously simple: just setup the environment,
load and run the app:
```
$LOAD_PATH.unshift 'lib' # we'll put most of our custom code in the
'lib' folder
require './app'
run App
```

the app file is slightly more involved: we want to load the parts of the
sinatra framework needed for the app, then create a class that inherits
from `Sinatra::Base` and that will define our application. For now, all
we need is a trivial way to know if the things works, so I'll just make
it write "Hello World" when somebody hits the root of the web app:
```
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Hello World"
  end
end
```

We can already verify the app by running
```
> bundle exec rackup
```

Then go to http://localhost:9292/ to see our new little program greeting
us.
However, I'm a lazy and forgetful person, so I'd like to have an even
simpler way to startup the api (who knows, before the month is over,
that may require several moving parts).
So let's use `foreman` for the job, and proceed creating a `Procfile`
file to start the web server:
```
web: bundle exec rackup -p $PORT
```
The extra `-p $PORT` makes it Heroku ready, which is nice (and, by
default, will make our app show up on port 5000 instead of 9292).

Ok, this is enough for today. See you tomorrow!
