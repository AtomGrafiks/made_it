require 'test_helper'

class MadeIt::HasManyThroughTest < ActiveSupport::TestCase
  def test_to_create_by_has_many_through_method
    u = User.create!(login: 'atom')
    u.projects << Project.create!(name: 'MadeIt')
    assert_equal u.projects.first, Project.find_by(name: 'MadeIt')
  end
 
  def test_a_has_many_through_method_already_created
    u = User.create!(login: 'atom')
    u.projects << Project.create!(name: 'MadeIt')
    assert_equal Project.find_by(name: 'MadeIt').users.first, User.find_by(login: 'atom')
  end
end