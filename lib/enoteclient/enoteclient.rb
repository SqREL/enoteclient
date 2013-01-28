module EnoteClient

  def enote_config params
    @client = EnoteClient::Resource.new(params)
  end
  alias :enote :enote_config

  def fetch_all_notes
    @client.all
  end
  alias :get_all_notes :fetch_all_notes
  alias :all_notes :fetch_all_notes

  def update note
    @client.update note
  end
  alias :update_note :update

  def destroy_note id
    @client.destroy id
  end
  alias :destroy_note_with_id :destroy_note
  alias :delete_note_with_id :destroy_note
  alias :delete_note :destroy_note

  def fetch_note id
    @client.show id
  end
  alias :find_note :fetch_note
  alias :find_note_by_id :fetch_note
  alias :fetch_note_with_id :fetch_note
  alias :get_note :fetch_note
  alias :get_note_by_id :fetch_note

  def create note
    @client.create note
  end
  alias :create_note :create
  alias :new_note :create

end
