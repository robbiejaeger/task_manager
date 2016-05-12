require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_assigns_attributes_correctly
    task = Task.new({
      "id" => 1,
      "title" => "New Task",
      "description" => "Task Description"
      })

    assert_equal 1, task.id
    assert_equal "New Task", task.title
    assert_equal "Task Description", task.description
  end

end
