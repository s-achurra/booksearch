require 'rspec'
require 'byebug'
require 'spec_helper'
require 'booksearch'
require 'default_library'

describe 'Library' do

  before do
    @library = Library.new
  end

  describe 'Setup' do

    it "initializes with a default library" do
      expect(@library.index.class).to be(Hash)
    end

    it "initializes a new library if given an argument" do
      new_library = Library.new($mini_library)

      expect(new_library.index).to_not eq(@library.index)
    end

  end

  describe "Search" do

    it "returns results when matching titles" do
      expect(@library.search(["Paradox"])).to eq("#<Set: {\"bk109: Paradox Lost\"}>")
    end

    it "returns results when matching descriptions" do
      expect(@library.search(["zombies"])).to eq("#<Set: {\"bk102: Midnight Rain\"}>")
    end

    it "matches with multiple criteria" do
      expect(@library.search(["zombies", "Paradox"])).to eq("#<Set: {\"bk102: Midnight Rain\", \"bk109: Paradox Lost\"}>")
    end

  end

end
