require 'spec_helper'

describe EnoteClient::Resource do

  before(:all) do
    # NOTE: You should allready have user in main app to pass this tests
    @resource = EnoteClient::Resource.new("http://localhost:3000", "9b995e723802c0847edde3d46d462e9b")

    @note   = { "body"=>"Lorem ipsum", "title"=>"Test title" }
  end

  it "creates new note" do
    before = @resource.all.count
    @resource.create(@note)
    @resource.all.count.should > before
  end

  it "fetches all user's notes" do
    @resource.all.count.should >= 1
  end

  it "fetches user's note" do
    note = @resource.all.first
    @resource.find(note.id).title.should eql(note.title)
  end

  it "updates user's note" do
    note = @resource.all.first
    @resource.update({id: note.id, title: "TITLE"}).should be_true
  end

  it "deletes users's note" do
    before = @resource.all.count
    @resource.destroy(@resource.all.first.id)
    @resource.all.count.should < before
  end

end
