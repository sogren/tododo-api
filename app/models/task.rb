class Task < ActiveRecord::Base
  belongs_to :user

  enum status: [ :new_task, :done ]

  validates_presence_of :title, :status, :user_id
end
