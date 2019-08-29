class AddTimestamps < ActiveRecord::Migration[5.2]
    def change
        add_column :songs, :updated_at, :datetime
    end
end