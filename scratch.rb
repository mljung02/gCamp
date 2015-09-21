class CommonQuestions
  def initialize(question, answer)
    @question = question
    @answer = answer
    @slug = @question.split(" ").join("-")
  end
end

q1 = CommonQuestions.new("I can haz Cheeseburger?", "No, fatty.")

p q1