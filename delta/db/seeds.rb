ruby   = Language.new(:name => "Ruby")
js     = Language.new(:name => "JavaScript")
python = Language.new(:name => "Python")
java   = Language.new(:name => "Java")

languages = [ruby, js, python, java]

languages.each { |language| language.save }


enumerables = Category.new(:name => "Enumerables")
logic    		= Category.new(:name => "Logic Flow"
classes 		= Category.new(:name => "Classes")
methods   	= Category.new(:name => "Methods")
regex   		= Category.new(:name => "Regular Expressions")
inheritance = Category.new(:name => "Inheritance")

methods = [enumerables, logic, classes, methods, regex, inheritance]

methods.each { |method| method.save }