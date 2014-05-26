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
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby.name, end_language: python.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby.name, end_language: python.name)

			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make an each method?", start_language: ruby.name, end_language: java.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: ruby.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: ruby.name)
			
			# Python
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: python.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: python.name)
			
			# Java
			Question.create(category_id: enumerables.id, :query => "How do I make a forEach method?", start_language: javascript.name, end_language: java.name)
			Question.create(category_id: enumerables.id, :query => "How do I make a map method?", start_language: javascript.name, end_language: java.name)
		#
	##

	## logic
		# Start: Ruby
			# Javascript
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: python.name)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: python.name)
				
			# Java
				Question.create(category_id: logic.id, :query => "How do I make an if else statement?", start_language: javascript.name, end_language: java.name)
		#
	##

	## classes
		# Start: Ruby
			# Javascript
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: python.name)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a class like object?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: python.name)
				
			# Java
				Question.create(category_id: classes.id, :query => "How do I make a constructor function?", start_language: javascript.name, end_language: java.name)
		#
	##

	## methods
		# Start: Ruby
			# Javascript
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: python.name)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a method?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: python.name)
				
			# Java
				Question.create(category_id: methods.id, :query => "How do I make a function?", start_language: javascript.name, end_language: java.name)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: python.name)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: python.name)
				
			# Java
				Question.create(category_id: regex.id, :query => "How do I find a match using regular expressions?", start_language: javascript.name, end_language: java.name)
		#
	##


	## Regex
		# Start: Ruby
			# Javascript
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: javascript.name)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: python.name)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: ruby.name, end_language: java.name)

		# Start: Javascript
			# Ruby
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: ruby.name)

			# Python
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: python.name)
				
			# Java
				Question.create(category_id: inheritance.id, :query => "How does inheritance work?", start_language: javascript.name, end_language: java.name)
		#
	##

phil = User.create(:name => 'phil', :username => 'philipe', :email => 'phil@london.com', :password_digest => 'hello', :password => 'hello')
phil = User.create(:name => 'shaun', :username => 'shauny', :email => 'shuan@geever.com', :password_digest => 'world', :password => 'world')

# Answer.create(delta:"{\"0\":[\"\",\"0\"],\"1\":[\"E\",\"831\"],\"2\":[\"EV\",\"1039\"],\"3\":[\"EVE\",\"1094\"],\"4\":[\"EVER\",\"1287\"],\"5\":[\"EVERY\",\"1558\"],\"6\":[\"EVERYO\",\"2008\"],\"7\":[\"EVERYON\",\"2216\"],\"8\":[\"EVERYONE\",\"2303\"],\"9\":[\"EVERYONE \",\"2486\"],\"10\":[\"EVERYONE W\",\"2646\"],\"11\":[\"EVERYONE WI\",\"2759\"],\"12\":[\"EVERYONE WIN\",\"2934\"],\"13\":[\"EVERYONE WINS\",\"3071\"],\"14\":[\"EVERYONE WINS!\",\"3383\"]}",
# 							question_id:2,
# 							user_id: 1,
# 							vote_count: 50)

