# Blecipedia app
Collaborative platform of wikis.

## Basic Deployment guide
I suppose you already have a Ruby On Rails development environmet already set up in your machine, also that your Ruby version is `>=2.1` and your Ruby On Rails is `>=4.2` for check your Ruby and Ruby On Rails versions respectively you can run in a terminal (Within your app folder):
```
ruby -v
rails -v
```

If your versions and development environement are ready then you can follow these steps for deploy your app in your local machine:

* Open a terminal and Clone the repository:

```
git clone https://github.com/RailsKarate/Blocipedia.git
```

* Get in the repository folder:
```
cd Blocipedia
```

* Install all gems and dependencias:
```
bundle install
```

* Set up your database
```
rake db:create db:migrate
```

* Then you should be able to run the rails server
```
rails s
```

* Try open your app in your browser http://localhost:3000
