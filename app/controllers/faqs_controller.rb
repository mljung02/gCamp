class FaqsController < ApplicationController

  def index
    @faqs = Faq.all
    @faqs.each do |faq|
      faq[:slug] = gen_slug(faq[:question])
    end
  end

  def create

  end


  private

  def gen_slug(question)
    question.split(' ').join('-')
  end
end