Answer.create(delta:"{\"0\":[\"[1,2,3].each do |number|\\n\\tputs number\\nend\",\"0\"],\"1\":[\"[1,2,3].feach do |number|\\n\\tputs number\\nend\",\"3103\"],\"2\":[\"[1,2,3].foeach do |number|\\n\\tputs number\\nend\",\"3299\"],\"3\":[\"[1,2,3].foreach do |number|\\n\\tputs number\\nend\",\"3411\"],\"4\":[\"[1,2,3].forach do |number|\\n\\tputs number\\nend\",\"4475\"],\"5\":[\"[1,2,3].forEach do |number|\\n\\tputs number\\nend\",\"4797\"],\"6\":[\"[1,2,3].forEach d |number|\\n\\tputs number\\nend\",\"6627\"],\"7\":[\"[1,2,3].forEach  |number|\\n\\tputs number\\nend\",\"6797\"],\"8\":[\"[1,2,3].forEach |number|\\n\\tputs number\\nend\",\"6987\"],\"9\":[\"[1,2,3].forEach( |number|\\n\\tputs number\\nend\",\"8436\"],\"10\":[\"[1,2,3].forEach(f |number|\\n\\tputs number\\nend\",\"9691\"],\"11\":[\"[1,2,3].forEach(fu |number|\\n\\tputs number\\nend\",\"10347\"],\"12\":[\"[1,2,3].forEach(fun |number|\\n\\tputs number\\nend\",\"10523\"],\"13\":[\"[1,2,3].forEach(func |number|\\n\\tputs number\\nend\",\"10643\"],\"14\":[\"[1,2,3].forEach(funct |number|\\n\\tputs number\\nend\",\"10853\"],\"15\":[\"[1,2,3].forEach(functi |number|\\n\\tputs number\\nend\",\"11077\"],\"16\":[\"[1,2,3].forEach(functio |number|\\n\\tputs number\\nend\",\"11213\"],\"17\":[\"[1,2,3].forEach(function |number|\\n\\tputs number\\nend\",\"11363\"],\"18\":[\"[1,2,3].forEach(function( |number|\\n\\tputs number\\nend\",\"12243\"],\"19\":[\"[1,2,3].forEach(function( number|\\n\\tputs number\\nend\",\"14469\"],\"20\":[\"[1,2,3].forEach(function( number\\n\\tputs number\\nend\",\"17251\"],\"21\":[\"[1,2,3].forEach(function( number \\n\\tputs number\\nend\",\"17603\"],\"22\":[\"[1,2,3].forEach(function( number )\\n\\tputs number\\nend\",\"18187\"],\"23\":[\"[1,2,3].forEach(function( number ){\\n\\tputs number\\nend\",\"19307\"],\"24\":[\"[1,2,3].forEach(function( number ){\\n\\tputsnumber\\nend\",\"22827\"],\"25\":[\"[1,2,3].forEach(function( number ){\\n\\tputnumber\\nend\",\"22963\"],\"26\":[\"[1,2,3].forEach(function( number ){\\n\\tpunumber\\nend\",\"23115\"],\"27\":[\"[1,2,3].forEach(function( number ){\\n\\tpnumber\\nend\",\"23276\"],\"28\":[\"[1,2,3].forEach(function( number ){\\n\\tnumber\\nend\",\"23476\"],\"29\":[\"[1,2,3].forEach(function( number ){\\n\\tcnumber\\nend\",\"23651\"],\"30\":[\"[1,2,3].forEach(function( number ){\\n\\tconumber\\nend\",\"24643\"],\"31\":[\"[1,2,3].forEach(function( number ){\\n\\tconnumber\\nend\",\"24851\"],\"32\":[\"[1,2,3].forEach(function( number ){\\n\\tconsnumber\\nend\",\"25307\"],\"33\":[\"[1,2,3].forEach(function( number ){\\n\\tconsonumber\\nend\",\"25483\"],\"34\":[\"[1,2,3].forEach(function( number ){\\n\\tconsolnumber\\nend\",\"25683\"],\"35\":[\"[1,2,3].forEach(function( number ){\\n\\tconsolenumber\\nend\",\"25734\"],\"36\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.number\\nend\",\"26340\"],\"37\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lnumber\\nend\",\"26605\"],\"38\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lonumber\\nend\",\"26771\"],\"39\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.lognumber\\nend\",\"26979\"],\"40\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number\\nend\",\"27716\"],\"41\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number)\\nend\",\"30083\"],\"42\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\nend\",\"30899\"],\"43\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\nen\",\"32294\"],\"44\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\ne\",\"32483\"],\"45\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n\",\"32667\"],\"46\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n}\",\"34227\"],\"47\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n})\",\"34611\"],\"48\":[\"[1,2,3].forEach(function( number ){\\n\\tconsole.log(number);\\n});\",\"35363\"]}",
							question_id:1,
							user_id: 1,
							vote_count: 50)

