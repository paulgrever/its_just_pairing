# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Language.create(name: "Ruby")
Language.create(name: "JavaScript")
Language.create(name: "Java")
Language.create(name: "CSS")
Language.create(name: "C")
Language.create(name: "PHP")
Language.create(name: "Python")
Language.create(name: "Perl")
Language.create(name: "Clojure")

User.create(login: "121watts",
            uid: "7582765",
            avatar_url: "https://avatars.githubusercontent.com/u/7582765?v=3",
            html_url: "https://github.com/121watts",
            description: "Want to pair on my .vimrc? I got tired of Dvorak so i've been devising my own keyboard layout from scratch")
User.create(login: "BobGu",
            uid: "4348166",
            avatar_url: "https://avatars.githubusercontent.com/u/4348166?v=3",
            html_url: "https://github.com/BobGu", 
            description: "i am so alone plz pair with me")