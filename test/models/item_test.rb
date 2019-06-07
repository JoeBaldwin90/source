require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "item has a title and image" do
    @item = items(:one)

    assert_equal @item.title.present?, true, "No title present"
    assert_equal @item.image.present?, true, "No image present"
    assert_equal @item.description.present?, true, "No description present"
  end

end
