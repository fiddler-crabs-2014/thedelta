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
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby, end_language: javascript)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby, end_language: javascript)

			# Python
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby, end_language: python)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby, end_language: python)

			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby, end_language: java)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby, end_language: java)

		# Start: Javascript 
			# Ruby
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript, end_language: ruby)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript, end_language: ruby)
			
			# Python
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript, end_language: python)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript, end_language: python)
			
			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript, end_language: java)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript, end_language: java)
		#
	##

	## logic
		# Start: Ruby
			# Javascript
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby, end_language: javascript)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby, end_language: python)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby, end_language: java)

		# Start: Javascript
			# Ruby
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript, end_language: ruby)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript, end_language: python)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript, end_language: java)
		#
	##

	## classes
		# Start: Ruby
			# Javascript
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby, end_language: javascript)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby, end_language: python)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby, end_language: java)

		# Start: Javascript
			# Ruby
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript, end_language: ruby)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript, end_language: python)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript, end_language: java)
		#
	##

	## methods
		# Start: Ruby
			# Javascript
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby, end_language: javascript)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby, end_language: python)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby, end_language: java)

		# Start: Javascript
			# Ruby
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript, end_language: ruby)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript, end_language: python)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript, end_language: java)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby, end_language: javascript)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby, end_language: python)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby, end_language: java)

		# Start: Javascript
			# Ruby
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript, end_language: ruby)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript, end_language: python)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript, end_language: java)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby, end_language: javascript)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby, end_language: python)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby, end_language: java)

		# Start: Javascript
			# Ruby
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript, end_language: ruby)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript, end_language: python)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript, end_language: java)
		#
	##

Answer.create(delta:"{\"0\":[\"\",\"0\"],\"1\":[\"E\",\"831\"],\"2\":[\"EV\",\"1039\"],\"3\":[\"EVE\",\"1094\"],\"4\":[\"EVER\",\"1287\"],\"5\":[\"EVERY\",\"1558\"],\"6\":[\"EVERYO\",\"2008\"],\"7\":[\"EVERYON\",\"2216\"],\"8\":[\"EVERYONE\",\"2303\"],\"9\":[\"EVERYONE \",\"2486\"],\"10\":[\"EVERYONE W\",\"2646\"],\"11\":[\"EVERYONE WI\",\"2759\"],\"12\":[\"EVERYONE WIN\",\"2934\"],\"13\":[\"EVERYONE WINS\",\"3071\"],\"14\":[\"EVERYONE WINS!\",\"3383\"]}",
							question_id:2,
							user_id: 1,
							vote_count: 50)

Answer.create(delta:"{\"0\":[\"[1,2,3].each do |number|\\n\\tputs number\\nend\",\"0\"],\"1\":[\"[1,2,3].feach do |number|\\n\\tputs number\\nend\",\"3103\"],\"2\":[\"[1,2,3].foeach do |number|\\n\\tputs number\\nend\",\"3299\"],\"3\":[\"[1,2,3].foreach do |number|\\n\\tputs number\\nend\",\"3411\"],\"4\":[\"[1,2,3].forach do |number|\\n\\tputs number\\nend\",\"4475\"],\"5\":[\"[1,2,3].forEach do |number|\\n\\tputs number\\nend\",\"4797\"],\"6\":[\"[1,2,3].forEach d |number|\\n\\tputs number\\nend\",\"6627\"],\"7\":[\"[1,2,3].forEach  |number|\\n\\tputs number\\nend\",\"6797\"],\"8\":[\"[1,2,3].forEach |number|\\n\\tputs number\\nend\",\"6987\"],\"9\":[\"[1,2,3].forEach( |number|\\n\\tputs number\\nend\",\"8436\"],\"10\":[\"[1,2,3].forEach(f |number|\\n\\tputs number\\nend\",\"9691\"],\"11\":[\"[1,2,3].forEach(fu |number|\\n\\tputs number\\nend\",\"10347\"],\"12\":[\"[1,2,3].forEach(fun |number|\\n\\tputs number\\nend\",\"10523\"],\"13\":[\"[1,2,3].forEach(func |number|\\n\\tputs number\\nend\",\"10643\"],\"14\":[\"[1,2,3].forEach(funct |number|\\n\\tputs number\\nend\",\"10853\"],\"15\":[\"[1,2,3].forEach(functi |number|\\n\\tputs number\\nend\",\"11077\"],\"16\":[\"[1,2,3].forEach(functio |number|\\n\\tputs number\\nend\",\"11213\"],\"17\":[\"[1,2,3].forEach(function |number|\\n\\tputs number\\nend\",\"11363\"],\"18\":[\"[1,2,3].forEach(function( |number|\\n\\tputs number\\nend\",\"12243\"],\"19\":[\"[1,2,3].forEach(function( number|\\n\\tputs number\\nend\",\"14469\"],\"20\":[\"[1,2,3].forEach(function( number\\n\\tputs number\\nend\",\"17251\"],\"21\":[\"[1,2,3].forEach(function( number \\n\\tputs number\\nend\",\"17603\"],\"22\":[\"[1,2,3].forEach(function( number )\\n\\tputs number\\nend\",\"18187\"],\"23\":[\"[1,2,3].forEach(function( number ){\\n\\tputs number\\nend\",\"19307\"],\"24\":[\"[1,2,3].forEach(function( number ){\\n\\tputsnumber\\nend\",\"22827\"],\"25\":[\"[1,2,3].forEach(function( number ){\\n\\tputnumber\\nend\",\"22963\"],\"26\":[\"[1,2,3].forEach(function( number ){\\n\\tpunumber\\nend\",\"23115\"],\"27\":[\"[1,2,3].forEach(function( number ){\\n\\tpnumber\\nend\",\"23276\"],\"28\":[\"[1,2,3].forEach(function( number ){\\n\\tnumber\\nend\",\"23476\"],\"29\":[\"[1,2,3].forEach(function( number ){\\n\\tcnumber\\nend\",\"23651\"],\"30\":[\"[1,2,3].forEach(function( number ){\\n\\tconumber\\nend\",\"24643\"],\"31\":[\"[1,2,3].forEach(function( number ){\\n\\tconnumber\\nend\",\"24851\"],\"32\":[\"[1,2,3].forEach(function( number ){\\n\\tconsnumber\\nend\",\"25307\"],\"33\":[\"[1,2,3].forEach(function( number ){\\n\\tconsonumber\\nend\",\"25483\"],\"34\":[\"[1,2,3].forEach(function( number ){\\n\\tconsolnumber\\nend\",\"25683\"],\"35\":[\"[1,2,3].forEach(function( number ){\\n\\tconsolenumber\\nend\",\"25734\"],\"36\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.number\\nend\",\"26340\"],\"37\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lnumber\\nend\",\"26605\"],\"38\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lonumber\\nend\",\"26771\"],\"39\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lognumber\\nend\",\"26979\"],\"40\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number\\nend\",\"27716\"],\"41\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number)\\nend\",\"30083\"],\"42\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\nend\",\"30899\"],\"43\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\nen\",\"32294\"],\"44\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\ne\",\"32483\"],\"45\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n\",\"32667\"],\"46\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n}\",\"34227\"],\"47\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n})\",\"34611\"],\"48\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n});\",\"35363\"]}",
							question_id:1,
							user_id: 1,
							vote_count: 50)

















