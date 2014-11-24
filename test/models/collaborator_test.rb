require 'test_helper'

class CollaboratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "uniqueness of collabortor" do
	collaborator = Collaborator.create!(wiki: wikis(:one), user: users(:one))
	duplicate = Collaborator.new(wiki: collaborator.wiki, user: collaborator.user)

    refute duplicate.save

    duplicate.user = users(:two)

    assert duplicate.save
  end
end