Answer.create(delta:"{\"0\":[\"numbers = [2,5,14,62,77,183]\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"0\"],\"1\":[\"vnumbers = [2,5,14,62,77,183]\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"2164\"],\"2\":[\"vanumbers = [2,5,14,62,77,183]\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"2275\"],\"3\":[\"varnumbers = [2,5,14,62,77,183]\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"2389\"],\"4\":[\"var numbers = [2,5,14,62,77,183]\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"2508\"],\"5\":[\"var numbers = [2,5,14,62,77,183];\\n\\ndef multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"3820\"],\"6\":[\"var numbers = [2,5,14,62,77,183];\\n\\nde multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"9420\"],\"7\":[\"var numbers = [2,5,14,62,77,183];\\n\\nd multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"9610\"],\"8\":[\"var numbers = [2,5,14,62,77,183];\\n\\n multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"9810\"],\"9\":[\"var numbers = [2,5,14,62,77,183];\\n\\nv multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"9908\"],\"10\":[\"var numbers = [2,5,14,62,77,183];\\n\\nva multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"9987\"],\"11\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"10124\"],\"12\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two (number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12020\"],\"13\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two =(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12220\"],\"14\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = (number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12348\"],\"15\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = f(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12570\"],\"16\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = fu(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12682\"],\"17\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = fun(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12803\"],\"18\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = func(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"12915\"],\"19\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = funct(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"13170\"],\"20\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = functi(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"13189\"],\"21\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = functio(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"13234\"],\"22\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number)\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"13291\"],\"23\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) \\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"15868\"],\"24\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tnumber*2\\nend\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"16275\"],\"25\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tnumber*2\\nen\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"19107\"],\"26\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tnumber*2\\ne\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"19299\"],\"27\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tnumber*2\\n\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"19459\"],\"28\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"20083\"],\"29\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\trnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"22163\"],\"30\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\trenumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"22251\"],\"31\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tretnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"22386\"],\"32\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tretunumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"22506\"],\"33\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"22609\"],\"34\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\tretunumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"23115\"],\"35\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"23635\"],\"36\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturnnumber*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"23739\"],\"37\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nend\",\"23867\"],\"38\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\nen\",\"29067\"],\"39\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\ne\",\"29269\"],\"40\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\\n\",\"29298\"],\"41\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number)\",\"29330\"],\"42\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(number\",\"29361\"],\"43\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(numbe\",\"29392\"],\"44\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(numb\",\"29422\"],\"45\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(num\",\"29453\"],\"46\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(nu\",\"29484\"],\"47\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(n\",\"29514\"],\"48\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two(\",\"29545\"],\"49\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_two\",\"29577\"],\"50\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_tw\",\"29606\"],\"51\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_t\",\"29637\"],\"52\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by_\",\"29667\"],\"53\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_by\",\"29698\"],\"54\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_b\",\"29732\"],\"55\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply_\",\"29762\"],\"56\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultiply\",\"29791\"],\"57\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultipl\",\"29823\"],\"58\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmultip\",\"29855\"],\"59\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmulti\",\"29885\"],\"60\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmult\",\"29916\"],\"61\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmul\",\"29945\"],\"62\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tmu\",\"29976\"],\"63\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\tm\",\"30007\"],\"64\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\\t\",\"30040\"],\"65\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\\n\",\"30068\"],\"66\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number|\",\"30098\"],\"67\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |number\",\"30339\"],\"68\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |numbe\",\"30538\"],\"69\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |numb\",\"30569\"],\"70\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |num\",\"30599\"],\"71\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |nu\",\"30630\"],\"72\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |n\",\"30661\"],\"73\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do |\",\"30692\"],\"74\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do \",\"30723\"],\"75\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map do\",\"30752\"],\"76\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map d\",\"30897\"],\"77\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map \",\"31081\"],\"78\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map\",\"31241\"],\"79\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(\",\"32417\"],\"80\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map()\",\"32603\"],\"81\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(m)\",\"33209\"],\"82\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(mu)\",\"34242\"],\"83\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(mul)\",\"34570\"],\"84\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(mult)\",\"34785\"],\"85\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multi)\",\"34858\"],\"86\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multip)\",\"35019\"],\"87\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multipl)\",\"35186\"],\"88\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply)\",\"35395\"],\"89\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_)\",\"35842\"],\"90\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_b)\",\"36217\"],\"91\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by)\",\"36442\"],\"92\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by_)\",\"36793\"],\"93\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by_t)\",\"37042\"],\"94\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by_tw)\",\"37162\"],\"95\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by_two)\",\"37233\"],\"96\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n}\\n\\nnumbers.map(multiply_by_two);\",\"40658\"],\"97\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2\\n};\\n\\nnumbers.map(multiply_by_two);\",\"42033\"],\"98\":[\"var numbers = [2,5,14,62,77,183];\\n\\nvar multiply_by_two = function(number) {\\n\\treturn number*2;\\n};\\n\\nnumbers.map(multiply_by_two);\",\"44338\"]}",
							question_id: 
							user_id: 1,
							vote_count: 50)

















