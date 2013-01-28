module EnoteClient
  require 'active_resource'
  require 'json'

  class Resource
    attr_reader :url, :api_key

    def initialize params
      @api_key = params[:api_key]

      Note.site = params[:url]
    end

    def all
      Note.all(params: { api_key: api_key })
    end

    def edit(params)
      note = Note.find(params[:id], params: { api_key: api_key })
      note.load(params)

      # Make sure, that you transmit only those params, to avoid
      # ActiveModel::MassAssignmentSecurity::Error (assigning created_at and updated_at)
      note.attributes.slice!(:id, :title, :body)

      note.prefix_options = { api_key: api_key }
      note.save
    end
    alias :update :edit

    def destroy(id)
      note = Note.find(id, params: { api_key: api_key })

      note.prefix_options = { api_key: api_key }
      note.destroy
    end
    alias :delete :destroy

    def show(id)
      Note.find(id, params: { api_key: api_key })
    end
    alias :find :show

    def new(note)
      note = Note.new(note)
      note.prefix_options = { api_key: api_key }
      note.save
    end
    alias :create :new
  end
end
