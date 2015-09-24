class Task < ActiveRecord::Base

  validates_presence_of :description, :due_date
  belongs_to :project

end
