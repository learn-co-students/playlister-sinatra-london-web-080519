class AddSlugToSongs <ActiveRecord::Migration[5.2]
    def change
        add_column :songs, :slug, :string
    end
end