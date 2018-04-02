require 'rails_helper'

describe Category do
  describe 'validations' do
    it 'should have a title' do
      category = Category.new

      expect(category).to be_invalid
    end
  end
end
