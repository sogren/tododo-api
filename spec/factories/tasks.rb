FactoryGirl.define do
  factory :task do
    title 'Task title'
    content 'Task content'
    user
  end
end
