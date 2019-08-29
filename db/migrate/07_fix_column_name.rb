class FixColumnName < ActiveRecord::Migration[5.2]
    def change
        rename_column :songs, :slug, :slug_record
        rename_column :artists, :slug, :slug_record
    end
end