class AddDefaultDays < ActiveRecord::Migration[6.0]
  def change
    Day.create(id: 1, name: "Montag Mittag")
    Day.create(id: 2, name: "Montag Abend")
    Day.create(id: 3, name: "Dienstag Mittag")
    Day.create(id: 4, name: "Dienstag Abend")
    Day.create(id: 5, name: "Mittwoch Mittag")
    Day.create(id: 6, name: "Mittwoch Abend")
    Day.create(id: 7, name: "Donnerstag Mittag")
    Day.create(id: 8, name: "Donnerstag Abend")
    Day.create(id: 9, name: "Freitag Mittag")
    Day.create(id: 10, name: "Freitag Abend")
  end
end
