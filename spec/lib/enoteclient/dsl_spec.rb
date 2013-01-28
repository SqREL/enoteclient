require 'spec_helper'
include EnoteClient

describe EnoteClient do

  before(:all) do
    # NOTE: You should allready have user in main app to pass this tests
    enote url: "http://enote-app.herokuapp.com",
          api_key: "9bb899bcffd6c5a0edb5c101bf86d366"

    @note   = { "body"=>"Lorem ipsum", "title"=>"Test title" }
  end

  it "creates new note" do
    before = all_notes.count
    create @note
    all_notes.count.should > before
  end

  it "fetches all user's notes" do
    all_notes.count.should >= 1
  end

  it "fetches user's note" do
    note = all_notes.first
    find_note_by_id(note.id).title.should eql(note.title)
  end

  it "updates user's note" do
    note = all_notes.first
    update_note({id: note.id, title: "TITLE"}).should be_true
  end

  it "deletes users's note" do
    before = all_notes.count
    delete_note all_notes.first.id
    all_notes.count.should < before
  end

end
