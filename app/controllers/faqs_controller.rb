class FaqsController < ApplicationController

  def index
    @faqs = Faq.all
    @faqs.each do |faq|
      faq[:slug] = faq.gen_slug(faq[:question])
    end
  end

  def create

  end
end
