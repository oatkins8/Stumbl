class Calculator
  GPA_GRADES = {
    'A' => 4.0,
    'A-' => 3.7,
    'B+' => 3.3,
    'B' => 3.0,
    'B-' => 2.7,
    'C+' => 2.3,
    'C' => 2.0,
    'C-' => 1.7,
    'D+' => 1.3,
    'D' => 1.0,
    'D-' => 0.7,
    'E+' => 0.5,
    'E' => 0.2,
    'E-' => 0.1,
    'F' => 0.0,
    'U' => -1.0
  }

  attr_reader :name, :grades

  def initialize(name, grades)
    @name = name
    @grades = grades.is_a?(String) ? grades.split(' ') : grades
  end

  def gpa
    scores = grades.map { |grade| GPA_GRADES[grade.to_s] }
    begin
      (scores.sum / grades.length).round(1)
    rescue TypeError => e
      e
    end
  end

  def announcement
    return unless gpa

    "#{name} scored an average of #{gpa}"
  end
end

ollie = Calculator.new("Ollie", ['B+', 'A', :X])
p ollie.gpa #<TypeError: nil can't be coerced into Float>

# Do not edit below here ##################################################

# tests = [
#   { in: { name: 'Andy',  grades: ["A"] }, out: { gpa: 4, announcement: "Andy scored an average of 4.0"  } },
#   { in: { name: 'Beryl',  grades: ["A", "B", "C"] }, out: { gpa: 3, announcement: "Beryl scored an average of 3.0"  } },
#   { in: { name: 'Chris',  grades: ["B-", "C+"] }, out: { gpa: 2.5, announcement: "Chris scored an average of 2.5"  } },
#   { in: { name: 'Dan',  grades: ["A", "A-", "B-"] }, out: { gpa: 3.5, announcement: "Dan scored an average of 3.5"  } },
#   { in: { name: 'Emma',  grades: ["A", "B+", "F"] }, out: { gpa: 2.4, announcement: "Beryl scored an average of 2.4"  } },
#   { in: { name: 'Frida',  grades: ["E", "E-"] }, out: { gpa: 0.3, announcement: "Beryl scored an average of 0.3"  } },
#   { in: { name: 'Gary',  grades: ["U", "U", "B+"] }, out: { gpa: 0.4, announcement: "Beryl scored an average of 0.4"  } },
# ]

# # how_might_you_do_these = [
# #   { in: { name: 'Non-grades',  grades: ["N"] } },
# #   { in: { name: 'Non-strings',  grades: ["A", :B] } },
# #   { in: { name: 'Empty',  grades: [] } },
# #   { in: { name: 'Numbers',  grades: [1, 2] } },
# #   { in: { name: 'Passed a string',  grades: "A A-" } },
# # ]

# tests.each do |test|
#   user = Calculator.new(test[:in][:name], test[:in][:grades])

#   puts "#{'-' * 10} #{user.name} #{'-' * 10}"

#   [:gpa, :announcement].each do |method|
#     result = user.public_send(method)
#     expected = test[:out][method]

#     if result == expected
#       puts "✅ #{method.to_s.upcase}: #{result}"
#     else
#       puts "❌ #{method.to_s.upcase}: expected '#{expected}' but got '#{result}'"
#     end
#   end

#   puts
# end
