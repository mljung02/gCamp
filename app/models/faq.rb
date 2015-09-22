class Faq < ActiveRecord::Base
  
  def gen_slug(question)
    question.split(' ').join('-')
  end
  
end