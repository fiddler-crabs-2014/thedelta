# Language Data
ruby   = Language.new(:name => "Ruby")
javascript    = Language.new(:name => "JavaScript")
python = Language.new(:name => "Python")
java   = Language.new(:name => "Java")

languages = [ruby, javascript, python, java]

languages.each { |language| language.save }


# Category Data
enumerables = Category.new(:name => "Enumerables")
logic    		= Category.new(:name => "Logic Flow")
classes 		= Category.new(:name => "Classes")
methods   	= Category.new(:name => "Methods")
regex   		= Category.new(:name => "Regular Expressions")
inheritance = Category.new(:name => "Inheritance")

categories = [enumerables, logic, classes, methods, regex, inheritance]

categories.each { |method| method.save }


# Question Data
	## Enumerables
		# Start: Ruby 
			# Javascript
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby.name, end_language: javascript.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby.name, end_language: javascript.name)

			# Python
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby.name, end_language: python)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby.name, end_language: python)

			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby.name, end_language: java)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name 
			# Ruby
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: ruby.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: ruby.name)
			
			# Python
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: python)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: python)
			
			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: java)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: java)
		#
	##

	## logic
		# Start: Ruby
			# Javascript.name
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: python)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name
			# Ruby
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: python)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: java)
		#
	##

	## classes
		# Start: Ruby
			# Javascript.name
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: python)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name
			# Ruby
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: python)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: java)
		#
	##

	## methods
		# Start: Ruby
			# Javascript.name
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: python)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name
			# Ruby
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: python)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: java)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript.name
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: python)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name
			# Ruby
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: python)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: java)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript.name
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: python)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: java)

		# Start: Javascript.name
			# Ruby
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: python)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: java)
		#
	##



















