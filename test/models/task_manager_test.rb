require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_id = task_manager.create({title: "TDD", description: "Learn to Test"})

    task = task_manager.find(task_id)

    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal task_id, task.id
  end

  def test_can_get_all_the_tasks
    task_manager.create({title: "Task1", description: "Description 1"})
    task_manager.create({title: "Task2", description: "Description 2"})

    tasks = task_manager.all

    assert tasks.kind_of?(Array)
    assert tasks[0].kind_of?(Task)
    assert_equal "Task1", tasks[0].title
    assert_equal "Task2", tasks[1].title
  end

  def test_can_find_a_task
    task_manager.create({title: "Task1", description: "Description 1"})
    task_id = task_manager.create({title: "Task2", description: "Description 2"})

    task = task_manager.find(task_id)

    assert_equal "Task2", task.title
  end

  def test_can_update_a_task
    task_id = task_manager.create({title: "Task1", description: "Description 1"})

    task_manager.update(task_id, {title: "Task1 Updated", description: "Description 1"})
    task = task_manager.find(task_id)

    assert_equal "Task1 Updated", task.title
  end

  def test_can_destroy_a_task
    task_id = task_manager.create({title: "Task1", description: "Description 1"})

    task_manager.destroy(task_id)
    tasks = task_manager.all

    assert_equal [], tasks
  end
end
