require 'test_helper'

describe Customer do

  let(:sarah) { customers(:sarah) }
  let(:trevor) { customers(:trevor) }
  let(:yasmine) { customers(:yasmine) }

  describe 'validations' do
    it 'is a valid customer' do
      expect(sarah).must_be :valid?
    end

    it 'is an invalid customer because of duplicate usernames' do
      expect(trevor).must_be :invalid?
      expect(trevor.errors[:username]).must_include 'has already been taken'
    end

    it 'is an invalid customer because of no last name' do
      expect(yasmine).must_be :invalid?
      expect(yasmine.errors[:last_name]).must_include "can't be blank"
    end
  end

end
