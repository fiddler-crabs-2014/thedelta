ruby   = Language.new(:name => "Ruby")
js     = Language.new(:name => "JavaScript")
python = Language.new(:name => "Python")
java   = Language.new(:name => "Java")

languages = [ruby, js, python, java]

languages.each { |language| language.save }
