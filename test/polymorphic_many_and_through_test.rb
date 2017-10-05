require 'test_helper'

class MadeIt::PolymorphicManyAndThroughTest < ActiveSupport::TestCase
  def test_to_create_by_polymorphic_many_and_through_method_with_externs
    group_test = Group.create!(name: 'admin')
    extern_test = Extern.create!(login: 'aExternal')
    group_test.externs << extern_test

    assert_equal extern_test.groups.first, group_test
    assert_equal group_test.groups_relations.find_by(relationable_type: 'Extern', relationable_id: extern_test.id).relationable, extern_test
  end
 
  def test_to_create_by_polymorphic_many_and_through_method_with_users
    group_test = Group.create!(name: 'modo')
    user_test = User.create!(login: 'aUser')
    group_test.users << user_test

    assert_equal user_test.groups.first, group_test
    assert_equal group_test.groups_relations.find_by(relationable_type: 'User', relationable_id: user_test.id).relationable, user_test
  end
end