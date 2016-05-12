require 'yaml/store'

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    table.insert(task)
  end

  def table
    database.from(:tasks).order(:id)
  end

  def all
    table.to_a.map{|data| Task.new(data)}
  end

  def locate_task(id)
    table.where(:id => id)
  end

  def raw_task(id)
    locate_task(id).to_a.first
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task)
    locate_task(id).update(task)
  end

  def destroy(id)
    locate_task(id).delete
  end

  def delete_all
    table.delete
  end
end
