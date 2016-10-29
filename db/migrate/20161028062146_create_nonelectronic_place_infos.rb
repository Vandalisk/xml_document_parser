class CreateNonelectronicPlaceInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :nonelectronic_place_infos do |t|
      t.string :summarizing_place
      t.datetime :summarizing_date_time
      t.references :purchase, index: true, foreign_key: true

      t.timestamps
    end
  end
end
