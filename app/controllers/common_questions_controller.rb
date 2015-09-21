class CommonQuestionsController < ApplicationController
  
  class CommonQuestions
    def initialize(question, answer)
      @question = question
      @answer = answer
      @slug = @question.split(" ").join("-")
    end
  end
  
end
