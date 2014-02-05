#This code works just as well but does not create the attr_accessor_with_history class
#class Foo
#	attr_accessor :bar
#
#	def initialize
#		@bar = bar
#		@@history = [nil]
#	end
#
#	def bar= (bar)
#		@bar = bar
#		@@history.push(bar)
#	end
#
#	def bar_history
#		@@history
#	end		
#end

#code sampled from http://stackoverflow.com/questions/11604149/initializing-attr-accessor-like-method-with-history

class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name 			#creates attributes getter, allows read, not write
		attr_reader attr_name + "_history"	#append "_histor" onto our "bar" variable or whatever history we want (could be anything)
		class_eval %Q{				#evaluates the string in the context of the module
			def #{attr_name}= (new_value)	#creates setter
				@#{attr_name}_history = [nil] if @#{attr_name}_history.nil?	#checks if the history is empty or not at first
				@#{attr_name}_history << @#{attr_name} = new_value		#appends whatever history (in our case bar_history) to the end of history
			end	
		}
	end
end

class Foo
	attr_accessor_with_history :bar
end

class SomeOtherClass
	attr_accessor_with_history :foo
	attr_accessor_with_history :bar
end




f = Foo.new
f.bar = 3
puts f.bar
f.bar = :wowzo
puts f.bar
f.bar = 'boo!'
puts f.bar
p f.bar_history

f = Foo.new
f.bar = 4
p f.bar_history


f = Foo.new
f.bar = 1
f.bar = 2
p f.bar_history
